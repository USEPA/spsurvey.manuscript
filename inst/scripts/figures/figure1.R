# figure 1

## set write_out
write_out <- FALSE ## set = TRUE if wanting to write images
## WARNING prior images will be overwritten

## load package
library(spsurvey)

## set some graphical parameters
ht <- 3
wid <- 4 / 3 * ht
base_cex <- 0.75
main_cex <- 1
lcm_val <- 3.2

## figure 1a
if (write_out) {
  jpeg(filename = "inst/rticle/images/elevcat.jpeg", width = wid, height = ht, units = "in", res = 600)
  sp_plot(NE_Lakes, formula = ~ ELEV_CAT, key.width = lcm(lcm_val), key.pos = 4, cex = base_cex, cex.main = main_cex)
  dev.off()
}

## figure 1b
if (write_out) {
  jpeg(filename = "inst/rticle/images/elevcat_areacat.jpeg", width = wid, height = ht, units = "in", res = 600)
  sp_plot(NE_Lakes, formula = ~ ELEV_CAT:AREA_CAT, key.width = lcm(lcm_val),
       key.pos = 4, cex = base_cex, cex.main = main_cex)
  dev.off()
}
