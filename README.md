# parsnip

[![Travis-CI Build Status](https://travis-ci.org/pieterprovoost/parsnip.svg?branch=master)](https://travis-ci.org/pieterprovoost/parsnip)
[![Coverage Status](https://coveralls.io/repos/pieterprovoost/parsnip/badge.svg?branch=master&service=github)](https://coveralls.io/github/pieterprovoost/parsnip?branch=master)

Parsing geographical coordinate strings

## Parsing degrees/minutes/seconds

```R
parsedms("51°28'38''N 101°16'56''W")
parsedms("51°28'38\"N 101°16'56\"W")
parsedms("51°28`38''N 101°16′56″W")
parsedms("51o28`38''N 101°16′56″W")
parsedms("51°28`38''n 101°16′56″w")
parsedms("51° 28' 38'' N 101° 16' 56'' W")
parsedms("51 ° 28 ' 38 '' N 101 ° 16 ' 56 '' W")
parsedms("51°28'38''N -101°16'56''E")
parsedms("51° N 101° W")
parsedms("51° N")
parsedms("12° N 109° 58’ 37” W")
```
