#' Create queries to the Riot API
#'
#' @param ... named key-value pairs
#' @param version which api version do you need
#' @param region region to run query for
#'
#' @return returns formatted url
#' @examples
#' \dontrun{NA}
create_query <- function(..., param, version, region) {
  args <- c(...)
  postpends <- paste(names(args), args,
                              sep = "/", collapse ="/")
  postpends <- substr(postpends, 1, nchar(postpends) - 1)
  postpends <- gsub(postpends, pattern = "(\\/){2}", replacement = "\\/")
  if(missing(region))
    region <- "na"

  base_url = paste0("https://", region, ".api.pvp.net/api/lol/", region, "/", version)
  params <- "?"
  if(!missing(param)) {
    params <- paste0(params, param, "&", collapse = "")
  }

  params <- paste0(params, "api_key=", get_riot_key())
  paste(base_url, postpends, params, sep = "/")
}
