# creating the package data set
library(dplyr)
library(spsurvey.manuscript)
data("NLA12_keyvariables")
NLA12 <- NLA12_keyvariables %>%
  dplyr::filter(VISIT_NO == 1, INDEX_NLA == "Y") %>%
  dplyr::mutate(AP = dplyr::case_when(
    ATRAZINE_RESULT > 0 ~ "Y",
    ATRAZINE_RESULT == 0 ~ "N"
  )) %>%
  dplyr::select(AP, BMMI = MMI_BENT_NLA12, INDEX_LON_DD, INDEX_LAT_DD) %>%
  sf::st_as_sf(coords = c("INDEX_LON_DD", "INDEX_LAT_DD"), crs = 4269) %>% # NAD83
  sf::st_transform(crs = 5070) # NAD83 / Conus Albers

# not run
# library(usethis)
# usethis::use_data(NLA12)
