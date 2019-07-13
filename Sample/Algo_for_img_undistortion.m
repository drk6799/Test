srcDir = 'D:\Dataset\St';
srcStruc = dir(fullfile(srcDir, '*.jpg'));
srcFiles = sort({srcStruc.name});
for k = 1:numel(srcFiles)
    filename = fullfile(srcDir,srcFiles{k});
    I = imread(filename);
    [mrows, ncols, ~] = size(I);
    J1 = undistortFisheyeImage(I,params.Intrinsics);
    fullFileName = fullfile(srcStruc(k).folder, srcStruc(k).name);
    imwrite(J1,fullFileName);
    
end
    
    
    %figure
    %imshow(J1)
    %title('Original Image (left) vs. Corrected Image (right)')
    %imshow(I)
%end




