## ------------------------------------------------------------------------
library(kwb.default)

## ------------------------------------------------------------------------
hello1 <- function
(
  firstName = "Mona", 
  lastName = "Lisa"
) 
{
  cat(paste0("Hello ", firstName, " ", lastName, "!\n"))
}

## ------------------------------------------------------------------------
hello2 <- function
(
  firstName = getDefault("hello2", "firstName"),
  lastName = getDefault("hello2", "lastName")
) 
{
  cat(paste0("Hello ", firstName, " ", lastName, "!\n"))
}

## ------------------------------------------------------------------------
setDefault("hello2", firstName = "Mona", lastName = "Lisa")

## ------------------------------------------------------------------------
hello1()
hello2()

## ------------------------------------------------------------------------
setDefault("hello2", firstName = "Don", lastName = "Quichote")

## ------------------------------------------------------------------------
hello2()

## ---- error = TRUE-------------------------------------------------------
tryCatch(setDefault("hello", firstName = "Peter"))

## ------------------------------------------------------------------------
getDefault("hello2", "firstName")
getDefault("hello2", "lastName")

