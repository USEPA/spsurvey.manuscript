# Figure 2

## set write_out
write_out <- FALSE ## set = TRUE if wanting to write images
## WARNING prior images will be overwritten

## load packages
library(maps)
library(ggplot2)

# set some graphical parameters
ht <-  4
wid <- 4 / 3 * ht

## grid preliminaries ---------------------------------------------------------
us_states <- map_data("state")
oregon_data <- subset(us_states, region == "oregon")
n_pop <- 5
n_samp <- 3
pop_long <- c(-122.75, -120.80, -117.42, -119.54, -122.08)
pop_lat <- c(42.37, 45.50, 44.25, 43.29, 42.25)
population_data <- data.frame(lat = pop_lat, long = pop_long)
min_long <- min(oregon_data$long)
max_long <- max(oregon_data$long)
min_lat <- min(oregon_data$lat)
max_lat <- max(oregon_data$lat)
scaled_oregon_data <- data.frame(lat = (oregon_data$lat - min_lat) / (max_lat - min_lat), long = (oregon_data$long - min_long) / (max_long - min_long))
scaled_population_data <- data.frame(lat = (population_data$lat - min_lat) / (max_lat - min_lat), long = (population_data$long - min_long) / (max_long - min_long))
low <- 0
q1 <- 0.25
mid <- 0.5
q3 <- 0.75
high <- 1
q18 <- 1 / 8
q38 <- 3 / 8
q58 <- 5 / 8
q78 <- 7 / 8

# figure 2a     ----------------------------------------------------------------
annotate_size <- 30
grts_level1 <- ggplot() +
  geom_path(scaled_oregon_data, mapping = aes(x = long, y = lat), col = "black") +
  geom_point(data = scaled_population_data, mapping = aes(x = long, y = lat), size = 5) +
  geom_segment(aes(x = low, xend = high, y = low, yend = low), linetype = "dashed", col = "black") +
  geom_segment(aes(x = low, xend = high, y = mid, yend = mid), linetype = "dashed", col = "black") +
  geom_segment(aes(x = low, xend = high, y = high, yend = high), linetype = "dashed", col = "black") +
  geom_segment(aes(x = low, xend = low, y = low, yend = high), linetype = "dashed", col = "black") +
  geom_segment(aes(x = mid, xend = mid, y = low, yend = high), linetype = "dashed", col = "black") +
  geom_segment(aes(x = high, xend = high, y = low, yend = high), linetype = "dashed", col = "black") +
  annotate(geom = "text", x = q1, y = q1, label = "2", size = annotate_size, col = "black") +
  annotate(geom = "text", x = q1, y = q3, label = "1", size = annotate_size, col = "black") +
  annotate(geom = "text", x = q3, y = q3, label = "3", size = annotate_size, col = "black") +
  annotate(geom = "text", x = q3, y = q1, label = "0", size = annotate_size, col = "black") +
  theme(axis.text = element_blank(),
        axis.title = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        panel.background = element_blank())

## write out figure 2a
if (write_out) {
  ggsave(filename = "inst/rticle/images/grts_level1.jpeg", plot = grts_level1, width = wid, height = ht, units = "in", dpi = 600)
}

