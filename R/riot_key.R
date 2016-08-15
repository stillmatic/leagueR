#' Get the currently set Riot API key
#'
#' @return if set, the Riot API key
#' @export
#'
#' @examples
#' print(get_riot_key())
get_riot_key <- function() {
  riot_key <- Sys.getenv("riot.key")
  if(riot_key == "") {
    stop("You must use set_riot_key()!")
  }
  return(riot_key)
}

#' Set Riot API key
#'
#' @param key your Riot API key
#'
#' @return sets an environment variable
#' @export
#'
#' @examples
#' \dontrun{set_riot_key("testkey-123")}
set_riot_key <- function(key) {
  Sys.setenv("riot.key" = key)
}


