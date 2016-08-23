#' Get ranked/summary stats by summoner ID
#'
#' @param summoner id
#' @param region to look up
#' @param type  one of "ranked" or "summary"
#'
#' @return summoner stats
#' @export
#'
#' @examples
#' get_stats(5908, "na", "ranked")
get_stats <- function(summoner, region, type = "ranked") {
  rest_url <- create_query(
    "stats/by-summoner" = paste(summoner, type, sep = "/"),
    region = region,
    version = paste(region, "v1.3", sep = "/")
  )
  jsonlite::fromJSON(rest_url)
}

