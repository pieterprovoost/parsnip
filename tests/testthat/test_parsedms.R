library(parsnip)
context("parsedms")

tolerance <- 0.0001

strings <- list(
  list(input = "51°28'38''N 101°16'56''W", output = c(-101.2822, 51.4772)),
  list(input = "51°28'38\"N 101°16'56\"W", output = c(-101.2822, 51.4772)),
  list(input = "51°28`38''N 101°16′56″W", output = c(-101.2822, 51.4772)),
  list(input = "51o28`38''N 101°16′56″W", output = c(-101.2822, 51.4772)),
  list(input = "51°28`38''n 101°16′56″w", output = c(-101.2822, 51.4772)),
  list(input = "51° 28' 38'' N 101° 16' 56'' W", output = c(-101.2822, 51.4772)),
  list(input = "51 ° 28 ' 38 '' N 101 ° 16 ' 56 '' W", output = c(-101.2822, 51.4772)),
  list(input = "51°28'38''N -101°16'56''E", output = c(-101.2822, 51.4772)),
  list(input = "51° N 101° W", output = c(-101.0000, 51.0000)),
  list(input = "51° N", output = c(NA, 51.0000)),
  list(input = "12° N 109° 58’ 37” W", output = c(-109.9769, 12.0000))
)

for (i in 1:length(strings)) {

  test_that(paste0(strings[[i]]$input, " is parsed correctly"), {
    result <- parsedms(strings[[i]]$input)
    expect_true(all.equal(strings[[i]]$output, as.numeric(result[1,]), tolerance = tolerance))
  })

}

