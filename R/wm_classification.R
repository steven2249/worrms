#' Get classification for an AphiaID
#'
#' @export
#' @param id (numeric/integer) an AphiaID. required.
#' @template curl
#' @examples
#' wm_classification(id = 105706)
#' wm_classification(id = 126436)
wm_classification <- function(id, ...) {
  assert(id, c("numeric", "integer"))
  res <- wm_GET(file.path(wm_base(), "AphiaClassificationByAphiaID", id), ...)
  done <- FALSE
  out <- list()
  it <- 0
  while (!done) {
    it <- it + 1
    ch <- res$child
    if (!is.null(ch)) {
      out[[it]] <- ch[!names(ch) %in% "child"]
      res <- list(child = ch$child)
    } else {
      done <- TRUE
    }
  }
  dat <- Filter(function(x) !is.null(x) && length(x) != 0, out)
  dat <- do.call("rbind.data.frame", dat)
  dat$rank <- as.character(dat$rank)
  dat$scientificname <- as.character(dat$scientificname)
  if (NROW(dat) == 0) dat <- NULL
  tibble::as_tibble(dat)
}