## figure 2b     ----------------------------------------------------------------
annotate_size <- 15
grts_level2 <- ggplot() +
  geom_path(scaled_oregon_data, mapping = aes(x = long, y = lat), col = "black") +
  geom_point(data = scaled_population_data, mapping = aes(x = long, y = lat), size = 5) +
  geom_segment(aes(x = low, xend = high, y = low, yend = low), linetype = "dashed", col = "black") +
  geom_segment(aes(x = low, xend = high, y = mid, yend = mid), linetype = "dashed", col = "black") +
  geom_segment(aes(x = low, xend = high, y = high, yend = high), linetype = "dashed", col = "black") +
  geom_segment(aes(x = low, xend = low, y = low, yend = high), linetype = "dashed", col = "black") +
  geom_segment(aes(x = mid, xend = mid, y = low, yend = high), linetype = "dashed", col = "black") +
  geom_segment(aes(x = high, xend = high, y = low, yend = high), linetype = "dashed", col = "black") +
  geom_segment(aes(x = q1, xend = q1, y = low, yend = high), linetype = "dashed", col = "black") +
  geom_segment(aes(x = q3, xend = q3, y = low, yend = high), linetype = "dashed", col = "black") +
  geom_segment(aes(x = low, xend = high, y = q1, yend = q1), linetype = "dashed", col = "black") +
  geom_segment(aes(x = low, xend = high, y = q3, yend = q3), linetype = "dashed", col = "black") +
  # low left
  annotate(geom = "text", x = q18, y = q18, label = "21", size = annotate_size, col = "black") +
  annotate(geom = "text", x = q18, y = q38, label = "22", size = annotate_size, col = "black") +
  annotate(geom = "text", x = q38, y = q18, label = "20", size = annotate_size, col = "black") +
  annotate(geom = "text", x = q38, y = q38, label = "23", size = annotate_size, col = "black") +
  # top left
  annotate(geom = "text", x = q18, y = q58, label = "13", size = annotate_size, col = "black") +
  annotate(geom = "text", x = q18, y = q78, label = "11", size = annotate_size, col = "black") +
  annotate(geom = "text", x = q38, y = q58, label = "12", size = annotate_size, col = "black") +
  annotate(geom = "text", x = q38, y = q78, label = "10", size = annotate_size, col = "black") +
  # top right
  annotate(geom = "text", x = q58, y = q18, label = "01", size = annotate_size, col = "black") +
  annotate(geom = "text", x = q58, y = q38, label = "02", size = annotate_size, col = "black") +
  annotate(geom = "text", x = q78, y = q18, label = "03", size = annotate_size, col = "black") +
  annotate(geom = "text", x = q78, y = q38, label = "00", size = annotate_size, col = "black") +
  # low right
  annotate(geom = "text", x = q58, y = q58, label = "32", size = annotate_size, col = "black") +
  annotate(geom = "text", x = q58, y = q78, label = "31", size = annotate_size, col = "black") +
  annotate(geom = "text", x = q78, y = q58, label = "33", size = annotate_size, col = "black") +
  annotate(geom = "text", x = q78, y = q78, label = "30", size = annotate_size, col = "black") +
  theme(axis.text = element_blank(),
        axis.title = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        panel.background = element_blank())

## write out figure 2b
if (write_out) {
  ggsave(filename = "inst/rticle/images/grts_level2.jpeg", plot = grts_level2, width = wid, height = ht, units = "in", dpi = 600)
}

# figure 2c --------------------------------------------------------------------
x <- seq(0, n_samp, length.out = 100)
yht <- 0.4
ysep <- 0.1
yeps <- 0.05
line_data <- data.frame(x = x, y = yht)
xprobs <- 3 / 5 * 1:5
point_data <- data.frame(
  x = c(xprobs,  seq(0.9, 3, by = 1)),
  y = yht,
  Site = c(
    "Site Not Selected",
    "Site Selected",
    "Site Not Selected",
    "Site Selected",
    "Site Selected",
    "Systematic Random Sample",
    "Systematic Random Sample",
    "Systematic Random Sample"
  )
)
ls_size <- 1.2
an_size <- 10

point_data <- subset(point_data, Site != "Systematic Random Sample")

