#' Get list of featured games.
#'
#' @param region Region to Execute Against
#'
#' @return featured game info
#' @export
#'
#' @examples
#' get_featured_games()
get_featured_games <- function(region = "na") {
  url <- paste0("https://", region, ".api.pvp.net/observer-mode/rest/featured?api_key=", get_riot_key())
  jsonlite::fromJSON(url)
}
