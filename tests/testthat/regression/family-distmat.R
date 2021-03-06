context("\tFamilies' distance matrices")

# =================================================================================================
# setup
# =================================================================================================

## Original objects in env
ols <- ls()

# =================================================================================================
# distmats
# =================================================================================================

with(persistent, {
    test_that("Distance matrices calculated with families give the same results as references.", {
        skip_on_cran()

        expect_equal_to_reference(distmat_lbk, file_name(distmat_lbk), info = "LBK")
        expect_equal_to_reference(distmat_lbi, file_name(distmat_lbi), info = "LBI")
        expect_equal_to_reference(distmat_sbd, file_name(distmat_sbd), info = "SBD")
        expect_equal_to_reference(distmat_dtwlb, file_name(distmat_dtwlb), info = "DTW_LB")
        expect_equal_to_reference(distmat_dtw, file_name(distmat_dtw), info = "DTW")
        expect_equal_to_reference(distmat_dtw2, file_name(distmat_dtw2), info = "DTW2")
        expect_equal_to_reference(distmat_dtwb, file_name(distmat_dtwb), info = "DTW_BASIC")
        expect_equal_to_reference(distmat_gak, file_name(distmat_gak), info = "GAK")
    })
})

# =================================================================================================
# clean
# =================================================================================================
rm(list = setdiff(ls(), ols))
