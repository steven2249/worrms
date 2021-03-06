#' Get synonyms for an AphiaID
#'
#' @export
#' @param id (numeric/integer) an AphiaID. required.
#' @template curl
#' @examples
#' wm_synonyms(id = 105706)
wm_synonyms <- function(id, ...) {
  assert(id, c("numeric", "integer"))
  wm_GET(file.path(wm_base(), "AphiaSynonymsByAphiaID", id), ...)
}
