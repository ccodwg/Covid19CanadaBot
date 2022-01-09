# Covid19CanadaBot

Hi, my name is CCODWG-bot! 🤖

I am made up of a set of GitHub Actions workflows meant to assist with the maintenance of the datasets put out by the [COVID-19 Canada Open Data Working Group](https://opencovid.ca/).

My two most important tasks are:

* 📈 Running the nightly update for [`Covid19Canada`](https://github.com/ccodwg/Covid19Canada) (Epidemiological Data from the COVID-19 Outbreak in Canada)
* 🗃️ Running the nightly update for [`Covid19CanadaArchive`](https://github.com/ccodwg/Covid19CanadaArchive) (Canadian COVID-19 Data Archive)

To update the main dataset (`Covid19Canada`), I rely on the [`Covid19CanadaETL`](https://github.com/ccodwg/Covid19CanadaETL) R package, which uses the R packages [`Covid19CanadaData`](https://github.com/ccodwg/Covid19CanadaData) and [`Covid19CanadaDataProcess`](https://github.com/ccodwg/Covid19CanadaDataProcess) to pull from and harmonize Canadian COVID-19 data from dozens of sources!

To update the archive (`Covid19CanadaArchive`), I use the Python package [`archivist`](https://github.com/jeanpaulrsoucy/archivist). This allows me to save snapshots of hundreds of datasets, websites and reports to a [public repository](https://github.com/ccodwg/Covid19CanadaArchive#accessing-the-data) every night!

These efforts are part of the **[What Happened? COVID-19 in Canada](https://whathappened.coronavirus.icu/)** project.

## Flowcharts

### Flowchart for `Covid19Canada`

<img src="https://raw.githubusercontent.com/ccodwg/Covid19CanadaBot/main/docs/flowcharts/flowchart_ccodwg_update.png" alt="Flowchart illustrating the update process for Covid19Canada" width="60%" height="60%">

### Flowchart for `Covid19CanadaArchive`

<img src="https://raw.githubusercontent.com/ccodwg/Covid19CanadaBot/main/docs/flowcharts/flowchart_ccodwg_archive.png" alt="Flowchart illustrating the update process for Covid19CanadaArchive" width="60%" height="60%">
