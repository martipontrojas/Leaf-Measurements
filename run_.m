function mark = run_Andi(currentimage)
    rotate = imrotate(currentimage,90);
    mark = rotate;
%     figure(),imshow(rotate);
    %get green component
    green = rotate(:,:,3);
    %figure(),imshow(green,[]);
    %get threshold and binarize
    t = graythresh(green);
    binary = imbinarize(green,t);
    
    figure(),imshow(binary,[]);
    
    %close image
    SE = strel('disk',12);
    closed = imclose(binary,SE);
    figure(),imshow(closed,[]);
    complement = imcomplement(closed);
    %mark areas round regions
    props = regionprops(complement, 'Area', 'centroid','MajorAxisLength', 'MinorAxisLength');
    allAreas = [props.Area];
    allCentroids =[props.Centroid];
    allMajor = [props.MajorAxisLength];
    allMinor= [props.MinorAxisLength];
    l = length (allAreas);
    for j= 1:l
        a = int2str(allAreas(j));
        ma = int2str(allMajor(j));
        mi = int2str(allMinor(j));
        posx = allCentroids(2*j-1);
        posy = allCentroids(2*j);
        mark  = insertText(mark,[posx,posy],a,FontSize=30);
        mark  = insertText(mark,[posx,posy+40],ma,FontSize=30);
        mark  = insertText(mark,[posx,posy+80],mi,FontSize=30);
    end
end