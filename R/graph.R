#' @export 

embed <- function(x, ...) {
    UseMethod("embed")
}

#' @export 

embed.default <- function(x) {
    tidygraph::tbl_graph(
        edges = x, 
        directed = FALSE
    )
}

#' @export 

embed.list <- function(x, threshold = 0.001) {
    intersects <- intrscts(x, min_rank = 2, max_rank = 2)
    embed(intersects, threshold)
}

#' @export 

embed.intrscts <- function(x, threshold = 0.001) {
    n <- unique(str_count(names(x$intersects), '\\.\\.\\.') + 1)
    if (length(n) > 1) stop("Please run `intrscts(x, min_rank = 2, max_rank = 2)` to enable graph embedding.")
    if (n != 2) stop("Please run `intrscts(x, min_rank = 2, max_rank = 2)` to enable graph embedding.")
    tbl <- tidy_intrscts(x) 
    embed(tbl)
}


