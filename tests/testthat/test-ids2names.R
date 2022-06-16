test_that("ids2names works", {

  result <- ids2names(
                ref_ids=c("id1","id2"),
                ref_names=c("a","b"),
                input_ids=c("id1","id3","id2","id1")
            )

  expected <- c("a", "id3", "b", "a")

  expect_equal(result, expected)
})
