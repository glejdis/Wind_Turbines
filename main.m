clear all;
clc;
addpath('functions')
%%%%%%%%%%%%%%%
%1. read in Data
readInData();
%%%%%%%%%%%%%%%%%%%%%%%
%2. Do FFT and plot it
%choose loading between 1 - 10;
loading = 8;
figFFT = sensorsFFT(loading);
%--> not interesting bins in Sensor 1 and 2
%%%%%%%%%%%%%%%%%%%%%%%%%
%3. Spectrogram
loading = 5;
sensor = 2;
figSpectrogram = sensorSpectrogram(loading,sensor);
%--> impression of stationary data --> stay with FFT only (no wavelets)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4. Feature extraction (for entire time domain)
freqBins = 1;
fftFeatures();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%5. Visualize supposedly strongest features
visualizeData();
% --> Optimistic to classisfy the time series successfully with those two
% features
%Features also match with fft

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%6. Train and visualize SVM for 2 features
%load('MatrixData/brokenToothData.mat', 'brokenToothData');
%load('MatrixData/healthyData.mat', 'healthyData');
%bins: into how many regions to split the data in time domain
bins = 40;
SVM_2feat_visualization(bins);
kMeans_2feat_visualization(bins);
SVM_2feat_visualization(bins);
RF_2feat_visualization(bins);

%&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%7. Evaluate SVM for two features
SVM_2feat_Evaluation();
%kMeans_2feat_Evaluation();
RF_2feat_Evaluation();
%Overall good results with some weaknesses for specific bins

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%8. Do PCA to look for 2 more features to enhance accuracy over different
%bins
PCA();
%-> Kurtosis of Sensor 1 bin 1 and 2 are interesting
%%%%%%%%%%%%%%%%%%
%9. Fit SVM with 4 feature: again with the two means and the features
%repsonsible for greates variance in training data from PCA
% and do same evaluation measures as for 2 feature SVM
SVM_4feat_Evalutation();

RF_4feat_Evaluation();
kMeans_4feat_Evaluation();
%observe improved classification

%%%%%%%%%%%%%%%%%%%%%
%10. Trying to see if we can find the easiest possible criterion: 1 feature
%thresholding
thresholdingAnalysis();
%--> We are optimistic to find a good thresolding in the x-Axis (Mean
%Sensor1,bi2) for 60s time frame

%%%%%%
%11. Do the thresholding: visually identify a threshold on a training set
%and apply it on a test set:
thresholdingEvaluation();

