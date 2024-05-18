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
- The format is `IGXX`, where:
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
- `IG07_WAIT_LOWU.csv`: This file pertains to participant 07, in the condition with AI (`WAIT`) and low complexity (`LOWU`).
- `IG08_NAIT_HIGU.set`: This file pertains to participant 08, in the condition without AI (`NAIT`) and high complexity (`HIGU`).

## Installation

### Prerequisites

1. **R:** Install from [CRAN](https://cran.r-project.org/).
2. **Matlab:** Ensure you have Matlab installed.
3. **EEGLAB:** Download and install EEGLAB from [sccn.ucsd.edu](https://sccn.ucsd.edu/eeglab/index.php).

### Steps

1. Clone the repository:
   ```sh
   git clone https://github.com/example_user/NeuroAIT_DecisionMakingData.git
   cd NeuroAIT_DecisionMakingData


