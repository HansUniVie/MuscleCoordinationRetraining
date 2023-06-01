%% Monte Carlo simulation
%% Hans Kainz, University of Vienna, hans.kainz@univie.ac.at
%% script is based on previous work from Scott Uhlrich https://github.com/stanfordnmbl/MatlabStaticOptimization
%% Uhlrich SD, Jackson RW, Seth A, Kolesar JA, Delp SL, 2022. Muscle coordination retraining inspired by musculoskeletal simulations reduces knee contact force. Scientific Reports 12, 9842. https://doi.org/10.1038/s41598-022-13386-9
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all; 
addpath((fullfile(pwd, 'MatlabStaticOptimization\Utilities'))); % scripts from https://github.com/stanfordnmbl/MatlabStaticOptimization
baseDir = fullfile(pwd, 'inputData', 'PA02');
cd(baseDir);
% monte carlo input
nr_simulations = 10000;
% load input
load(fullfile(pwd, 'inputData', 'PA02\INPUT_PA02.mat')); % created with Script01_Montecarlo_parallel_input_example.m script
geometryPath = [baseDir '\Geometry'] ; % full path to geometry folder for Model. If pointing to Geometry folder in OpenSim install, leave this field blank: []
if ~isempty(geometryPath)
    org.opensim.modeling.ModelVisualizer.addDirToGeometrySearchPaths(geometryPath)
end

pauseAfterNsimulations = 200; % to avoid memory issues

nrOfSimulationSets = nr_simulations / pauseAfterNsimulations;
tic
for i = 1 : nrOfSimulationSets 
    offset = i * pauseAfterNsimulations - pauseAfterNsimulations;    
    pool = parpool(); % start parallel pool
    parfor N = offset + [1 : pauseAfterNsimulations]
        % Run it!
        if ~isfile(fullfile(INPUTS(N).outputFilePath, 'results_JointReaction_JointRxn_ReactionLoads.sto'))
            StaticOptimizationAPIVectorized(INPUTS(N)) ; % Run StaticOptimizationAPI
        end
    end
    delete(pool);
end
t=toc;
