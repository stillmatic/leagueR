#' Get list of champions
#'
#' @return list of champions
#' @export
#'
#' @examples
#' str(get_champions())
get_champions <- function() {
  champs <- create_query('champion' = "", version = "v1.2") %>%
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
get_champion <- function(id) {
  if(missingArg(id)) {
    return(get_champions())
  }
  champ <- create_query('champion' = id, version = "v1.2") %>%
    jsonlite::fromJSON() %>% data.frame
  champ
}
