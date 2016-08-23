#' Get current game information for the given summoner ID
#'
#' @param platform_id Region to Execute Against
#' @param summoner_id The ID of the summoner.
#'
#' @return current game info for given summoner
#' @export
#'
#' @examples
#'
get_current_game <- function(platform_id, summoner_id, region = "na") {
  params <- paste0(platform_id, "/", summoner_id, " ")
  create_query("/" = params,
               api_name = "observer-mode/rest/consumer/getSpectatorGameInfo", region = region)

}
