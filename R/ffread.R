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
ffread <- function(file, key, value, index=NULL,rows=NULL,...) {
  tryCatch({
    # Read only the key column first
    if(is.null(index)){
      INDEX <- fread(file, select = key, ...)
    } else {
      INDEX <- index
    }
    # Coerce value to strings for comparison
    
    VALUE <- as.character(value)
    if(is.null(rows)){
      ROWS <- which(INDEX[[key]] %in% VALUE)
    } else {
      ROWS <- rows
    }
    if (length(ROWS) == 0) {
      return(NULL)
    }
      
    # Find all matching rows
   
    START <- max(1,first(ROWS)-10)
    END <- min(nrow(INDEX),last(ROWS)+10)
    NR <- END - START
    
    # Read the full data up to the last matching row
    AUX <- fread(file, skip = START - 1, nrows = END - START + 1, ...)
    
    # Filter the data table using %in% directly within the data table expression
    return(AUX[get(key) == VALUE])
  }, warning = function(w) {
    message("Warning: ", w$message)
    return(NULL)
  }, error = function(e) {
    message("Error: ", e$message)
    return(NULL)
  })
}
