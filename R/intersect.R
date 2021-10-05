#' @export

intrscts <- function(list, min_rank = 2, max_rank = length(list)) {
    ## Check if list is named 
    if(is.null(names(list))) stop("Please provide a named list.")

    ## List names
    .names <- names(list)

    ## Get all possible combinations of names
    min_rank <- max(2, min_rank)
    .combs <- lapply(min_rank:max_rank, function(k) {
        combn(length(.names), k, function(arg) {paste(.names[arg], collapse = '...')}, simplify = FALSE)
    }) %>% purrr::flatten() %>% unlist()
    
    ## Get intersects for all pairs 
    .inters <- lapply(min_rank:max_rank, function(k) {
        combn(length(.names), k, function(arg) {Reduce(intersect, list[arg])}, simplify = FALSE)
    }) %>% purrr::flatten()
    names(.inters) <- .combs
    
    ## Remove empty intersections
    .inters <- .inters[lengths(.inters) > 0]

    ## Save original list as attributes
    intrscts <- list(
        intersects = .inters, 
        sets = list, 
        universe = Reduce(union, list)
    )
    attr(intrscts, 'class') <- c('intrscts', 'list')
    
    return(intrscts)

}

#' @export

print.intrscts <- function(x) {
    cli::cli_bullets(crayon::silver(glue::glue('## {length(x$intersects)} intersects between {length(x$sets)} sets.')))
    cli::cli_bullets(crayon::silver(glue::glue('## Universe: {length(x$universe)} elements')))
    class(x) <- 'list'
    lapply(seq(1, min(10, length(x$intersects))), function(y) {
        cli::cli_verbatim(crayon::white(glue::glue("Set #{y} (n = {length(x$intersects[[y]])}): {names(x$intersects)[y]} [{paste(head(x$intersects[[y]]), collapse = ', ')}]")))
    })
}
