# figure 7

## set write_out
write_out <- FALSE ## set = TRUE if wanting to write images
## WARNING prior images will be overwritten

## load packages
library(tidyverse)
library(cowplot)

## set some graphical parameters
ht <-  4
wid <- 4 / 3 * ht

## simulation summary for AP
cont_results <- read.csv("inst/output/cont_results.csv")

## figure 7a
cont_spb <- ggplot(cont_results, mapping = aes(x = algorithm, y = spb)) +
  geom_boxplot() +
  labs(x = "Algorithm", y = "Spatial Balance") +
  theme_minimal_grid()

if (write_out) {
  ggsave(filename = "inst/rticle/images/cont_spb.jpeg", plot = cont_spb, width = wid, height = ht, units = "in", dpi = 600)
}

## figure 7b
cont_moe <- ggplot(cont_results, mapping = aes(x = algorithm, y = 1.96 * StdError)) +
  geom_boxplot() +
  labs(x = "Algorithm (Variance Estimator)", y = "Margin of Error") +
  scale_x_discrete(labels = c("GRTS (Local)", "SRS (SRS)")) +
  theme_minimal_grid()

if (write_out) {
  ggsave(filename = "inst/rticle/images/cont_moe.jpeg", plot = cont_moe, width = wid, height = ht, units = "in", dpi = 600)
}
