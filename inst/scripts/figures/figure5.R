# figure 4

## set write_out
write_out <- FALSE ## set = TRUE if wanting to write images
## WARNING prior images will be overwritten

## load package
library(spsurvey)

# set some graphical parameters
ht <- 3
wid <- 4 / 3 * ht

## compute bmmi estimates
bmmi <- cont_analysis(
  NLA_PNW,
  siteID = "SITE_ID",
  vars = "BMMI",
  weight = "WEIGHT",
  statistic = "CDF"
)

# make cdf plot
if (write_out) {
  jpeg(filename = "inst/rticle/images/bmmi_cdf.jpeg", width = wid, height = ht, units = "in", res = 600)
  cdf_plot(bmmi$CDF)
  dev.off()
}
