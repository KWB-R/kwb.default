# kwb.default

## Installation

```{r}
devtools::install_github("kwb-r/kwb.default")
```

## Usage

```{r}
library(kwb.default)

# Once you have defined a function...
hello <- function(firstName = getDefault("hello", "firstName")) {
  cat("Hello", firstName, "\n")
}

# ... you can define the default value for its arguments...
setDefault("hello", firstName = "Peter")

# ... and read it back with getDefault()...
getDefault("hello", "firstName")
```
