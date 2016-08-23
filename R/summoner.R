#' Get mastery pages mapped by summoner ID for a given list of summoner IDs
#'
#' @param ids list of summoner ids
#' @param region region to run query for
#'
#' @return mastery information for given summoners
#' @export
#'
#' @examples
#' get_summoner_masteries(c(29400662, 521955))
#' get_summoner_masteries("29400662")
get_summoner_masteries <- function(ids, region = "na") {
  id_string <- stringr::str_c(ids, sep = ",", collapse = ",")
  create_query("summoner" = paste0(id_string, "/"),
               "masteries" = "",
               version = paste0(region, "/v1.4")) %>%
    jsonlite::fromJSON()
}

#' Get rune pages mapped by summoner ID for a given list of summoner IDs
#'
#' @param ids list of summoner ids
#' @param region region to run query for
#'
#' @return rune page info
#' @export
#'
#' @examples
#' get_summoner_runes("521955")
get_summoner_runes <- function(ids, region = "na") {
  id_string <- stringr::str_c(ids, sep = ",", collapse = ",")
  create_query("summoner" = paste0(id_string, "/"),
               "runes" = "",
               version = paste0(region, "v1.4")) %>%
    jsonlite::fromJSON()
}

#' Get summoner names mapped by summoner ID for a given list of summoner IDs.
#'
#' @param ids list of summoner ids
#' @param region region to run query for
#'
#' @return list of summoner names
#' @export
#'
#' @examples
#' get_summoner_name(c("521955", 32110)) %>% names
get_summoner_name <- function(ids, region = "na") {
  id_string <- stringr::str_c(ids, sep = ",", collapse = ",")
  create_query("summoner" = paste0(id_string, "/"),
               "name" = "",
               version = paste0(region, "v1.4")) %>%
    jsonlite::fromJSON()
}

#' Get summoner objects mapped by standardized summoner name for a given list of summoner names.
#'
#' @param ids list of summoner ids
#' @param region region to run query for
#'
#' @return list of summoner objects
#' @export
#'
#' @examples
#' get_summoner_by_name("wildturtle")
get_summoner_by_name <- function(ids, region = "na") {
  id_string <- stringr::str_c(ids, sep = ",", collapse = ",")
  create_query("summoner/by-name" = paste0(id_string, "/"),
               version = file.path(region, "v1.4")) %>%
    jsonlite::fromJSON()
}

#' Get summoner objects mapped by summoner ID for a given list of summoner IDs
#'
#' @param ids list of summoner ids
#' @param region region to run query for
#'
#' @return list of summoner objects
#' @export
#'
#' @examples
#' get_summoner(521955)
get_summoner <- function(ids, region = "na") {
  id_string <- stringr::str_c(ids, sep = ",", collapse = ",")
  create_query("summoner" = paste0(id_string, "/"),
               version = paste0(region, "v1.4")) %>%
    jsonlite::fromJSON()
}
