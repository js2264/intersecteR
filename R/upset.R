#' @export

upset <- function(x) {
    if ('intrscts' %in% class(x)) x <- sets(x)
    list_tbl <- tidy_sets(x, by = 'element')
    p <- ggplot(list_tbl, aes(x = sets)) + 
        geom_bar() + 
        ggupset::scale_x_upset()
    return(p)
}

