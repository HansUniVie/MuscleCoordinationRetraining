 clear all; close all; format compact; clc; fclose all;
baseDir = 'C:\Users\Hans\Documents\GitHub\MuscleCoordinationRetraining\inputData\PA02\MonteCarlo\' ; % Base Directory to base results directory.
BW = 39.3*9.81; % body weight
% monte carlo input
nr_simulations = 10000;

% get muscle forces
for N = 1 : 10000
    PA02.MF.(['S_' (char(num2str(N)))]) = load_sto_file([baseDir 'S_' (char(num2str(N))) 'results_forces.sto']);  
disp((N))
end

% % get JCF
for N = 1 : 10000
    PA02.JCF.(['S_' (char(num2str(N)))]) = load_sto_file([baseDir '\S_' (char(num2str(N))) '\results_JointReaction_JointRxn_ReactionLoads.sto']);
    disp((N))
end
JCF_set = {'hip_r_on_femur_r_in_femur_r_fx' 'hip_r_on_femur_r_in_femur_r_fy' 'hip_r_on_femur_r_in_femur_r_fz' 'walker_knee_r_on_tibia_r_in_tibia_r_fx' 'walker_knee_r_on_tibia_r_in_tibia_r_fy' 'walker_knee_r_on_tibia_r_in_tibia_r_fz' 'patellofemoral_r_on_patella_r_in_patella_r_fx' 'patellofemoral_r_on_patella_r_in_patella_r_fy' 'patellofemoral_r_on_patella_r_in_patella_r_fz' 'ankle_r_on_talus_r_in_talus_r_fx' 'ankle_r_on_talus_r_in_talus_r_fy' 'ankle_r_on_talus_r_in_talus_r_fz'};
JCFsum = {'hip' 'knee' 'patella' 'ankle'};
for N = 1 : 10000
    for j = 1:length(JCFsum)
        if j == 1
            i = 1;
        else
        end
        if j == 2
            i = 4;
        else
        end
        if j == 3
            i = 7;
        else
        end
        if j == 4
            i = 10;
        else
        end
        ii=i+1;
        iii=ii+1;
        jcf_x = PA02.JCF.(['S_' (char(num2str(N)))]).(JCF_set{i});
        jcf_y = PA02.JCF.(['S_' (char(num2str(N)))]).(JCF_set{ii});
        jcf_z = PA02.JCF.(['S_' (char(num2str(N)))]).(JCF_set{iii});
        PA02.JCF.(['S_' (char(num2str(N)))]).(JCFsum{j}) = sqrt( jcf_x.^2 + jcf_y.^2 + jcf_z.^2 );
        PA02.max.JCF.(['S_' (char(num2str(N)))]).(JCFsum{j}) = (max(PA02.JCF.(['S_' (char(num2str(N)))]).(JCFsum{j})))/BW;
        PA02.max.JCF.all.(JCFsum{j})(N,:) = PA02.max.JCF.(['S_' (char(num2str(N)))]).(JCFsum{j});
        clear i; clear ii; clear iii;
    end
end

% histogram plot
figure
for j = 1:length(JCFsum)
    subplot(2,2,j)
    histogram(PA02.max.JCF.all.(JCFsum{j}), 'Orientation', 'horizontal')
    title(char(JCFsum{j}))
end