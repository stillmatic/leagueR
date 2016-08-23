#' Get a champion mastery by player id and champion id. Response code 204 means there were no masteries found for given player id or player id and champion id combination.
#'
#' @param player_id summoner id
#' @param champ_id champmion id
#' @param region platform id
#'
#' @return player's champion mastery on a single champ
#' @export
#'
#' @examples
#' get_champ_mastery(29400662, 23)
get_champ_mastery <- function(player_id, champ_id, region = "NA1") {
  # TODO: pattern match
  create_query("player" = player_id,
               "champion" = paste0(champ_id, " "),
               api_name = paste0("championmastery/location/", region)) %>%
    jsonlite::fromJSON()
}

#' Get all champion mastery entries sorted by number of champion points descending
#'
#' @param player_id summoner id
#' @param region platform id
#'
#' @return all champion masteries
#' @export
#'
#' @examples
#' get_all_champ_mastery(29400662)
get_all_champ_mastery <- function(player_id, region = "NA1") {
  # TODO: pattern match
  create_query("player" = player_id,
               "champions" = "",
               api_name = paste0("championmastery/location/", region)) %>%
    jsonlite::fromJSON()
}

#' Get a player's total champion mastery score, which is sum of individual champion mastery levels
#'
#' @param player_id summoner id
#' @param region platform id
#'
#' @return player's total champion mastery score
#' @export
#'
#' @examples
#' get_champ_mastery_score(29400662)
get_champ_mastery_score <- function(player_id, region = "NA1") {
  create_query("player" = player_id,
               "score" = "",
               api_name = paste0("championmastery/location/", region)) %>%
    jsonlite::fromJSON()
}

#' Get specified number of top champion mastery entries sorted by number of champion points descending
#'
#' @param count optional, max number of entries
#' @param player_id summoner id
#' @param region platform id
#'
#' @return top champion mastery entries
#' @export
#' @examples
#' get_champ_mastery_top(29400662, 1231241)
get_champ_mastery_top <- function(player_id, count = NULL, region = "NA1") {
  if(missing(count)) count <- ""

  create_query("player" = player_id,
               "topchampions" = "",
               param = c("count", count),
               api_name = paste0("championmastery/location/", region)) %>%
    jsonlite::fromJSON()
}
