# MuscleCoordinationRetraining

This repository includes 3 scripts which were used in the following publication to 
1) create the input data for Monte Carlo simulations
2) run Monte Carlo simulations using parallel computing in Matlab
3) Summarize the muscle and joint contact forces from the simulations

Additionally the repository includes all musculoskeletal OpenSim models and experimental input data for the simulations.

# Publiation

Please cite this paper if you use this code in your work:
Hans Kainz, Willi Koller, Elias Wallnöfer, Till R Bader, Gabriel T Mindler, Andreas Kranz. A framework based on subject-specific musculoskeletal models and Monte Carlo simulations to personalize muscle coordination retraining

Monte Carlo simulations are based on the static optimization script from Scott Uhlrich https://github.com/stanfordnmbl/MatlabStaticOptimization
Publication: Uhlrich SD, Jackson RW, Seth A, Kolesar JA, Delp SL, 2022. Muscle coordination retraining inspired by musculoskeletal simulations reduces knee contact force. Scientific Reports 12, 9842. https://doi.org/10.1038/s41598-022-13386-9

# Prerequisite

Install the latest version of OpenSim (this code has been tested with OpenSim 4.2 and Matlab R2023a), and follow the instructions to set up OpenSim scripting in Matlab.
see https://simtk-confluence.stanford.edu:8443/display/OpenSim/Scripting+with+Matlab 

Clone the respository from Scott Uhlrich https://github.com/stanfordnmbl/MatlabStaticOptimization

Clone this repository https://github.com/HansUniVie/MuscleCoordinationRetraining

# Instructions

Use the 01_Montecarlo_parallel_input_example.m script to run the code to create the input data for the Monte Carlo simulations.

Use the 02_MontecarloSimulation_parallel_example.m script to run the code for the Monte Carlo simulations.

Use the 03_SummarizeResults_eample.m script to run the code to summarize the findings from a participant.
