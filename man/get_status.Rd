% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/status.R
\name{get_status}
\alias{get_status}
\title{Get shard list or status}
\usage{
get_status(shard)
}
\arguments{
\item{shard}{shard to look up. if missing, returns list of shards}
}
\value{
shard status info
}
\description{
Get shard list or status
}
\examples{
get_status()
get_status(shard = "na")
}

