#' Get shard list or status
#'
#' @param shard shard to look up. if missing, returns list of shards
#'
#' @return shard status info
#' @export
#'
#' @examples
#' get_status()
#' get_status(shard = "na")
get_status <- function(shard) {
  base_url <- paste0("https://status.leagueoflegends.com/shards")
  if(missing(shard)) {
    return(jsonlite::fromJSON(base_url))
  } else {
    url <- paste(base_url, shard, sep ="/")
    return(jsonlite::fromJSON(url))
  }
}
