#' Query LOL static API
#'
#' @param region id
#' @param type see documentation https://developer.riotgames.com/api/methods#!/1055/3621
#'
#' @return url
#' @export
#'
#' @examples
#' static_query("na", "item")
static_query <- function(region, type) {
  create_query(
    "static-data" = region,
    "v1.2" = type,
    region = "global"
  )
}
