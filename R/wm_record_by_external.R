#' Get record by external ID
#'
#' @export
#' @param id (numeric/integer) an AphiaID. required.
#' @param type (character) the type of external id. one of: tsn, bold,
#' dyntaxa, eol, fishbase, iucn, lsid, ncbi, gisd. default: tsn
#' @template curl
#' @examples
#' wm_record_by_external(id = 85257)
#' wm_record_by_external(id = 159854)
wm_record_by_external <- function(id, type = "tsn", ...) {
  assert(id, c("numeric", "integer"))
  assert(type, "character")
  wm_GET(file.path(wm_base(), "AphiaRecordByExternalID", id),
         query = cc(list(type = type)), ...)
}
