#' Get leagues mapped by summoner ID for a given list of summoner IDs
#'
#' @param ids list of summoner id's
#' @param region region to run query for
#'
#' @return league information for given summoners
#' @export
#'
#' @examples
#' get_league_by_summoner(c(29400662, 521955))
get_league_by_summoner <- function(ids, region = "na") {
  id_string <- stringr::str_c(ids, sep = ",", collapse = ",")
  create_query("league/by-summoner" = id_string,
               region = region, version = "v2.5") %>%
    jsonlite::fromJSON()
}

#' Get league entries mapped by summoner ID for a given list of summoner IDs
#'
#' @param ids list of summoner id's
#' @param region region to run query for
#'
#' @return league entries for given summoners
#' @export
#'
#' @examples
#' get_league_entries_by_summoner(c(29400662, 521955))
get_league_entries_by_summoner <- function(ids, region = "na") {
  id_string <- stringr::str_c(ids, sep = ",", collapse = ",")
  create_query("league/by-summoner" = id_string,
               "entry" = "",
               region = region, version = "v2.5") %>%
    jsonlite::fromJSON()
}

#' Get league entries mapped by summoner ID for a given list of summoner IDs
#'
#' @param ids list of summoner id's
#' @param region region to run query for
#'
#' @return league entries for given summoners
#' @export
#'
#' @examples
#' get_league_by_team("TEAM-75796040-4c8c-11e6-9d8d-c81f66dcfb5a")
get_league_by_team <- function(ids, region = "na") {
  id_string <- stringr::str_c(ids, sep = ",", collapse = ",")
  create_query("league/by-team" = id_string,
               region = region, version = "v2.5") %>%
    jsonlite::fromJSON()
}

#' Get league entries mapped by team ID for a given list of team IDs.
#'
#' @param ids list of summoner id's
#' @param region region to run query for
#'
#' @return league entries fpr a team
#' @export
#'
#' @examples
#' get_league_entry_by_team("TEAM-75796040-4c8c-11e6-9d8d-c81f66dcfb5a")
get_league_entry_by_team <- function(ids, region = "na") {
  id_string <- stringr::str_c(ids, sep = ",", collapse = ",")
  create_query("league/by-team" = id_string,
               "entry" = "",
               region = region, version = "v2.5") %>%
    jsonlite::fromJSON()
}


#' Get challenger tier leagues.
#'
#' @param type one of "RANKED_SOLO_5x5", "RANKED_TEAM_5x5", "RANKED_TEAM_3x3"
#' @param region region to run query for
#'
#' @return data about challenger tier league in a queue
#' @export
#'
#' @examples
#' get_league_challenger("RANKED_SOLO_5x5")
get_league_challenger <- function(type, region = "na") {
  if( !(type %in% c("RANKED_SOLO_5x5",
                    "RANKED_TEAM_5x5",
                    "RANKED_TEAM_3x3"))) {
    stop("Invalid league type passed")
  }
  create_query("league" = "challenger/",
               param = paste0("type=", type),
               region = region, version = "v2.5") %>%
    jsonlite::fromJSON()
}

#' Get master tier leagues.
#'
#' @param type one of "RANKED_SOLO_5x5", "RANKED_TEAM_5x5", "RANKED_TEAM_3x3"
#' @param region  region to run query for
#'
#' @return data about master tier league in a queue
#' @export
#'
#' @examples
#' get_league_master("RANKED_SOLO_5x5")
get_league_master <- function(type, region = "na") {
  if( !(type %in% c("RANKED_SOLO_5x5",
                    "RANKED_TEAM_5x5",
                    "RANKED_TEAM_3x3"))) {
    stop("Invalid league type passed")
  }
  create_query("league" = "master/",
               param = paste0("type=", type),
               region = region, version = "v2.5") %>%
    jsonlite::fromJSON()
}
