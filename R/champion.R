#' Get list of champions
#'
#' @return list of champions
#' @export
#'
#' @examples
#' str(get_champions())
get_champions <- function(region = "na") {
  champs <- create_query('champion' = "",
                         version = paste0(region, "/v1.2"),
                         region = region) %>%
    jsonlite::fromJSON()
  champs[[1]]
}

#' Get champion information
#'
#' @param id champion id
#'
#' @return data frame of information about a champion
#' @export
#'
#' @examples
#' get_champion("32")
get_champion <- function(id, region = "na") {
  if(missing(id)) {
    return(get_champions())
  }
  champ <- create_query('champion' = id,
                        version = paste0(region, "/v1.2"),
                        region = region) %>%
    jsonlite::fromJSON() %>% data.frame
  champ
}
