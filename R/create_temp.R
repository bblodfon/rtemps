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
  templates = c("united_html", "bookdown_lite")
  temp = match.arg(template, templates)

  # create directory
  if (dir.exists(dirname)) {
    stop(paste0("There is already a directory `", dirname,
      "`. Please specify a different directory name"))
  }
  dir.create(dirname)

  # copy files from template directory
  template.dir = system.file(file.path("rmarkdown", "templates", temp, "skeleton"), package = "rtemps")
  files.to.copy = list.files(template.dir)
  file.copy(file.path(template.dir, files.to.copy),
    file.path(dirname), recursive = TRUE)

  file.rename(file.path(dirname, "skeleton.Rmd"), file.path(dirname, "index.Rmd"))
}

