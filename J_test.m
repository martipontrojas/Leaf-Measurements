% Set the root directory
close all
rootdir = 'C:\Users\usuario\OneDrive - Universiteit Utrecht\Personal\marti\Forgotten 10';


list = dir(fullfile(rootdir,'*.jpg'));
for i = 1:length(list)
    baseFileName = list(i).name;
    fullFileName = fullfile(rootdir, baseFileName);
    display(fullFileName)
end

out_path = rootdir+"_p";
%%
% Search for image files in each subdirectory
for i = 1:length(list)
    baseFileName = list(i).name;
    fullFileName = fullfile(rootdir, baseFileName);
    fullOutName = fullfile(out_path,baseFileName);
    try
        display(fullFileName)
        img = imread(fullFileName);
        out = run_Andi(img);
  
        % Do some processing with the image here
        
        % Display the image
        figure;
        imshow(out);
        
        imwrite(out,fullOutName);
    
    catch
        disp("Failed to read in image")
    end
end
