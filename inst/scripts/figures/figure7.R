# figure 6

## set write_out
write_out <- FALSE ## set = TRUE if wanting to write images
## WARNING prior images will be overwritten

## load packages
library(ggplot2)
library(cowplot)

## set some graphical parameters
ht <-  4
wid <- 4 / 3 * ht

## simulation summary for AP
cat_results <- read.csv("inst/output/cat_results.csv")

## figure 6a
cat_spb <- ggplot(cat_results, mapping = aes(x = algorithm, y = spb)) +
  geom_boxplot() +
  labs(x = "Algorithm", y = "Spatial Balance") +
  theme_minimal_grid()

if (write_out) {
  ggsave(filename = "inst/rticle/images/cat_spb.jpeg", plot = cat_spb, width = wid, height = ht, units = "in", dpi = 600)
}

## figure 6b
cat_moe <- ggplot(cat_results, mapping = aes(x = algorithm, y = 1.96 * StdError.P)) +
  geom_boxplot() +
  labs(x = "Algorithm (Variance Estimator)", y = "Margin of Error") +
  scale_x_discrete(labels = c("GRTS (Local)", "SRS (SRS)")) +
  theme_minimal_grid()

if (write_out) {
  ggsave(filename = "inst/rticle/images/cat_moe.jpeg", plot = cat_moe, width = wid, height = ht, units = "in", dpi = 600)
}
