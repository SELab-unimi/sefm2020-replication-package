# README

This is a **replication package** of the experiments presented in the research paper: "Model-based Testing under Parametric Variability of Uncertain Beliefs" by [M. Camilli](https://matteocamilli.github.io/), [B. Russo](http://www.inf.unibz.it/~russo/).

## Content

* **SafeHome** models and MBT instrumentation: `safehome_u*` folders;
* **scripts** to run the experiments: `*.sh`, `*.R` files;
* **plots** presented in the paper: `plots` folder.

## Dependencies

The software included in this repository relies on other software modules listed below:

* **JDK 8**: Java Development Kit [version 1.8](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html);
* **MBT module**: Model-based testing [software module](https://github.com/SELab-unimi/mbt-module);
* **R environment**: R language and [evecution environment](https://www.r-project.org/about.html);
    * libraries: `ggplot2`, `plyr`;

## Instructions

### Run the MBT module

To execute the **MBT module** for all the cases listed in `run_all_config`, execute the following line. Before execution you need to setup the `mbt_module_dir` in the configuration section of the script.

```
./run_all.sh <output_folder>
```

To execute the experiments (listed in `run_all_config`) multiple times, execute:

```
./multiple_runs.sh <from> <to>
```

where `<from>` and `<to>` are two numeric values. For instance, `./multiple_runs.sh 1 100` executes `100` experiments and generates the outcome inside the directories: `zlogs1`, ..., `zlogs100`.


### Extract the effort report

To generate the **effort report** from all experiments, execute the following script:

```
./build_reports.sh <log_prefix>
```

where `<log_prefix>` is the common prefix of all the directories containing the outcome of the MBT. For instance, `./build_reports.sh zlogs` generates the reports for all the experiments executed as described above.

The **effort report** contains data on the effort required to achieve termination depending on `distance` values (`report<dist>` files) and `uncertainty` values (`report<uncertainty>` files).

### Plot the effort values

To build the **box plots** of the effort execute the following `R` script:

```
Rscript plot_tests-by-distance.R
```

### Extract the effect size

To generate a report containing the `A12 effect-size` and the `p-value` using the wilcox test, execute the following `R` script:

```
Rscript effect-size.R
```

### Plot the effect effect size

To build a **heat map** of the effect size execute the following `R` script:

```
Rscript plot_effect-size.R
```

### Extract the error rate

To compute the `#errors` (i.e., false successful runs), for each combination of `uncertainty` and `distance` values, execute the following line:

```
./errors.sh <log_prefix>
```

### Plot the error rate

To build a **heat map** of the error rate execute the following `R` script:

```
Rscript plot_error-rate.R
```
