# figure 5

## set write_out
write_out <- FALSE ## set = TRUE if wanting to write images
## WARNING prior images will be overwritten

## load packages
library(spsurvey)
library(spsurvey.manuscript)

## set some graphical parameters
ht <- 3
wid <- 4 / 3 * ht
base_cex <- 0.75
main_cex <- 1

data("NLA12")

# make atrazine plot
jpeg(filename = "inst/rticle/images/atrazine.jpeg", width = wid, height = ht, units = "in", res = 600)
sp_plot(NLA12, formula = ~ AP, key.pos = 4, cex = base_cex, cex.main = 1.15 * main_cex)
dev.off()

# make benthic mmi plot
jpeg(filename = "inst/rticle/images/bmmi.jpeg", width = wid, height = ht, units = "in", res = 600)
sp_plot(NLA12, formula = ~ BMMI, key.pos = 4, cex = base_cex, cex.main = 1.15 * main_cex)
dev.off()
