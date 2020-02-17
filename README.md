# r-templates

My personal favourite `R` templates for doing reproducible data analyses among others.

## Available Themes

- [United HTML Document](https://bootswatch.com/united/): a bootstrap-based single [Rmarkdown](https://bookdown.org/yihui/rmarkdown/) document
- [Bookdown Lite](https://bookdown.org/yihui/bookdown/): a single-paged bookdown-based document

Note that the template example reports use the libraries [DT](https://rstudio.github.io/DT/), [ggplot2](https://github.com/tidyverse/ggplot2) and [xfun](https://github.com/yihui/xfun).

## Install

```r
devtools::install_github("bblodfon/rtemps")
```

## Use

Once the templates are installed, you can use them in 2 ways:

1. Within the R Markdown templates in **RStudio**: `File` > `New File` > `R Markdown...` > `From Template`.  
    Note that for the `gitbook` theme to work **you have to rename the main *.Rmd* file to `index.Rmd` inside the created directory**. 
    Only then the **Rstudio** IDE will 'understand' the format and create the `build Tool` option when you create a project inside the newly created directory. 
    Of course, you can always just use the `build_book.sh` script to render the book directly (see below).
2. By calling the `create_rtemp()` function which allows you to create a new directory with all the template files inside, ready to be used. For example:

```r
rtemps::create_rtemp(dirname = "my_dir", template = "united_html")
rmarkdown::render(input = "my_dir/index.Rmd", output_format = "html_document", output_dir = "my_dir")
```

  - For the `gitbook`-based theme, run the following commands in the command line:
```bash
Rscript -e "rtemps::create_rtemp(dirname = 'my_dir', template = 'bookdown_lite')"
cd my_dir
./build_book.sh
```
