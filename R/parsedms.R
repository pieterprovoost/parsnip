#' Parse degrees minutes seconds
#'
#' @param input string value
#' @return decimal longitude and latitude
#' @export
parsedms <- function(input) {

  result <- data.frame(lon = numeric(0), lat = numeric(0))

  pattern <- "(-?\\d+(?:\\.\\d+)?)\\s*[°o]\\s*(?:(\\d+(?:\\.\\d+)?)\\s*[´`'ʹʻʼ′’]\\s*(?:(\\d+(?:\\.\\d+)?)\\s*(?:″|ʺ|\"|”|´´|``|''|ʹʹ|ʻʻ|ʼʼ|′′|’’)?)?)?\\s*([NSEW])?"
  matches <- str_match_all(input, regex(pattern, ignore_case = TRUE))

  if (length(matches) > 0) {
    for (m in 1:length(matches)) {

      coord <- list(lon = NA, lat = NA)
      match <- matches[[m]]

      if (nrow(match) > 0) {
        for (n in 1:nrow(match)) {

          d <- as.numeric(match[n, 2])
          m <- as.numeric(match[n, 3])
          s <- as.numeric(match[n, 4])
          h <- match[n, 5]

          if (!is.na(d)) {
            dd <- abs(d)
            if (!is.na(m)) {
              dd <- dd + m / 60
              if (!is.na(s)) {
                dd <- dd + s / 3600
              }
            }
            dd <- ifelse(d == 0, 1, sign(d)) * dd
            if (tolower(h) == "n") {
              coord$lat <- dd
            } else if (tolower(h) == "s") {
              coord$lat <- -dd
            } else if (tolower(h) == "e") {
              coord$lon <- dd
            } else if (tolower(h) == "w") {
              coord$lon <- -dd
            }
          }
        }
      }

      result <- rbind(result, coord)

    }
  }

  return(result)

}
