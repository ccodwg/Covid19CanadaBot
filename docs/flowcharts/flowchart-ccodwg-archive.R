# load packages
library(DiagrammeR)
library(DiagrammeRsvg)
library(rsvg)
library(png)

# load functions
source("flowchart-funs.R")

# define flowchart
flowchart_ccodwg_archive <- grViz('digraph flowchart {
      graph [layout = dot, fontsize = 20, label = "\nBlue boxes indicate an automated step. Red boxes indicate a manual step."]
      
      # node definitions and labels
      node [fontname = Helvetica, shape = rectangle, penwidth = 4]
      datasets_no_js [color = grey, label = "Datasets not requiring JS\n(e.g., CSV, JSON, simple HTML)"]
      datasets_js [color = grey, label = "Datasets requiring JS\n(complex HTML)"]
      archivist [color = grey, label = <<i>archivist</i>>]
      archivist_test [color = blue, label = <Periodic automated testing<br/>of dataset downloads<br/><i>(python -m archivist test)</i>>]
      archivist_prod [color = blue, label = <Nightly archive update<br/><i>(python -m archivist prod)</i>>]
      test_report [color = blue, label = "Email report of datasets that\ncould not be downloaded (if any)"]
      prod_report [color = blue, label = "Email report on datasets that\ncould not be archived (if any)"]
      manual_update_datasets [color = red, label = <Manually update list of<br/>datasets, if necessary<br/><i>(datasets.json)</i>>]
      manual_rerun [color = red, label = <Manually archive failed<br/>datasets, if necessary<br/><i>(python -m archivist prod --uuid)</i>>]
      upload_s3 [color = blue, label = <Upload datasets<br/>to public S3 bucket<br/><i>(data.opencovid.ca)</i>>]
      regen_index [color = blue, label = <Regenerate index of available files<br/><i>python -m archivist index</i>>]
      
      # edge definitions with the node IDs
      datasets_no_js:s -> archivist [label = <download w/ <i>requests</i>>]
      datasets_js:s -> archivist [label = <download w/ <i>selenium</i>>]
      archivist -> archivist_test -> test_report -> manual_update_datasets
      archivist -> archivist_prod -> prod_report -> manual_rerun
      archivist_prod -> upload_s3 -> regen_index
      
      }')

# preview flowchart
flowchart_ccodwg_archive

# export flowchart
save_png(flowchart_ccodwg_archive, "flowchart_ccodwg_archive.png")
