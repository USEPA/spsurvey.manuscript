# figure 8

## set write_out
write_out <- FALSE ## set = TRUE if wanting to write images
## WARNING prior images will be overwritten

## load package
library(spsurvey)
set.seed(5)

## set some graphical parameters
ht <- 3
wid <- 4 / 3 * ht
base_cex <- 0.75
main_cex <- 1
lcm_val <- 3.2

## run grts algorithm
eqprob_illinois <- grts(Illinois_River, n_base = 25)

# make plot
if (write_out) {
  jpeg(filename = "inst/rticle/images/grts_illinois.jpeg", width = wid, height = ht, units = "in", res = 600)
  plot(eqprob_illinois, sframe = Illinois_River, pch = 19, key.pos = 4, key.width = lcm(lcm_val), cex = base_cex, cex.main = main_cex)
  dev.off()
}

set.seed(5)
## run grts algorithm
eqprob_ontario <- grts(Lake_Ontario, n_base = 40)

# make plot
if (write_out) {
  jpeg(filename = "inst/rticle/images/grts_ontario.jpeg", width = wid, height = ht, units = "in", res = 600)
  plot(eqprob_ontario, sframe = Lake_Ontario, pch = 19, key.pos = 4, key.width = lcm(lcm_val), cex = base_cex, cex.main = main_cex)
  dev.off()
}
