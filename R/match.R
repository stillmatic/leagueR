#' Retrieve match by match ID
#'
#' @param match id
#' @param region for api
#'
#' @return match information
#' @export
#'
#' @examples
#' get_match("2269165589", "na")
get_match <- function(match, region) {
  match_url <- create_query("match" = match,
                            region = region,
                            version = paste(region, "v2.2", sep = "/"))
  jsonlite::fromJSON(match_url)
}

#' Retrieve match list by summoner ID.
#'
#' TODO: add filtering parameters
#'
#' https://na.api.pvp.net/api/lol/na/v2.2/matchlist/by-summoner/5908?rankedQueues=TEAM_BUILDER_DRAFT_RANKED_5x5&seasons=SEASON2016&api_key=5f309460-6a23-4f50-8f07-3c6d90780a80
#'
#' @param summoner summoner id
#' @param region region id
#'
#' @return matchlist for a summoner
#' @export
#'
#' @examples
#' get_matchlist(5908, "na")
get_matchlist <- function(summoner, region) {
  rest_url <- create_query("matchlist/by-summoner" = summoner,
               region = region,
               version = paste(region, "v2.2", sep = "/"))
  jsonlite::fromJSON(rest_url)
}


