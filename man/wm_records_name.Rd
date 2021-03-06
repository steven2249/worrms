% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wm_records_name.R
\name{wm_records_name}
\alias{wm_records_name}
\title{Get records by single name, optional fuzzy matching}
\usage{
wm_records_name(name, fuzzy = TRUE, marine_only = TRUE, offset = 1, ...)
}
\arguments{
\item{name}{(character) start date. required.}

\item{fuzzy}{(logical) fuzzy search. default: \code{TRUE}}

\item{marine_only}{(logical) marine only or not. default: \code{TRUE}}

\item{offset}{(integer) record to start at. default: 1}

\item{...}{named curl options. see \code{\link[curl]{curl_options}}}
}
\description{
Get records by single name, optional fuzzy matching
}
\examples{
wm_records_name(name = 'Platanista gangetica')
wm_records_name(name = 'Platanista gangetica', fuzzy = FALSE)
wm_records_name(name = 'Platanista gangetica', marine_only = FALSE)
wm_records_name(name = 'Platanista', marine_only = FALSE)
wm_records_name(name = 'Platanista', marine_only = FALSE, offset = 5)
}

