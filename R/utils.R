#' Get summoner ID from summoner name
#'
#' @param summoner_name
#'
#' @return
#' @export
#'
#' @examples
get_id_from_name <- function(summoner_name) {
  get_summoner_by_name(summoner_name)[[1]]$id
}