grts_line <- ggplot() +
  geom_line(line_data, mapping = aes(x = x, y = y), size = 1.2, linetype = "dotted") +
  geom_point(point_data, mapping = aes(x = x, y = y, shape = Site), size = 5) +
  scale_shape_manual(values = c(19, 17, 3)) +
  expand_limits(y = c(0, 1)) +
  labs(x = "") +
  # dashed lines from bottom to one-d line
  # geom_segment(aes(x = 0 * high, xend = 0 * high, y = low, yend = yht), linetype = "dashed", col = "black") +
  # geom_segment(aes(x = 1 * high, xend = 1 * high, y = low, yend = yht), linetype = "dashed", col = "black") +
  # geom_segment(aes(x = 2 * high, xend = 2 * high, y = low, yend = yht), linetype = "dashed", col = "black") +
  # geom_segment(aes(x = 3 * high, xend = 3 * high, y = low, yend = yht), linetype = "dashed", col = "black") +
  # first inclusion prob
  geom_segment(aes(x = 0, xend = 0, y = yht + ysep, yend = yht + ysep + yeps), linetype = "solid", col = "black", size = ls_size) +
  geom_segment(aes(x = xprobs[1], xend = xprobs[1], y = yht + ysep, yend = yht + ysep + yeps), linetype = "solid", col = "black", size = ls_size) +
  geom_segment(aes(x = 0, xend = xprobs[1], y = yht + ysep + yeps, yend = yht + ysep + yeps), linetype = "solid", col = "black", size = ls_size) +
  geom_segment(aes(x = mean(c(0, xprobs[1])), xend = mean(c(0, xprobs[1])), y = yht + ysep + yeps, yend = yht + 1.5 * ysep + yeps), linetype = "solid", col = "black", size = ls_size) +
  annotate(geom = "text", x = mean(c(0, xprobs[1])), y = yht + 2 * ysep + yeps, label = "02", col = "black", size = an_size) +
  # second inclusion prob
  geom_segment(aes(x = xprobs[1], xend = xprobs[1], y = yht + ysep, yend = yht + ysep + yeps), linetype = "solid", col = "black", size = ls_size) +
  geom_segment(aes(x = xprobs[2], xend = xprobs[2], y = yht + ysep, yend = yht + ysep + yeps), linetype = "solid", col = "black", size = ls_size) +
  geom_segment(aes(x = xprobs[1], xend = xprobs[2], y = yht + ysep + yeps, yend = yht + ysep + yeps), linetype = "solid", col = "black", size = ls_size) +
  geom_segment(aes(x = mean(c(xprobs[1], xprobs[2])), xend = mean(c(xprobs[1], xprobs[2])), y = yht + ysep + yeps, yend = yht + 1.5 * ysep + yeps), linetype = "solid", col = "black", size = ls_size) +
  annotate(geom = "text", x = mean(c(xprobs[1], xprobs[2])), y = yht + 2 * ysep + yeps, label = "10", col = "black", size = an_size) +
  # third inclusion prob
  geom_segment(aes(x = xprobs[2], xend = xprobs[2], y = yht + ysep, yend = yht + ysep + yeps), linetype = "solid", col = "black", size = ls_size) +
  geom_segment(aes(x = xprobs[3], xend = xprobs[3], y = yht + ysep, yend = yht + ysep + yeps), linetype = "solid", col = "black", size = ls_size) +
  geom_segment(aes(x = xprobs[2], xend = xprobs[3], y = yht + ysep + yeps, yend = yht + ysep + yeps), linetype = "solid", col = "black", size = ls_size) +
  geom_segment(aes(x = mean(c(xprobs[2], xprobs[3])), xend = mean(c(xprobs[2], xprobs[3])), y = yht + ysep + yeps, yend = yht + 1.5 * ysep + yeps), linetype = "solid", col = "black", size = ls_size) +
  annotate(geom = "text", x = mean(c(xprobs[2], xprobs[3])), y = yht + 2 * ysep + yeps, label = "20", col = "black", size = an_size) +
  # fourth inclusion prob
  geom_segment(aes(x = xprobs[3], xend = xprobs[3], y = yht + ysep, yend = yht + ysep + yeps), linetype = "solid", col = "black", size = ls_size) +
  geom_segment(aes(x = xprobs[4], xend = xprobs[4], y = yht + ysep, yend = yht + ysep + yeps), linetype = "solid", col = "black", size = ls_size) +
  geom_segment(aes(x = xprobs[3], xend = xprobs[4], y = yht + ysep + yeps, yend = yht + ysep + yeps), linetype = "solid", col = "black", size = ls_size) +
  geom_segment(aes(x = mean(c(xprobs[3], xprobs[4])), xend = mean(c(xprobs[3], xprobs[4])), y = yht + ysep + yeps, yend = yht + 1.5 * ysep + yeps), linetype = "solid", col = "black", size = ls_size) +
  annotate(geom = "text", x = mean(c(xprobs[3], xprobs[4])), y = yht + 2 * ysep + yeps, label = "21", col = "black", size = an_size) +
  # fifth inclusion prob
  geom_segment(aes(x = xprobs[4], xend = xprobs[4], y = yht + ysep, yend = yht + ysep + yeps), linetype = "solid", col = "black", size = ls_size) +
  geom_segment(aes(x = xprobs[5], xend = xprobs[5], y = yht + ysep, yend = yht + ysep + yeps), linetype = "solid", col = "black", size = ls_size) +
  geom_segment(aes(x = xprobs[4], xend = xprobs[5], y = yht + ysep + yeps, yend = yht + ysep + yeps), linetype = "solid", col = "black", size = ls_size) +
  geom_segment(aes(x = mean(c(xprobs[4], xprobs[5])), xend = mean(c(xprobs[4], xprobs[5])), y = yht + ysep + yeps, yend = yht + 1.5 * ysep + yeps), linetype = "solid", col = "black", size = ls_size) +
  annotate(geom = "text", x = mean(c(xprobs[4], xprobs[5])), y = yht + 2 * ysep + yeps, label = "33", col = "black", size = an_size) +
  # uniform points
  annotate(geom = "text", x = 0.9, y = yht - 3 * ysep, label = expression(u[1]), size = an_size) +
  geom_segment(aes(x = 0.9, xend = 0.9, y = yht - 2.25 * ysep, yend = yht), linetype = "solid", col = "black", size = ls_size) +
  annotate(geom = "text", x = 1 + 0.9, y = yht - 3 * ysep, label = expression(u[2]), size = an_size) +
  geom_segment(aes(x = 1 + 0.9, xend = 1 + 0.9, y = yht - 2.25 * ysep, yend = yht), linetype = "solid", col = "black", size = ls_size) +
  annotate(geom = "text", x = 2 + 0.9, y = yht - 3 * ysep, label = expression(u[3]), size = an_size) +
  geom_segment(aes(x = 2 + 0.9, xend = 2 + 0.9, y = yht - 2.25 * ysep, yend = yht), linetype = "solid", col = "black", size = ls_size) +
  # lines to above points
  # geom_segment(aes(x = 0.9, xend = 0.9, y = 0.42, yend = yht + ysep + yeps), linetype = "dotted", col = "black", size = 1.1) +
  # geom_segment(aes(x = 1 + 0.9, xend = 1 + 0.9, y = 0.42, yend = yht + ysep + yeps), linetype = "dotted", col = "black", size = 1.1) +
  # geom_segment(aes(x = 2 + 0.9, xend = 2 + 0.9, y = 0.42, yend = yht + ysep + yeps), linetype = "dotted", col = "black", size = 1.1) +
  # theme
  theme(axis.text.x = element_text(size = 25, face = "bold", color = "black"),
        axis.title.x = element_text(size = 25, face = "bold", color = "black"),
        axis.text.y = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid = element_blank(),
        panel.background = element_blank(),
        legend.key = element_rect(fill = NA),
        legend.text = element_text(face = "bold", size = 20),
        legend.title = element_blank(),
        legend.position = c(0.5, 0.85))

## write out figure 2c
if (write_out) {
  ggsave(filename = "inst/rticle/images/grts_line.jpeg", plot = grts_line, width = wid, height = ht, units = "in", dpi = 600)
}

# figure 2d            ---------------------------------------------------------
population_data$`Site` <-   c(
  "Selected",
  "Selected",
  "Selected",
  "Not Selected",
  "Not Selected"
)
grts_sample <- ggplot() +
  geom_path(oregon_data, mapping = aes(x = long, y = lat), col = "black") +
  geom_point(data = population_data, mapping = aes(x = long, y = lat, shape = `Site`), size = 5) +
  theme(axis.text = element_blank(),
        axis.title = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        panel.background = element_blank(),
        legend.key = element_rect(fill = NA),
        legend.text = element_text(face = "bold", size = 20),
        legend.title = element_text(face = "bold", size = 20),
        legend.position = c(0.35, 0.5))

## write out figure 2d
if (write_out) {
  ggsave(filename = "inst/rticle/images/grts_sample.jpeg", plot = grts_sample, width = wid, height = ht, units = "in", dpi = 600)
}
