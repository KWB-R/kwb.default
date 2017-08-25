# getDefault -------------------------------------------------------------------
#' Get the default value that is defined for a function's argument
#'
#' @param funName Name of the function
#' @param argName Name of the formal argument
#' @param default Default value to use if no default value is stored for
#'   argument \code{argName} of function \code{funName}
#' @param warn if \code{TRUE} (default) a message is given if no defaults are
#'   defined for the given function or argument and if \code{default} is
#'   returned instead.
#' @return default value that is defined for the formal argument \code{argName}
#'   of the user-defined function \code{funName}
#' @seealso \code{\link{setDefault}}
#' @export
#' @examples
#' # Once you have defined a function...
#' hello <- function(firstName = getDefault("hello", "firstName")) {
#'   cat("Hello", firstName, "\n")
#' }
#'
#' # ... you can define the default value for its arguments...
#' setDefault("hello", firstName = "Peter")
#'
#' # ... and read it back with getDefault()...
#' getDefault("hello", "firstName")
getDefault <- function(funName, argName, default = NULL, warn = TRUE)
{
  defaults <- getDefaults()

  if (! funName %in% names(defaults)) {

    errorMessage <- paste0(
      "There are no defaults for function '", funName, "' defined! ",
      .hint_setDefault(funName, argName)
    )

    if (! functionAvailable(funName)) {
      errorMessage <- paste0(errorMessage, " Also, '", funName,
                             "' does not seem to be a function! ")
    }

    if (warn) {
      message(errorMessage, "Returning the default value: ", default)
    }

    return(default)
  }

  funDefaults <- defaults[[funName]]

  if (! argName %in% names(funDefaults)) {

    errorMessage <- paste0(
      "There is no default defined for argument '", argName, "' of function '",
      funName, "'! ", .hint_setDefault(funName, argName)
    )

    if (! argName %in% getArgumentNames(funName)) {
      errorMessage <- paste0(
        errorMessage, " Also, '", argName, "' is not a formal argument of ",
        "function '", funName, "'!"
      )
    }

    if (warn) {
      message(errorMessage, "Returning the default value: ", default)
    }

    return(default)
  }

  funDefaults[[argName]]
}

# .hint_setDefault -------------------------------------------------------------
.hint_setDefault <- function(funName, argName)
{
  paste0("Use setDefault('", funName, "', ", argName, " = ...) to set a ",
         "default value.")
}

# getDefaults ------------------------------------------------------------------
getDefaults <- function(name = .defaultName(), init.if.missing = TRUE)
{
  if (! name %in% names(options())) {

    if (init.if.missing) {

      setDefaults(list(), name = name)

    } else {

      stop("No option '", name, "' available! Use setDefaults() first!")
    }
  }

  defaults <- getOption(name)

  if (! is.list(defaults)) {
    stop("The option '", name, "' must be a list but it is of mode '",
         mode(defaults), "'!")
  }

  defaults
}

# .defaultName -----------------------------------------------------------------
.defaultName <- function() {
  "kwb.default.list"
}

# setDefaults ------------------------------------------------------------------
setDefaults <- function(defaults = list(), name = .defaultName())
{
  do.call(options, structure(list(defaults), names = name))
}

# functionAvailable ------------------------------------------------------------
functionAvailable <- function(funName)
{
  ! inherits(try(.getFunction(funName)), "try-error")
}

# .getFunction -----------------------------------------------------------------
.getFunction <- function(x)
{
  parts <- strsplit(x, "::")[[1]]

  if (length(parts) > 1) {

    get(parts[2], envir = asNamespace(parts[1]))

  } else {

    get(parts[1])
  }
}

# getArgumentNames -------------------------------------------------------------
getArgumentNames <- function(funName)
{
  stopIfNoSuchFunction(funName)

  names(formals(.getFunction(funName)))
}

# stopIfNoSuchFunction ---------------------------------------------------------
stopIfNoSuchFunction <- function(funName)
{
  if (! functionAvailable(funName)) {
    stop("'", funName, "' does not seem to be a function!", call. = FALSE)
  }
}

# setDefault -------------------------------------------------------------------
#' Define the default value for a function's argument
#'
#' @param funName Name of the function
#' @param ... default value assignments in the form of \code{key = value} pairs
#' @export
#' @seealso \code{\link{getDefault}}
#' @examples
#' \dontrun{
#'
#' # This will lead to an error if funtion "hello" is not defined
#' setDefault("hello", firstName = "Peter")
#'
#' # Define the function and use getDefault instead of a constant default value
#' hello <- function(
#'   firstName = getDefault("hello", "firstName"),
#'   lastName = getDefault("hello", "lastName")
#' )
#' {
#'   cat(paste0("Hello ", firstName, " ", lastName, "!\n") )
#' }
#'
#' # Now you can define the argument defaults
#' setDefault("hello", firstName = "Don", lastName = "Quichote")
#'
#' # If you call the function without arguments, the defaults are used
#' hello()
#'
#' # You can now change the defaults without changing the function definition
#' setDefault("hello", firstName = "Mona", lastName = "Lisa")
#'
#' hello()
#' }
setDefault <- function(funName, ...)
{
  stopIfNoSuchFunction(funName)

  assignments <- list(...)

  argNames <- names(assignments)

  if (is.null(argNames) || any(argNames == "")) {
    stop("No unnamed arguments expected!")
  }

  defaults <- getDefaults()

  if (! funName %in% names(defaults)) {
    defaults[[funName]] <- list()
  }

  for (argName in argNames) {

    stopIfNoSuchArgument(funName, argName)

    defaults[[funName]][[argName]] <- assignments[[argName]]
  }

  setDefaults(defaults)
}

# stopIfNoSuchArgument ---------------------------------------------------------
stopIfNoSuchArgument <- function(funName, argName)
{
  stopIfNoSuchFunction(funName)

  argNames <- getArgumentNames(funName)

  if (! argName %in% argNames) {
    stop(
      "'", funName, "' does not have a formal argument called '",
      argName, "'! Available formal arguments: ",
      paste0("'", argNames, "'", collapse = ", "),
      call. = FALSE
    )
  }
}
