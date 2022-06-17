test_that("gtf2names works", {
  path <- withr::local_tempfile(
    pattern = "myGTFfile.gtf",
    fileext = ".gtf",
    lines = c('#!genome-build GRCh38.p13',
          '#!genome-version GRCh38',
          '#!genome-date 2013-12',
          '#!genome-build-accession GCA_000001405.28',
          '#!genebuild-last-updated 2021-11',
          '1	ensembl_havana	gene	1211340	1214153	.	-	.	gene_id "ENSG00000186827"; gene_version "11"; gene_name "TNFRSF4"; gene_source "ensembl_havana"; gene_biotype "protein_coding";',
          '1	ensembl_havana	transcript	1211340	1214153	.	-	.	gene_id "ENSG00000186827"; gene_version "11"; transcript_id "ENST00000379236"; transcript_version "4"; gene_name "TNFRSF4"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; transcript_name "TNFRSF4-201"; transcript_source "ensembl_havana"; transcript_biotype "protein_coding"; tag "CCDS"; ccds_id "CCDS11"; tag "basic"; transcript_support_level "1 (assigned to previous version 3)";',
          '1	ensembl_havana	exon	1213983	1214153	.	-	.	gene_id "ENSG00000186827"; gene_version "11"; transcript_id "ENST00000379236"; transcript_version "4"; exon_number "1"; gene_name "TNFRSF4"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; transcript_name "TNFRSF4-201"; transcript_source "ensembl_havana"; transcript_biotype "protein_coding"; tag "CCDS"; ccds_id "CCDS11"; exon_id "ENSE00001832731"; exon_version "2"; tag "basic"; transcript_support_level "1 (assigned to previous version 3)";',
          '1	ensembl_havana	CDS	1213983	1214127	.	-	0	gene_id "ENSG00000186827"; gene_version "11"; transcript_id "ENST00000379236"; transcript_version "4"; exon_number "1"; gene_name "TNFRSF4"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; transcript_name "TNFRSF4-201"; transcript_source "ensembl_havana"; transcript_biotype "protein_coding"; tag "CCDS"; ccds_id "CCDS11"; protein_id "ENSP00000368538"; protein_version "3"; tag "basic"; transcript_support_level "1 (assigned to previous version 3)";',
          '1	ensembl_havana	start_codon	1214125	1214127	.	-	0	gene_id "ENSG00000186827"; gene_version "11"; transcript_id "ENST00000379236"; transcript_version "4"; exon_number "1"; gene_name "TNFRSF4"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; transcript_name "TNFRSF4-201"; transcript_source "ensembl_havana"; transcript_biotype "protein_coding"; tag "CCDS"; ccds_id "CCDS11"; tag "basic"; transcript_support_level "1 (assigned to previous version 3)";',
          '4	ensembl_havana	gene	99070978	99088801	.	-	.	gene_id "ENSG00000197894"; gene_version "12"; gene_name "ADH5"; gene_source "ensembl_havana"; gene_biotype "protein_coding";',
          'KI270713.1	ensembl	gene	30437	30580	.	-	.	gene_id "ENSG00000275987"; gene_version "1"; gene_name "U1"; gene_source "ensembl"; gene_biotype "snRNA";',
          '12	havana	gene	6532290	6533498	.	-	.	gene_id "ENSG00000255966"; gene_version "1"; gene_name "GAPDH-DT"; gene_source "havana"; gene_biotype "lncRNA";',
          '12	ensembl_havana	gene	6534512	6538374	.	+	.	gene_id "ENSG00000111640"; gene_version "15"; gene_name "GAPDH"; gene_source "ensembl_havana"; gene_biotype "protein_coding";'
    )
  )
  result <- gtf2names(
                         ref_gtf=path, 
                         input_ids=c("ENSG00000275987","id3","ENSG00000111640","ENSG00000197894")
                     )
  expected <- c("U1", "id3", "GAPDH", "ADH5")

  expect_equal(result, expected)
})
