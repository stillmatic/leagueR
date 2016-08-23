#' Get recent games by summoner ID
#'
#' @param id summoner id
#' @param region region to run query for
#'
#' @return data frame of recent games by summoner
#' @export
#'
#' @examples
#' get_summoner_games(29400662)
get_summoner_games <- function(id, region = "na") {
  create_query('game/by-summoner' = paste0(id, '/recent/'),
               region = region,
               version = paste0(region, "/v1.3")) %>%
    jsonlite::fromJSON() %>%
    data.frame
}
