# Load Packages -----

library(beepr)
library(fs)
library(here)

# Copy images to `docs` -----

if (!dir_exists(here("images"))) {
  dir_create(here("images"), recurse = TRUE)
}

here(
  "images",
  c("og-image.png")
) |>
  file_copy(
    new_path = here("docs", "images"),
    overwrite = TRUE
  )

# Check If the Script Ran Successfully -----

beep(1)

Sys.sleep(3)
