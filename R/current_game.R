#' Get current game information for the given summoner ID
#'
#' @param platform_id
#' @param summoner_id
#'
#' @return
#' @export
#'
#' @examples
get_current_game <- function(platform_id, summoner_id) {
  params <- paste0(platform_id, "/", summoner_id, " ")
  create_query("/" = params,
               api_name = "observer-mode/rest/consumer/getSpectatorGameInfo")

}
