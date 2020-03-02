# rtemps

My personal favourite `R` templates for doing reproducible data analyses.

## Available Themes

- [United HTML Document](https://bootswatch.com/united/): a bootstrap-based single [R Markdown](https://bookdown.org/yihui/rmarkdown/) document
- [Bookdown Lite](https://bookdown.org/yihui/bookdown/): a single-paged [gitbook-based](https://www.gitbook.com/) document

## Install

```r
devtools::install_github("bblodfon/rtemps")
```

Note that the template example reports use the libraries [DT](https://rstudio.github.io/DT/), [ggplot2](https://github.com/tidyverse/ggplot2) and [xfun](https://github.com/yihui/xfun).

## Usage

Once the templates are installed, you can use them in 2 ways:

1. Within the R Markdown templates in **RStudio**: `File` > `New File` > `R Markdown...` > `From Template`.
2. By calling the `create_rtemp()` function which allows you to create a new directory with all the template files inside, ready to be used/rendered.

## Notes

### United HTML Theme

- To create and render the template from an R session, run:
```r
rtemps::create_rtemp(dirname = "new-dir", template = "united_html")
rmarkdown::render(input = "new-dir/index.Rmd", output_format = "html_document", output_dir = "new-dir")
```

### Bookdown Lite Theme

- For the *Bookdown Lite* theme to work in RStudio (usage option 1), **you have to rename the main *.Rmd* file to `index.Rmd` inside the created directory**. 
Only then the **RStudio** IDE will *understand* the format and create the `build Tool` option when you **create a project inside the newly created directory**.

Of course, you can always just use the `build_book.sh` script to render the book directly as in the commands below (for **Linux users**):
```bash
Rscript -e "rtemps::create_rtemp(dirname = 'new-dir', template = 'bookdown_lite')"
cd new-dir
./build_book.sh
Rscript -e "bookdown::render_book(input = 'index.Rmd', output_format = 'bookdown::gitbook')"
```

For **Windows users**, simply execute the previous commands inside an R session:
```
rtemps::create_rtemp(dirname = 'new-dir', template = 'bookdown_lite')
cd new-dir # or the Windows equivalent :)
bookdown::render_book(input = 'index.Rmd', output_format = 'bookdown::gitbook')
```

The last command is inside the provided `build_book.sh` file.

- The output of the *Bookdown Lite* theme is placed under a `docs` directory, so that it can easily be rendered with [GitHub Pages](https://help.github.com/en/github/working-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site).
- The *Bookdown Lite* can be easily converted to a **multi-paged document** by configuring the `split_by` property in the `_output.yml` template file ([check the doc](https://bookdown.org/yihui/bookdown/html.html#gitbook-style)).
