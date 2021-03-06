% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sp_clip.R
\name{sp_clip}
\alias{sp_clip}
\alias{sp_crop}
\title{Function to clip spatial objects by a rectangular envelope or a spatial 
polygon.}
\usage{
sp_clip(sp, envelope, sp_polygon = NULL, method = "raster")

sp_crop(sp, envelope, sp_polygon = NULL, method = "raster")
}
\arguments{
\item{sp}{Spatial object to be clipped.}

\item{envelope}{A vector with the length of 4 containing the extent of the 
envelope to be used as a bounding box. The order is: xmin, xmax, ymin, ymax.
Watch out when using latitude and longitude, the order is longitude, longitude,
then latitude, latitude. These coordinates need to be in the same projection 
as \code{sp}.}

\item{sp_polygon}{A spatial polygon to use to clip \code{sp}. The projection 
systems of \code{sp} and \code{sp_polygon} must be identical. If this 
argument is used, the \code{method} argument will not be used.}

\item{method}{What method to use? Default is to use \code{raster::crop} but
\code{rgeos::gIntersection} could be used if preferred. \code{method} can be
\code{"raster"} or \code{"rgeos"}}
}
\description{
\code{sp_clip} uses \code{raster::crop} by default if an envelope is used 
rather than \code{rgeos::gIntersection} because the \code{crop} method can 
keep the data slot in the spatial object intact (at times).
}
\details{
If a spatial polygon is supplied, the \code{rgeos::gIntersection} method will
be used.
}
\examples{

\dontrun{

# Clip a spatial lines object which contains roads in Saudi Arabia

# Build envelope
envelope <- c(23.830562, 25.584393, 45.200111, 47.311495)

# Clip spatial lines
sp_road_clip <- sp_clip(sp_roads, envelope)


# Or use a polygon to clip a road network
sp_roads_clipped <- sp_clip(sp_roads_main, sp_gibraltar_peninsula)

}

}
\seealso{
\code{\link{sp_filter}}, \code{\link{sp_intersect}}
}
\author{
Stuart K. Grange
}
