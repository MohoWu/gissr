#' Function to simplify spatial objects using the Douglas-Peuker algorithm. 
#'
#' Holes will appear between the geometries at times. 
#'
#' @param sp Spatial object which is to be simplified.
#' 
#' @param tolerance Tolerance value to be used by the Douglas-Peuker algorithm. 
#' 
#' @param preserve Should the algorithm attempt to preserve the topology? 
#' Default is \code{TRUE}.
#'
#' @author Stuart K. Grange
#' 
#' @examples
#' \dontrun{
#' 
#' # Simplify an object
#' sp_simple <- sp_simplify(sp, 0.01)
#' 
#' }
#' 
#' @export
sp_simplify <- function(sp, tolerance, preserve = TRUE) {
  
  # If a spatial data object is given, store the data slot
  # if (grepl("data", class(sp), ignore.case = TRUE)) df_from_sp <- sp@data
  
  # Simplify spatial object with rgeos library
  sp <- rgeos::gSimplify(sp, tolerance, preserve)
  
  # # Add the data if necessary as gSimplify drops this
  # # Will fail if geoms are lost in simplification process
  # if (exists("df_from_sp")) {
  #   
  #   # Lines
  #   if (class(sp)[1] == "SpatialLines")
  #     sp <- sp::SpatialLinesDataFrame(sp, df_from_sp)
  #   
  #   # Polygons
  #   if (class(sp)[1] == "SpatialPolygons")
  #     sp <- sp::SpatialPolygonsDataFrame(sp, df_from_sp)
  #   
  # }
  
  return(sp)
  
}
