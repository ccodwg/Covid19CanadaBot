# function to export plot as png
# https://stackoverflow.com/a/65919537
save_png <- function(plot, path) {
  DiagrammeRsvg::export_svg(plot) %>%
    charToRaw() %>%
    rsvg::rsvg() %>%
    png::writePNG(path)
}