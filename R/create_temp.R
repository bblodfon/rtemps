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
#' The available templates are: \emph{united_html} (default).
#' The name of the main \code{.Rmd} file will be \emph{test.Rmd}.
#'
#' @examples
#' \dontrun{
#' create_rtemp(dirname = "tmp_dir", format = "united_html")
#' }
#'
#' @export
create_rtemp = function(dirname = "new-dir", template = "united_html") {
  templates = c("united_html")
  temp = match.arg(template, templates)

  if (dir.exists(dirname)) {
    stop(paste0("There is already a directory `", dirname,
      "`. Please supply a different directory name"))
  }

  dir.create(dirname)

  file.copy(
    system.file(file.path("rmarkdown", "templates", temp, "skeleton", "skeleton.Rmd"), package = "rtemps"),
    file.path(dirname)
  )
  file.copy(
    system.file(file.path("rmarkdown", "templates", temp, "skeleton", "style.css"), package = "rtemps"),
    file.path(dirname)
  )

  file.rename(file.path(dirname, "skeleton.Rmd"), file.path(dirname, "test.Rmd"))
}

