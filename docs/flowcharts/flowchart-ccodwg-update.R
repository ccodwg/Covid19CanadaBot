# load packages
library(DiagrammeR)
library(DiagrammeRsvg)
library(rsvg)
library(png)

# load functions
source("flowchart-funs.R")

# define flowchart
flowchart_ccodwg_update <- grViz('digraph flowchart {
      graph [layout = dot, fontsize = 20, label = <<br/>Blue boxes indicate an automated step. Red boxes indicate a manual step.<br/>All functions refer to the package <i>Covid19CanadaETL</i>.>]
      
      # node definitions and labels
      node [fontname = Helvetica, shape = rectangle, penwidth = 4]
      data_active_ts [color = grey, label = "Active time series data"]
      data_active_cumul [color = grey, label = "Active cumulative data"]
      data_reports [color = grey, label = "Reports data"]
      data_covid19tracker [color = grey, label = "covid19tracker.ca data"]
      data_static [color = grey, label = "Static datasets"]
      update_active_ts [color = blue, label = <Download and process<br/>(<i>update_active_ts</i>)>]
      update_active_cumul [color = blue, label = <Upload to Google Sheets<br/>(<i>update_active_cumul</i>)>]
      update_reports [color = red, label = <Manual entry into<br/>Google Sheets>]
      update_covid19tracker [color = blue, label = <Download and process<br/>(<i>update_covid19tracker</i>)>]
      update_raw_datasets [color = blue, label = <Update raw datasets<br/>(<i>update_raw_datasets</i>)>]
      assemble_final_datasets [color = blue, label = <Assemble final datasets<br/>(<i>assemble_final_datasets</i>)>]
      diff_datasets [color = blue, label = <Calculate dataset diffs<br/>(<i>diff_datasets</i>)>]
      push_data [color = blue, label = "Push dataset to GitHub"]
      email_log [color = blue, label = "Email log of errors (if any)"]
      review_log [color = red, label = "Review error log and correct issues"]
      
      # edge definitions with the node IDs
      data_active_ts -> update_active_ts -> update_raw_datasets
      data_active_cumul -> update_active_cumul -> update_raw_datasets
      data_reports -> update_reports -> update_raw_datasets
      data_covid19tracker -> update_covid19tracker -> update_raw_datasets
      update_raw_datasets -> assemble_final_datasets
      data_static -> assemble_final_datasets
      assemble_final_datasets -> diff_datasets
      diff_datasets -> push_data
      diff_datasets -> email_log -> review_log
      
      }')

# preview flowchart
flowchart_ccodwg_update

# export flowchart
save_png(flowchart_ccodwg_update, "flowchart_ccodwg_update.png")
