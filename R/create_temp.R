#' Create a new directory with the specified R template
#'
#' This function creates a new directory under the current directory, which will
#' contain the given files of the specified template, ready to be rendered.
#'
#' @param dirname name of the directory to create. If not specified, a directory
#' \emph{new-dir} will be created.
#' @param template which template to use?
#'
#' @details
#' The available templates are: \emph{united_html} (default), \emph{bookdown_lite}.
#' The name of the main \code{.Rmd} file will be \emph{index.Rmd}.
#'
#' @examples
#' \dontrun{
#' create_rtemp(dirname = "tmp_dir", template = "united_html")
#' }
#'
#' @export
create_rtemp = function(dirname = "new-dir", template = "united_html") {
  # check input
  temp = match.arg(template, c("united_html", "bookdown_lite"))

  # create directory
  if (dir.exists(dirname)) {
    stop(paste0("There is already a directory `", dirname,
      "`. Please specify a different directory name"))
  }
  dir.create(dirname)

  # copy files from template directory
  template.dir = system.file(file.path("rmarkdown", "templates", temp, "skeleton"), package = "rtemps")
  files.to.copy = list.files(template.dir)
  file.copy(file.path(template.dir, files.to.copy), file.path(dirname), recursive = TRUE)

  file.rename(file.path(dirname, "skeleton.Rmd"), file.path(dirname, "index.Rmd"))
}

#' Create Bookdown Lite Project Template
#'
#' Code was copied from the \href{https://github.com/rstudio/bookdown/blob/master/R/skeleton.R}{bookdwon package}.
#'
#' @importFrom xfun read_utf8 write_utf8
bookdown_skeleton = function(path) {
  # ensure directory exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # copy 'resources' folder to path
  resources = system.file('rstudio', 'templates', 'project', 'resources',
    package = 'rtemps', mustWork = TRUE)

  files = list.files(resources, recursive = TRUE, include.dirs = FALSE)

  source = file.path(resources, files)
  target = file.path(path, files)
  file.copy(source, target)

  # add book_filename to _bookdown.yml and default to the base path name
  f = file.path(path, '_bookdown.yml')
  x = xfun::read_utf8(f)
  xfun::write_utf8(c(sprintf('book_filename: "%s"', basename(path)), x), f)

  TRUE
}

# Suppress R CMD check note
#' @importFrom bookdown render_book
#' @importFrom rmarkdown render
#' @importFrom knitr read_chunk
#' @importFrom DT datatable
#' @importFrom ggplot2 aes
