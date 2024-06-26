#' Define the OBS (observation) S4 object
#' @title class OBS
#' @description Stores the observation data.
#' 
#' @importFrom methods is new slot slot<- slotNames
#' 
#' @slot id character
#' @slot dataset_id character
#' @slot filepath character
#' @slot accessor character
#' @slot record_id character 
#'
#' @return the OBS class
#' @export
#'
#' 
setClass("OBS", slots = list(id = "CharOrNULL",
                             dataset_id = "CharOrNULL",    
                             filepath = "CharOrNULL",
                             accessor = "CharOrNULL",
                             record_id = "CharOrNULL"))

#' Constructor for the OBS (observations) S4 object
#' @description Creates the FID object and populates its subfields
#' @param id Main ID of MAMS object
#' @param dataset_id Parent dataset ID
#' @param filepath Path to the data file
#' @param accessor Accessor
#' @param record_id Record ID
#' 
#' @return a OBS S4 object for use with MAMS
#' @export

create_OBS_object <- function(
    id = NA_character_,
    dataset_id = NA_character_,    
    filepath = NA_character_,
    accessor = NA_character_,
    record_id = NA_character_
) {
  obj <- new("OBS",
             id = id,
             dataset_id = dataset_id,
             filepath = filepath,
             accessor = accessor,
             record_id = record_id
  )
  
  return(obj)
}

#' id
#' @description getter
#' @rdname id-OBS-get
#' @param x OBS object
#' @return value
#' @export
setMethod("id", "OBS", function(x) x@id)
#' id<-
#' @description setter
#' @rdname id-OBS-set
#' @param x OBS object
#' @param value value
#' @return nothing (setter)
#' @export
setMethod("id<-", "OBS", function(x, value) {
  x@id <- value
  x
})
#' dataset_id
#' @description getter
#' @rdname dataset_id-OBS-get
#' @param x OBS object
#' @return value
#' @export
setMethod("dataset_id", "OBS", function(x) x@dataset_id)
#' dataset_id<-
#' @description setter
#' @rdname dataset_id-OBS-set
#' @param x OBS object
#' @param value value
#' @return nothing (setter)
#' @export
setMethod("dataset_id<-", "OBS", function(x, value) {
  x@dataset_id <- value
  x
})
#' filepath
#' @description getter
#' @rdname filepath-OBS-get
#' @param x OBS object
#' @return value
#' @export
setMethod("filepath", "OBS", function(x) x@filepath)
#' filepath<-
#' @description setter
#' @rdname filepath-OBS-set
#' @param x OBS object
#' @param value value
#' @return nothing (setter)
#' @export
setMethod("filepath<-", "OBS", function(x, value) { 
  x@filepath <- value
  x 
})
#' accessor
#' @description getter
#' @rdname accessor-OBS-get
#' @param x OBS object
#' @return value
#' @export
setMethod("accessor", "OBS", function(x) x@accessor)
#' accessor<-
#' @description setter
#' @rdname accessor-OBS-set
#' @param x OBS object
#' @param value value
#' @return nothing (setter)
#' @export
setMethod("accessor<-", "OBS", function(x, value) { 
  x@accessor <- value
  x 
})
#' record_id
#' @description setter
#' @rdname record_id-OBS-get
#' @param x OBS object
#' @return value
#' @export
setMethod("record_id", "OBS", function(x) x@record_id)
#' record_id<-
#' @description setter
#' @rdname record_id-OBS-set
#' @param x OBS object
#' @param value value
#' @return nothing (setter)
#' @export
setMethod("record_id<-", "OBS", function(x, value) {
  x@record_id <- value
  x
})


# collapse function to sub object
setMethod("collapse_to_list", "OBS", function(x) {
  collapsed_list <- mapply(function(s) slot(x, s),
                           slotNames(x),
                           SIMPLIFY = FALSE)
  # Remove NULL values
  collapsed_list <- Filter(function(y) !is.null(y), collapsed_list)
  return(collapsed_list)
})
