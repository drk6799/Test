%% Correct Fisheye Image for Lens Distortion
% Remove lens distortion from a fisheye image by detecting a 
% checkboard calibration pattern and calibrating the camera. Then, display the results.

%%
% Gather a set of checkerboard calibration images.
%images = imageDatastore(fullfile(toolboxdir('vision'),'visiondata', ...
    %'calibration','gopro'));
%%
% Detect the calibration pattern from the images.
%[imagePoints,boardSize] = detectCheckerboardPoints(images.Files);

%%
% Generate world coordinates for the corners of the checkerboard squares.
%squareSize = 25; % millimeters
%worldPoints = generateCheckerboardPoints(boardSize,squareSize);

%%
% Estimate the fisheye camera calibration parameters based on the image and
% world points. Use the first image to get the image size.
imageFileNames = {'D:\Sample\20190705_093000.jpg'
    };
% Detect checkerboards in images
%[imagePoints, boardSize, imagesUsed] = detectCheckerboardPoints(imageFileNames);
%imageFileNames = imageFileNames(imagesUsed);

% Read the first image to obtain image size
I = imread(imageFileNames{1});
[mrows, ncols, ~] = size(I);
%%
% Remove lens distortion from the first image |I| and display the results.
J1 = undistortFisheyeImage(I,params.Intrinsics);
%figure
%imshowpair(I,J1,'montage')
%title('Original Image (left) vs. Corrected Image (right)')

J2 = undistortFisheyeImage(I,params.Intrinsics,'OutputView','full');
figure
imshow(J2)
title('Full Output View')

%% 
% Copyright 2012 The MathWorks, Inc.