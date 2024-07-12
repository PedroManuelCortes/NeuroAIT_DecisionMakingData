# NeuroAIT_DecisionMakingData
This repository contains the dataset and analysis code for the study "The Impact of Artificial Intelligent Tools on Decision Making Behavioral and Neural Dynamics" The data includes behavioral and EEG measurements collected from participants under various decision-making conditions with and without the use of Artificial Intelligent Tools (AIT).


## Repository Structure

- `data/`: Contains data files.
  - `behavioral/`: Behavioral data files.
  - `EEG/`: EEG data files.
- `analysis/`: Contains analysis scripts.
  - `R/`: Scripts written in R.
  - `matlab/`: Matlab use instructions.


## Participant and Experimental Condition Codes

### Participant Identification

- Each participant is identified by a unique code that starts with the experiment identifier followed by a participant number.
- The format is `IGXX` where:
  - `IG` indicates the experiment.
  - `XX` is a two-digit number identifying the participant.

  **Example:** `IG07` refers to participant number 07 in the experiment.

### Experimental Conditions

The experiment includes two factors: the use of artificial intelligence (AI) and task complexity. Each condition is identified by a specific code.

#### Factor 1: Use of AI
- **With AI:** Identified by the code `WAIT`.
- **Without AI:** Identified by the code `NAIT`.

#### Factor 2: Task Complexity
- **Low Complexity:** Identified by the code `LOWU`.
- **High Complexity:** Identified by the code `HIGU`.

### Example of Data File Naming

A data file might be named as follows:
- `IG07_WAIT_LOWU.csv`: This file pertains to participant 07 in the condition with AI (`WAIT`) and low complexity (`LOWU`).
- `IG08_NAIT_HIGU.set`: This file pertains to participant 08 in the condition without AI (`NAIT`) and high complexity (`HIGU`).

## System Requirements

### Software Dependencies and Operating Systems

- **Operating Systems:**
  - Windows 10 or higher

- **Software Dependencies:**
  - **R:** Version 4.0.0 or higher
  - **Python:** Version 3.7 or higher
  - **Matlab:** Version R2019b or higher
  - **EEGLAB:** Version 2021.0 or higher

### Tested Software Versions

- **EEGLAB:** v2023.0
- **MATLAB:** R2023b
- **Python:** v3.11
- **R:** v4.2.3

### Required Non-Standard Hardware

- **High-Performance Computer:** Recommended for processing large EEG datasets.

## Installation

### Prerequisites

1. **R:** Install from [CRAN](https://cran.r-project.org/).
2. **Python:** Install from [Python.org](https://www.python.org/).
3. **Matlab:** Ensure you have Matlab installed.
4. **EEGLAB:** Download and install EEGLAB from [sccn.ucsd.edu](https://sccn.ucsd.edu/eeglab/index.php).

### Steps

1. Clone the repository:
   ```sh
   git clone https://github.com/PedroManuelCortes/NeuroAIT_DecisionMakingData.git
   cd NeuroAIT_DecisionMakingData
2. Install required R packages (if any):
   ```R
   install.packages(c("required_package_1", "required_package_2"))
3. Install required Python packages (if any):
   ```sh
   pip install -r requirements.txt

## Demo

### Behavioral Figures

1. Go to: `NeuroAIT_DecisionMakingData\analysis\R`
2. Open the script: `data_behavior_analysis.R`
3. Change the file direction to the file corresponding to behavioral data. By default, it is `D:\GitHub\NeuroAIT_DecisionMakingData\data\behavior\data_behavior.csv`
4. This results in figures 1 to 4

### EEG Figures

1. Open Matlab
2. Open the EEGLAB extension
3. In EEGLAB go to: `File > Load existing study`
4. Select the file: `NeuroAIT_DecisionMakingData\data\EEG\EEG_study_01\IGT_AI.study`
5. After all the files have been correctly uploaded, go to: `Study > Precompute channel measures`
6. Select all channels, and in parameters select the frequency range of the desired figure and multiple channel selection/ plot averaged topography
7. To obtain the figure select the plot spectra bottom under channel selection section:
   - For figure 5A plot between 1 and 50Hz
   - For figure 5B plot between 4 and 8Hz
   - For figure 5C plot between 8 and 13Hz
   - For figure 5D plot between 13 and 30Hz
   - For figure 5E plot between 30 and 50Hz

## Instructions for Use

### How to Run the Software on Your Data

1. **Clone the repository** as shown in the Installation section.
2. **Prepare your data** according to the structure specified in the `data/` directory.
3. **Modify the scripts** to point to the location of your data files.

### Reproduction Instructions

#### Behavioral Analysis

1. Go to: `NeuroAIT_DecisionMakingData\analysis\R`
2. Open the script: `data_behavior_analysis.R`
3. Change the file direction to the file corresponding to your behavioral data.
4. Run the script to generate figures 1 to 4.

#### EEG Analysis

1. Open Matlab
2. Open the EEGLAB extension
3. Load your EEG study as detailed in the Demo section.
4. Follow the steps to precompute channel measures and generate the desired figures.

## Expected Outcome

By following the instructions provided, you should be able to reproduce the behavioral and EEG figures as described. 

## Expected Output

The expected output includes:
- Behavioral analysis figures 1 to 4
- EEG analysis figures 5A to 5E

## Contact

For more information or questions, contact [pedro.cortes@tec.mx](mailto:pedro.cortes@tec.mx).


