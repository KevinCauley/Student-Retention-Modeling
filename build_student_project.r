# =========================================================
# Student Retention Predictive Modeling Portfolio Build
# Kevin Cauley
# =========================================================

library(here)
library(rmarkdown)

# ---------------------------------------------------------
# 1. Confirm project root
# ---------------------------------------------------------

message("Project root: ", here())

# ---------------------------------------------------------
# 2. Ensure required folders exist
# ---------------------------------------------------------

dir.create(here("analysis"), showWarnings = FALSE, recursive = TRUE)

dir.create(here("docs"), showWarnings = FALSE, recursive = TRUE)
dir.create(here("docs", "assets"), showWarnings = FALSE, recursive = TRUE)

dir.create(here("docs", "figures"), showWarnings = FALSE, recursive = TRUE)
dir.create(here("docs", "figures", "eda"), showWarnings = FALSE, recursive = TRUE)
dir.create(here("docs", "figures", "modeling"), showWarnings = FALSE, recursive = TRUE)
dir.create(here("docs", "figures", "results"), showWarnings = FALSE, recursive = TRUE)
dir.create(here("docs", "figures", "insights"), showWarnings = FALSE, recursive = TRUE)

dir.create(here("data"), showWarnings = FALSE, recursive = TRUE)
dir.create(here("data", "raw"), showWarnings = FALSE, recursive = TRUE)
dir.create(here("data", "processed"), showWarnings = FALSE, recursive = TRUE)

# ---------------------------------------------------------
# 3. Confirm docs assets exist
# ---------------------------------------------------------

if (!file.exists(here("docs", "assets", "header.html"))) {
  writeLines(
    '<meta name="viewport" content="width=device-width, initial-scale=1.0">',
    here("docs", "assets", "header.html")
  )
}

if (!file.exists(here("docs", "assets", "styles.css"))) {
  stop("Missing docs/assets/styles.css. Place styles.css inside the docs/assets folder.")
}

# ---------------------------------------------------------
# 4. Define pages in render order
# ---------------------------------------------------------

pages <- c(
  "index.Rmd",
  "student_retention_eda.Rmd",
  "student_retention_modeling.Rmd",
  "student_retention_results.Rmd",
  "student_retention_insights.Rmd"
)

page_paths <- here("analysis", pages)
existing_page_paths <- page_paths[file.exists(page_paths)]

if (length(existing_page_paths) == 0) {
  stop("No RMarkdown pages found in the analysis folder.")
}

message("Pages found:")
print(existing_page_paths)

# ---------------------------------------------------------
# 5. Render pages from analysis/ into docs/
# ---------------------------------------------------------

for (page_path in existing_page_paths) {
  message("Rendering: ", page_path)
  
  rmarkdown::render(
    input = page_path,
    output_dir = here("docs"),
    intermediates_dir = here("analysis"),
    clean = TRUE,
    envir = new.env(parent = globalenv())
  )
}

# ---------------------------------------------------------
# 6. Rewrite CSS links for docs/ output
# ---------------------------------------------------------

html_files <- list.files(
  path = here("docs"),
  pattern = "\\.html$",
  full.names = TRUE
)

for (html_file in html_files) {
  html_text <- readLines(html_file, warn = FALSE, encoding = "UTF-8")
  
  # Normalize any old CSS paths back to the docs-relative path
  html_text <- gsub(
    '../assets/styles.css',
    'assets/styles.css',
    html_text,
    fixed = TRUE
  )
  
  # Remove an existing cache-buster if the file has already been rendered before
  html_text <- gsub(
    'assets/styles.css?v=20260619',
    'assets/styles.css',
    html_text,
    fixed = TRUE
  )
  
  # Add cache-buster so the browser loads the newest CSS
  html_text <- gsub(
    'assets/styles.css',
    'assets/styles.css?v=20260619',
    html_text,
    fixed = TRUE
  )
  
  writeLines(html_text, html_file, useBytes = TRUE)
}

# ---------------------------------------------------------
# 7. Build complete
# ---------------------------------------------------------

message("Build complete.")
message("CSS used by site: ", here("docs", "assets", "styles.css"))
message("Header used during render: ", here("docs", "assets", "header.html"))
message("Open docs/index.html to view the portfolio site.")
message("If the browser still shows old styling, hard refresh with Ctrl + F5.")