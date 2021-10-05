#' @export

`%inwhichof%` <- function(x, list) {
    if(is.null(names(list))) stop("Please provide a named list.")
    names(which(
        vapply(list, `%in%`, TRUE, x = x)
    ))
}

#' @export

sets <- function(intrscts) {
    intrscts$sets
}

#' @export

universe <- function(intrscts) {
    intrscts$universe
}

