[![R-CMD-check](https://github.com/KWB-R/kwb.default/workflows/R-CMD-check/badge.svg)](https://github.com/KWB-R/kwb.default/actions?query=workflow%3AR-CMD-check)
[![pkgdown](https://github.com/KWB-R/kwb.default/workflows/pkgdown/badge.svg)](https://github.com/KWB-R/kwb.default/actions?query=workflow%3Apkgdown)
[![codecov](https://codecov.io/github/KWB-R/kwb.default/branch/main/graphs/badge.svg)](https://codecov.io/github/KWB-R/kwb.default)
[![Project Status](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/kwb.default)]()
[![R-Universe_Status_Badge](https://kwb-r.r-universe.dev/badges/kwb.default)](https://kwb-r.r-universe.dev/)

# kwb.default

Functions to get and set default values for the formal
arguments of user defined functions.

## Installation

For details on how to install KWB-R packages checkout our [installation tutorial](https://kwb-r.github.io/kwb.pkgbuild/articles/install.html).

```r
### Optionally: specify GitHub Personal Access Token (GITHUB_PAT)
### See here why this might be important for you:
### https://kwb-r.github.io/kwb.pkgbuild/articles/install.html#set-your-github_pat

# Sys.setenv(GITHUB_PAT = "mysecret_access_token")

# Install package "remotes" from CRAN
if (! require("remotes")) {
  install.packages("remotes", repos = "https://cloud.r-project.org")
}

# Install KWB package 'kwb.default' from GitHub
remotes::install_github("KWB-R/kwb.default")
```

## Documentation

Release: [https://kwb-r.github.io/kwb.default](https://kwb-r.github.io/kwb.default)

Development: [https://kwb-r.github.io/kwb.default/dev](https://kwb-r.github.io/kwb.default/dev)
