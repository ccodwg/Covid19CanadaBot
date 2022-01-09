# load packages
library(DiagrammeR)
library(DiagrammeRsvg)
library(rsvg)
library(png)

# load functions
source("flowchart-funs.R")

# define flowchart
flowchart_ccodwg_update <- grViz('digraph flowchart {
      graph [layout = dot, fontsize = 20, label = "\nBlue boxes indicate an automated step. Red boxes indicate a manual step."]
      
      # node definitions and labels
      node [fontname = Helvetica, shape = rectangle, penwidth = 4]
      data_computer [color = grey, label = "Machine-readable data"]
      data_manual [color = grey, label = "Non-machine-readable data"]
      etl [color = blue, label = <Automated data downloading and <br/>processing via <i>Covid19CanadaETL</i>>]
      manual_entry [color = red, label = "Manual data entry"]
      google_sheets [color = grey, label = "Data spreadsheets\n(Google Sheets)"]
      verify_manual_data [color = blue, label = <Verify manual data have been entered<br/><i>(verify_manual_data.R)</i>>]
      verify_data_sources [color = blue, label = <Periodic automated verification<br/>for missing/erroneous data<br/><i>(verify_data_sources.R)</i>>]
      manual_correction [color = red, label = "Review automated notifications and\nmanually correct data (if necessary)"]
      prepare_update [color = blue, label = <Prepare data update<br/><i>(update_data.R)</i>>]
      update_summary [color = blue, label = <Automated summary of update<br/><i>(update_data_validation_funs.R)</i>>]
      prepare_update_official [color = blue, label = <Add official datasets to data update<br/><i>(update_official_data.R)</i>>]
      update_github [color = blue, label = "Push data update to GitHub (22:00 ET)"]
      update_gdrive [color = blue, label = "Sync updated data files to Google Drive"]
      
      # edge definitions with the node IDs
      data_computer -> etl -> google_sheets
      data_manual -> manual_entry -> google_sheets
      manual_entry -> verify_manual_data
      google_sheets -> verify_data_sources -> manual_correction
      google_sheets -> prepare_update -> update_summary -> manual_correction
      prepare_update_official -> prepare_update -> update_github -> update_gdrive
      
      }')

# preview flowchart
flowchart_ccodwg_update

# export flowchart
save_png(flowchart_ccodwg_update, "flowchart_ccodwg_update.png")
