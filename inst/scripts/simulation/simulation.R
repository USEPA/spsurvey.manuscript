# load packages
library("dplyr")
library("spsurvey")
library("parallel")
n_clusters <- detectCores()
cluster <- makeCluster(n_clusters)

# set write_out
write_out <- TRUE ## set = TRUE if wanting to write out results
## WARNING prior results will be overwritten

# put data in global environment
data("NLA12")

# store as sp_frame object
NLA12 <- sp_frame(NLA12)

# summary of response variables
summary(NLA12, formula = ~ AP + BMMI)

# plot of response variables
plot(NLA12, formula = ~ AP + BMMI)

# write function
perform_sim <- function(seed, data, variable, sample_size, cat, ...) {

  # set reproducible seed
  set.seed(seed)

  # set new data
  data <- data[, variable, drop = FALSE] %>%
    na.omit()

  # grts process
  grts_design <- grts(data, n_base = sample_size, ...)
  grts_spbalance <- sp_balance(grts_design$sites_base, data, ...)

  # irs process
  irs_design <- irs(data, n_base = sample_size, ...)
  irs_spbalance <- sp_balance(irs_design$sites_base, data, ...)

  if (cat) { # short for categorical variable

    # take true mean
    true_mean <- sum(data[[variable]] == "Y", na.rm = TRUE) / nrow(data)

    # use spsurvey to analyze data
    grts_analysis <- cat_analysis(
      grts_design$sites_base,
      siteID = "siteID",
      vars = variable,
      weight = "wgt",
      ...
    )

    # filter the analysis output and compute summary statistics
    grts_output <- grts_analysis %>%
      filter(Category == "Y") %>%
      select(Estimate.P, StdError.P, LCB95Pct.P, UCB95Pct.P) %>%
      mutate(
        Estimate.P = Estimate.P / 100,
        StdError.P = StdError.P / 100,
        LCB95Pct.P = LCB95Pct.P / 100,
        UCB95Pct.P = UCB95Pct.P / 100,
        spb = grts_spbalance[["value"]],
        algorithm = "GRTS",
        true_mean = true_mean,
        cover = 1 * (LCB95Pct.P <= true_mean & true_mean <= UCB95Pct.P),
        seed = seed
      )

    # use spsurvey to analyze data
    irs_analysis <- cat_analysis(
      irs_design$sites_base,
      siteID = "siteID",
      vars = variable,
      weight = "wgt",
      vartype = "SRS",
      fpc = nrow(data),
      ...
    )

    # filter the analysis output and compute summary statistics
    irs_output <- irs_analysis %>%
      filter(Category == "Y") %>%
      select(Estimate.P, StdError.P, LCB95Pct.P, UCB95Pct.P) %>%
      mutate(
        Estimate.P = Estimate.P / 100,
        StdError.P = StdError.P / 100,
        LCB95Pct.P = LCB95Pct.P / 100,
        UCB95Pct.P = UCB95Pct.P / 100,
        spb = irs_spbalance[["value"]],
        algorithm = "SRS",
        true_mean = true_mean,
        cover = 1 * (LCB95Pct.P <= true_mean & true_mean <= UCB95Pct.P),
        seed = seed
      )

  } else {

    # take true mean
    true_mean <- mean(data[[variable]], na.rm = TRUE)


    # use spsurvey to analyze data
    grts_analysis <- cont_analysis(
      grts_design$sites_base,
      siteID = "siteID",
      vars = variable,
      weight = "wgt",
      statistics = "Mean",
      ...
    )

    # filter the analysis output and compute summary statistics
    grts_output <- grts_analysis$Mean %>%
      select(Estimate, StdError, LCB95Pct, UCB95Pct) %>%
      mutate(
        spb = grts_spbalance[["value"]],
        algorithm = "GRTS",
        true_mean = true_mean,
        cover = 1 * (LCB95Pct <= true_mean & true_mean <= UCB95Pct),
        seed = seed
      )


    # use spsurvey to analyze data
    irs_analysis <- cont_analysis(
      irs_design$sites_base,
      siteID = "siteID",
      vars = variable,
      weight = "wgt",
      vartype = "SRS",
      fpc = nrow(data),
      statistics = "Mean",
      ...
    )

    # filter the analysis output and compute summary statistics
    irs_output <- irs_analysis$Mean %>%
      select(Estimate, StdError, LCB95Pct, UCB95Pct) %>%
      mutate(
        spb = irs_spbalance[["value"]],
        algorithm = "SRS",
        true_mean = true_mean,
        cover = 1 * (LCB95Pct <= true_mean & true_mean <= UCB95Pct),
        seed = seed
      )

  }

  # combine the results
  output <- rbind(grts_output, irs_output)

  # null row names (personal preference)
  row.names(output) <- NULL

  # return output
  output
}

# run the simulation
clusterEvalQ(cluster, library("dplyr"))
clusterEvalQ(cluster, library("spsurvey"))

# set seeds and sample sizes
seeds <- 1:2000
sample_size <- 250

# cat results
cat_results <- parLapply(cluster, seeds, perform_sim, NLA12, "AP", sample_size, cat = TRUE) %>%
  bind_rows()

## cont results
cont_results <- parLapply(cluster, seeds, perform_sim, NLA12, "BMMI", sample_size, cat = FALSE) %>%
  bind_rows()

## stop the cluster
stopCluster(cluster)

# cat summaries
cat_summaries <- cat_results %>%
    group_by(algorithm) %>%
    summarize(
      mbias = mean(Estimate.P - true_mean),
      mstderr = mean(StdError.P),
      rmse = sqrt(mean((Estimate.P - true_mean)^2)),
      coverage = mean(cover),
      msbp = mean(spb)
    )

# cont summaries
cont_summaries <- cont_results %>%
  group_by(algorithm) %>%
  summarize(
    mbias = mean(Estimate - true_mean),
    mstderr = mean(StdError),
    rmse = sqrt(mean((Estimate - true_mean)^2)),
    coverage = mean(cover),
    msbp = mean(spb)
  )

# write out
if (write_out) {
  write.csv(cont_results, "inst/output/cont_results.csv", row.names = FALSE)
  write.csv(cont_summaries, "inst/output/cont_summaries.csv", row.names = FALSE)
  write.csv(cat_results, "inst/output/cat_results.csv", row.names = FALSE)
  write.csv(cat_summaries, "inst/output/cat_summaries.csv", row.names = FALSE)
}

# write to .Rda files
library(devtools)
use_data(cont_results, overwrite = TRUE)
use_data(cont_summaries, overwrite = TRUE)
use_data(cat_results, overwrite = TRUE)
use_data(cat_summaries, overwrite = TRUE)
