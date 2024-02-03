# Covid19CanadaBot

Hi, my name is CCODWG-bot! 🤖

I am made up of a set of GitHub Actions workflows meant to assist with the maintenance of the datasets put out by the [COVID-19 Canada Open Data Working Group](https://opencovid.ca/).

**I am retired as of February 2024, but you can read about my previous duties below.**

My two most important tasks are:

* 📈 Running the daily updates for [`CovidTimelineCanada`](https://github.com/ccodwg/CovidTimelineCanada) **(Timeline of COVID-19 in Canada)**
* 🗃️ Running the nightly update for [`Covid19CanadaArchive`](https://github.com/ccodwg/Covid19CanadaArchive) **(Canadian COVID-19 Data Archive)**

To update the **Timeline of COVID-19 in Canada**, I rely on the R packages [`Covid19CanadaETL`](https://github.com/ccodwg/Covid19CanadaETL), [`Covid19CanadaData`](https://github.com/ccodwg/Covid19CanadaData) and [`Covid19CanadaDataProcess`](https://github.com/ccodwg/Covid19CanadaDataProcess) to pull from and harmonize Canadian COVID-19 data from dozens of sources!

To update the **Canadian COVID-19 Data Archive**, I use the Python package [`archivist`](https://github.com/jeanpaulrsoucy/archivist). This allows me to save snapshots of hundreds of datasets, websites and reports to a [public repository](https://github.com/ccodwg/Covid19CanadaArchive#accessing-the-data) every night!

These efforts are part of the **[What Happened? COVID-19 in Canada](https://whathappened.coronavirus.icu/)** project.

## Flowcharts

### Flowchart for `CovidTimelineCanada`

<img src="https://raw.githubusercontent.com/ccodwg/Covid19CanadaBot/main/docs/flowcharts/flowchart_ccodwg_update.png" alt="Flowchart illustrating the update process for CovidTimelineCanada" width="60%" height="60%">

### Flowchart for `Covid19CanadaArchive`

<img src="https://raw.githubusercontent.com/ccodwg/Covid19CanadaBot/main/docs/flowcharts/flowchart_ccodwg_archive.png" alt="Flowchart illustrating the update process for Covid19CanadaArchive" width="60%" height="60%">
