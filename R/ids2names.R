#' Given a set of reference IDs, corresponding reference names, and a vector of query IDs, get a vector of common names for the input IDs (or the original input IDs for those IDs not in the reference).
#'
#' @param ref_ids A vector of ids
#' @param ref_names A vector, the same length as ref_ids
#' @param input_ids A vector containing ids that will be matched against the reference ids.
#' @return A string vector the same length and order as input_ids. Each element is the reference name if the given input id was found among the reference ids, otherwise it will be the original input id.
#' @examples
#' gene_names_or_ids <- ids2names(
#'                            ref_ids=c("id1","id2"),
#'                            ref_names=c("a","b"),
#'                            input_ids=c("id1","id3","id2","id1")
#'                          )
#' print(gene_names_or_ids) # outputs [1] "a"   "id3" "b"   "a"
#' @export
ids2names <- function(ref_ids,ref_names,input_ids) {
    df <- data.frame(name=ref_names)
    rownames(df) <- ref_ids

    name_or_id <- function(id) {

        # Check if id is found
        has_matching_ID <- id %in% ref_ids

        # If not found, just return the query Ensembl ID
        if (isTRUE(has_matching_ID)) {
            matching_name <- df[id, "name"]
            return(matching_name)
        } else {
            return(id)
        }
    }

    names_from_ids <- sapply(input_ids, name_or_id)
    clean_names <- unname(names_from_ids) 
    clean_names
}

if (length(sys.frames()) == 0 ) {
    args <- commandArgs(trailingOnly = TRUE)
    cat("This file is meant to be a package loaded in another function")
    q("no")
}
