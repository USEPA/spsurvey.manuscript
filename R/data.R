#' NLA 2012 Data
#'
#' An \code{sf} POINT object of data collected at 1030 lakes during EPA's 2012
#' National Lakes Assessment.
#'
#' @format 1030 rows and 3 variables:
#' \describe{
#'   \item{\code{AP}}{ Atrazine presence. Takes on values Yes (\code{"Y"}) and
#'   No (\code{"No"}).}
#'   \item{\code{BMMI}}{ Benthic macroinvertebrate multi-metric index value.}
#'   \item{\code{geometry}}{ POINT geometry using the NAD83 / Conus Albers
#'     coordinate reference system (EPSG: 5070).}
#' }
"NLA12"

#' NLA 2012 Raw Data
#'
#' An \code{sf} POINT object of data collected at 1138 lakes during EPA's 2012
#' National Lakes Assessment. The data are available at
#' https://www.epa.gov/sites/production/files/2021-04/nla12_keyvariables.csv
#'
#' @format 1138 rows and 49 variables. Relevant variables include:
#' \describe{
#'   \item{\code{AP}}{ Atrazine presence. Takes on values Yes (\code{"Y"}) and
#'   No (\code{"No"}).}
#'   \item{\code{BMMI}}{ Benthic macroinvertebrate multi-metric index value.}
#'   \item{\code{INDEX_LON_DD}}{ Latitude coordinate using the NAD83
#'     coordinate reference system (EPSG: 4269).}
#'   \item{\code{INDEX_LAT_DD}}{ Longitude coordinate using the NAD83
#'     coordinate reference system (EPSG: 4269).}
#' }
"NLA12_keyvariables"

#' Categorical Simulation Results
#'
#' An data frame of results for the Atrazine simulation.
#'
#' @format 4000 rows and 9 variables. Relevant variables include:
#' \describe{
#'   \item{\code{Estimate.P}}{ Estimate of Atrazine presence}
#'   \item{\code{StdError.P}}{ Standard error of Atrazine presence}
#'   \item{\code{LCB95Pct.P}}{ Lower confidence bound of Atrazine presence}
#'   \item{\code{UCB95Pct.P}}{ Upper confidence bound of Atrazine presence}
#'   \item{\code{spb}}{ Spatial balance as measured by Pielou's evenness index}
#'   \item{\code{algorithm}}{ Sampling algorithm (GRTS or SRS)}
#'   \item{\code{true_mean}}{ True mean Atrazine presence}
#'   \item{\code{cover}}{ Was the true mean contained in the confidence interval (1 = yes, 0 = no)}
#'   \item{\code{seed}}{ The simulation seed (which equals the trial number)}
#' }
"cat_results"

#' Categorical Simulation Summary
#'
#' An data frame of summaries for the Atrazine simulation.
#'
#' @format 2 rows and 6 variables. Relevant variables include:
#' \describe{
#'   \item{\code{algorithm}}{ Sampling algorithm (GRTS or SRS)}
#'   \item{\code{mbias}}{ Mean bias}
#'   \item{\code{mstderr}}{ Mean standard error}
#'   \item{\code{rmse}}{ Root-Mean-Squared Error}
#'   \item{\code{coverage}}{ Coverage rate}
#'   \item{\code{mspb}}{ Mean spatial balance as measured by Pielou's evenness index}
#' }
"cat_summaries"

#' Continuous Simulation Results
#'
#' An data frame of results for the BMMI simulation.
#'
#' @format 4000 rows and 9 variables. Relevant variables include:
#' \describe{
#'   \item{\code{Estimate}}{ Estimate of BMMI}
#'   \item{\code{StdError}}{ Standard error of BMMI}
#'   \item{\code{LCB95Pct}}{ Lower confidence bound of BMMI}
#'   \item{\code{UCB95Pct}}{ Upper confidence bound of BMMI}
#'   \item{\code{spb}}{ Spatial balance as measured by Pielou's evenness index}
#'   \item{\code{algorithm}}{ Sampling algorithm (GRTS or SRS)}
#'   \item{\code{true_mean}}{ True mean BMMI}
#'   \item{\code{cover}}{ Was the true mean contained in the confidence interval (1 = yes, 0 = no)}
#'   \item{\code{seed}}{ The simulation seed (which equals the trial number)}
#' }
"cont_results"

#' Continuous Simulation Summary
#'
#' An data frame of summaries for the BMMI simulation.
#'
#' @format 2 rows and 6 variables. Relevant variables include:
#' \describe{
#'   \item{\code{algorithm}}{ Sampling algorithm (GRTS or SRS)}
#'   \item{\code{mbias}}{ Mean bias}
#'   \item{\code{mstderr}}{ Mean standard error}
#'   \item{\code{rmse}}{ Root-Mean-Squared Error}
#'   \item{\code{coverage}}{ Coverage rate}
#'   \item{\code{mspb}}{ Mean spatial balance as measured by Pielou's evenness index}
#' }
"cont_summaries"
