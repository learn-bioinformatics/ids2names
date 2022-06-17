library(rtracklayer)

#' Given a GTF file name, extract out the gene IDs and their corresponding gene names.
#'
#' @param ref_gtf A reference GTF file name
#' @param input_ids A vector containing gene ids that will be matched against the reference gene ids from the GTF file
#' @return A string vector the same length and order as input_ids. Each element is the reference name if the given input gene id was found among the reference gene ids, otherwise it will be the original input id.
#' @examples
#' \dontrun{
#' gene_names_or_ids <- gtf2names(
#'                            ref_gtf="example.Homo_sapiens.GRCh38.106.gtf",
#'                            input_ids=c("ENSG00000275987","id3","ENSG00000111640","ENSG00000198099")
#'                          )
#' print(gene_names_or_ids) # outputs [1] "U1"   "id3" "GAPDH"   "ADH4"
#' }
#' @export
gtf2names <- function(ref_gtf,input_ids) {
    gtf <- rtracklayer::import(ref_gtf)

    name_or_id <- function(id) {

        # Check if id is found
        has_matching_ID <- id %in% gtf$gene_id

        # If not found, just return the query Ensembl ID
        if (isTRUE(has_matching_ID)) {
            matching_name <- gtf$gene_name[gtf$gene_id == id]
            return(matching_name)
        } else {
            return(id)
        }
    }

    names_from_ids <- sapply(input_ids, name_or_id)
    clean_names <- unlist(unname(names_from_ids))
    clean_names
}

if (length(sys.frames()) == 0 ) {
    args <- commandArgs(trailingOnly = TRUE)
    cat("This file is meant to be a package loaded in another function")
    q("no")
}
