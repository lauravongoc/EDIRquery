test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("Incorrect or missing input parameters gives errors", {
    expect_error(gene_lookup(),
                "missing")
    expect_error(gene_lookup("ABCDE"),
                 "Incorrect gene ID")
    expect_error(gene_lookup("GAA", mindist = 100, maxdist = 10),
                 "mindist must be less than")
    expect_error(gene_lookup("GAA", format = "GRanges"),
                 "Format must be one of")
    expect_error(gene_lookup("GAA", length = 3),
                 "Length must be between")
    expect_error(gene_lookup("MTOR", path = NA),
                 "GAA")
})
