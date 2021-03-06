#' Convenience function to transform a spatial object's projection system to 
#' WGS84 latitude and longitude. 
#' 
#' \code{sp_transform} is a simple wrapper for \code{sp::spTransform} which has 
#' been written so spatial objects can be transformed quickly without the need 
#' to remember the WGS84 proj4 string. \code{sp_transform} will force projections
#' when the spatial object contains no projection information. 
#' 
#' \code{sp_transform} will also work for raster layers. 
#' 
#' @param sp Spatial object which is to be transformed.
#' 
#' @param to A proj4 string for the projection-transformation. Default is the 
#' WGS84 string. 
#' 
#' @param warn Should the functions raise a warning when the projection is forced?
#' 
#' @seealso \code{\link{spTransform}}, \code{\link{sp_projection}}, 
#' \code{\link{projection_wgs84}}
#' 
#' @author Stuart K. Grange
#' 
#' @examples 
#' \dontrun{
#' 
#' # Load a shape file of canal locks for the UK
#' sp_locks <- sp_read("uk-canals", "locks")
#' 
#' # Print projection string
#' sp_projection(sp_locks)
#' 
#' # Convert the shape file's projection (UK's Ordnance Survey National Grid)
#' to WGS84 latitude and longitude
#' sp_locks <- sp_transform(sp_locks)
#' 
#' # Print projection string
#' sp_projection(sp_locks)
#' 
#' }
#' 
#' @import sp
#' 
#' @export
sp_transform <- function(sp, to = NA, warn = TRUE) {
  
  # Default
  if (is.na(to)) to <- projection_wgs84()
  
  if (!grepl("raster", class(sp), ignore.case = TRUE)) {
    
    # If no projection
    if (is.na(sp_projection(sp))) {
      
      # Warn
      if (warn) {
        
        warning("Spatial object had no projection. The projection has been forced.",
                call. = FALSE)
        
      }
      
      # Now force
      sp::proj4string(sp) <- to
      
    } else {
      
      # Otherwise convert projection system
      sp <- sp::spTransform(sp, CRS(to))
      
    }
    
  } else {
    
    raster::crs(sp) <- to
    
  }
  
  return(sp)
  
}
