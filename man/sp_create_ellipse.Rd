% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sp_create_ellipse.R
\name{sp_create_ellipse}
\alias{sp_create_ellipse}
\title{Function to create a elliptical polygon from a point, usually used for 
filtering.}
\usage{
sp_create_ellipse(latitude, longitude, width = 0.01,
  projection = projection_wgs84())
}
\arguments{
\item{latitude}{Latitude of a point.}

\item{longitude}{Longitude of a point.}

\item{width}{Width of radius. \code{"width"}'s unit is in the projection of
\code{projection}. The default is 0.01 decimal degrees.}

\item{projection}{A proj4 string. Default is the WGS84 string.}
}
\description{
Function to create a elliptical polygon from a point, usually used for 
filtering.
}
\author{
Stuart K. Grange
}
