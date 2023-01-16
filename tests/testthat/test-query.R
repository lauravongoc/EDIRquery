
test_that("Querying of internal data is correct", {
    gaa <- gene_lookup("GAA", length = 10)

    expect_equal(nrow(gaa), 690)
    expect_equal(unique(gaa$repeat_length), 10)
    expect_equal(unique(gaa$hgnc_symbol), "GAA")
    expect_equal(length(unique(gaa$mismatch)), 2)

    gaa <- gene_lookup("GAA", summary = TRUE)
    expect_equal(nrow(gaa$summary), 10)
    expect_equal(nrow(gaa$results), 24843)
    expect_false(gaa$summary$repeat_length[10] > 16)

    gaa <- gene_lookup("GAA", length = 10, mismatch = FALSE)
    expect_equal(nrow(gaa), 34)
    expect_equal(length(unique(gaa$mismatch)), 1)

})
