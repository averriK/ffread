#' Title
#'
#' @param file character. Path to the file to read
#' @param key character. Column name to filter the data table
#' @param value character. Value to filter the data table
#' @param ... Additional arguments to pass to data.table::fread()
#'
#' @return
#' @export
#'
#' @importFrom data.table data.table
#' @importFrom data.table fread
#' @examples
ffread <- function(file, key, value, ...) {
  tryCatch({
    # Read only the key column first
    INDEX <- fread(file, select = key, ...)
    
    # Coerce value to strings for comparison
    VALUE <- as.character(value)
    
    # Find all matching rows
    ROWS <- which(INDEX[[key]] %in% VALUE)
    
    if (length(ROWS) == 0) {
      warning(sprintf("No rows found with key '%s' matching value '%s'", key, VALUE))
      return(NULL)
    }
    
    # Read the full data up to the last matching row
    AUX <- fread(file, nrows = max(ROWS), ...)
    
    # Filter the data table using %in% directly within the data table expression
    return(AUX[get(key) %in% VALUE])
  }, warning = function(w) {
    message("Warning: ", w$message)
    return(NULL)
  }, error = function(e) {
    message("Error: ", e$message)
    return(NULL)
  })
}
