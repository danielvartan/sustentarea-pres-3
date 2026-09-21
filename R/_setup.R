# Load Packages -----

library(brandr)
library(downlit)
library(ggplot2)
library(here)
library(knitr)
library(magrittr)
library(ragg)
library(systemfonts)
library(xml2)

# Set Options -----

options(
  dplyr.print_min = 6,
  dplyr.print_max = 6,
  pillar.max_footer_lines = 2,
  pillar.min_chars = 15,
  scipen = 10,
  digits = 10,
  stringr.view_n = 6,
  pillar.bold = TRUE,
  width = 77 # 80 - 3 for #> comment
)

# Set `knitr`` -----

clean_cache() |> suppressWarnings()

opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  root.dir = here(),
  dev = "ragg_png"
)

# Set `brandr` -----

options(BRANDR_BRAND_YML = here("_brand.yml"))

brandr_options <- list(
  "BRANDR_COLOR_SEQUENTIAL" = c("primary", "secondary") |> get_brand_color(),
  "BRANDR_COLOR_DIVERGING" = c("primary", "white", "secondary") |>
    get_brand_color(),
  "BRANDR_COLOR_QUALITATIVE" = c(
    "primary",
    "secondary",
    "tertiary",
    "light-green",
    "dark-red",
    "black"
  ) |>
    get_brand_color()
)

for (i in seq_along(brandr_options)) options(brandr_options[i])

# Set `systemfonts` -----

clear_registry()

register_font(
  name = "poppins",
  plain = here("fonts", "poppins-regular.ttf"),
  bold = here("fonts", "poppins-bold.ttf"),
  italic = here("fonts", "poppins-italic.ttf"),
  bolditalic = here("fonts", "poppins-bolditalic.ttf")
)

register_font(
  name = "dm-mono",
  plain = here("fonts", "dmmono-regular.ttf"),
  italic = here("fonts", "dmmono-italic.ttf")
)

registry_fonts()

# Set `ggplot2` -----

theme_set(
  theme_bw() +
    theme(
      text = element_text(
        color = get_brand_color("black"),
        family = "poppins",
        face = "plain"
      ),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      legend.frame = element_blank(),
      legend.ticks = element_line(color = get_brand_color("white"))
    )
)
