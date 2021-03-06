% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_osm_boundary.R
\name{get_osm_boundary}
\alias{get_osm_boundary}
\title{Function to get OpenStreetMap boundaries as spatial polygons.}
\usage{
get_osm_boundary(id, way = FALSE, progress = "none")
}
\arguments{
\item{id}{A vector of OpenStreetMap relations. An integer key.}

\item{way}{Is \code{id} a way? If \code{TRUE}, a different method is needed
which scrapes XML directly from OpenStreetMap for nodes and is a bit slow.}

\item{progress}{Type of progress bar to display. Default is \code{"none"}}
}
\value{
SpatialPolygonsDataFrame with WGS84 projection.
}
\description{
\code{get_osm_boundary} accesses \href{http://polygons.openstreetmap.fr/index.py}{this}
polygon creator tool.
}
\examples{

\dontrun{

# Get North York Moors National Park boundary
sp_moors <- get_osm_boundary(409150)

}

}
\author{
Stuart K. Grange
}
