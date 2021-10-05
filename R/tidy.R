#' @export

tidy_sets <- function(x, by = c('set', 'element')) {
    if (length(by) > 1) by <- by[1]
    if (by == 'element') {
        list_tbl <- tibble(element = Reduce(union, x)) %>% 
            rowwise() %>% 
            mutate(sets = list(`%inwhichof%`(element, x)))
    }
    else if (by == 'set') {
        list_tbl <- tibble(set = names(x), elements = x)
    }
    return(list_tbl)
}

#' @export

tidy_intrscts <- function(intrscts, fisher = FALSE) {
    n <- unique(str_count(names(intrscts$intersects), '\\.\\.\\.') + 1)
    if (length(n) > 1) stop("Please run `intrscts(x, min_rank, max_rank)` with min_rank == max_rank to enable tidy representation of the intersects.")
    tbl <- tibble(names = names(intrscts$intersects)) %>%
        separate(names, sep = '\\.\\.\\.', into = paste0('set_', 1:n)) %>% 
        mutate(intersect = intrscts$intersects) 
    for (k in 1:n) {
        tbl <- tbl %>%
            left_join(
                sets(intrscts) %>% 
                lengths() %>% 
                as_tibble(rownames = paste0('set_', k)) %>% 
                setNames(c(paste0('set_', k), paste0('size_set_', k))), 
                by = paste0('set_', k)
            )
    }
    tbl <- tbl %>% 
        mutate(
            size_union = apply(., 1, function(x) {
                sets <- unlist(x[which(grepl('^set_', names(x)))])
                length(Reduce(union, sets(intrscts)[sets]))
            }, simplify = TRUE)
        ) %>% 
        rowwise() %>% 
        mutate(
            size_intersect = length(intersect), 
            size_universe = length(universe(intrscts)),
            ratio = size_intersect / size_union
        )
    if (n == 2 & fisher) {
        tbl <- tbl %>% 
            mutate(
                fisher.test(matrix(c(
                    size_intersect,
                    size_set_1 - size_intersect,
                    size_set_2 - size_intersect,
                    size_universe + size_intersect
                ), ncol = 2)) %>% 
                    broom::glance() %>% 
                    select(estimate, p.value) %>% 
                    dplyr::rename(weight = estimate) %>% 
                    mutate(estimate = log2(weight))
            ) %>% 
            mutate(
                adj.pval = p.adjust(p.value, method = 'BH')
            )
    }
    
    return(tbl)
}
