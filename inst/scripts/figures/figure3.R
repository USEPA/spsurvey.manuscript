# figure 3

## set write_out
write_out <- FALSE ## set = TRUE if wanting to write images
## WARNING prior images will be overwritten

## load package and set seed
library(spsurvey)
set.seed(5)

## set some graphical parameters
ht <- 3
wid <- 4 / 3 * ht
base_cex <- 0.75
main_cex <- 1
lcm_val <- 3.2

## run grts algorithm
eqprob_rho <- grts(NE_Lakes, n_base = 50, n_over = 10)

## figure 3a
if (write_out) {
  jpeg(filename = "inst/rticle/images/base_over.jpeg", width = wid, height = ht, units = "in", res = 600)
  sp_plot(eqprob_rho, key.pos = 4, key.width = lcm(lcm_val), cex = base_cex, cex.main = main_cex)
  dev.off()
}

## figure 3b
if (write_out) {
  jpeg(filename = "inst/rticle/images/base.jpeg", width = wid, height = ht, units = "in", res = 600)
  sp_plot(eqprob_rho, siteuse = "Base", key.pos = 4, key.width = lcm(lcm_val), cex = base_cex, cex.main = main_cex)
  dev.off()
}
