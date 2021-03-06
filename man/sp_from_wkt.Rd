% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sp_from_wkt.R
\name{sp_from_wkt}
\alias{sp_from_wkt}
\title{Function to parse a data frame containing WKT strings to a spatial object.}
\usage{
sp_from_wkt(df, wkt = "geom", data = TRUE, keep = FALSE,
  projection = NA, verbose = FALSE)
}
\arguments{
\item{df}{Data frame containing a WKT string variable. \code{df} can also be
a vector of WKT strings.}

\item{wkt}{Variable name of WKT strings in \code{df}. Default is \code{"geom"}.}

\item{data}{Should variables other than \code{wkt} be added to the spatial 
object's data-slot? I.e. create a spatial data frame.}

\item{keep}{Should the \code{wkt} be kept in the returned spatial object?}

\item{projection}{A proj4 string to force the projection system after the WKT
strings have been parsed. Default is \code{NA}.}

\item{verbose}{Should the function give messages? Useful when large number of
WKT strings are to be parsed. Default is \code{FALSE}.}
}
\description{
\code{sp_from_wkt} creates geometries from WKT strings and can create spatial
data frames from the other variables contained within the input data frame. 
\code{sp_from_wkt} is useful after querying a PostGIS database for geometries
in WKT format.
}
\examples{
\dontrun{
# Make a spatial object from many wkt strings
sp_wkt <- sp_from_wkt(data_wkt, wkt = "geom")

# Make a spatial-data frame object from many wkt strings
sp_wkt_with_data <- sp_from_wkt(data_wkt, wkt = "geom", data = TRUE)

}

}
\author{
Stuart K. Grange
}
