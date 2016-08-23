#' Create queries to the Riot API
#'
#' @param ... named key-value pairs
#' @param version which api version do you need
#' @param region region to run query for
#'
#' @return returns formatted url
#' @export
#' @examples
#' \dontrun{NA}
create_query <- function(..., api_name, param, version = NULL, region) {
  args <- c(...)
  postpends <- paste(names(args), args,
                     sep = "/", collapse ="/")
  postpends <- stringr::str_trim(postpends)
  postpends <- gsub(postpends, pattern = "(\\/){2,}", replacement = "\\/")

  if(missing(region))
    region <- "na"
  if(missing(api_name))
    api_name <- "api/lol/"

  server <- paste0(region, ".api.pvp.net")

  base_url <- file.path("https://", server, api_name)
  if(!is.null(version))
    base_url <- file.path(base_url, version)

  api_param <- paste0("api_key" = get_riot_key())
  final_url <- file.path(base_url, postpends)
  final_url <- urltools::param_set(final_url, key = "api_key", value = get_riot_key())
  if(!missing(param)) {
    final_url <- urltools::param_set(final_url, key = param[1], value = param[2])
  }

  temp <- gsub(final_url, pattern = "(\\/){2}", replacement = "\\/")
  temp
}
