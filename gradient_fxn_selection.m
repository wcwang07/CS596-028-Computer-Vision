% Gradient Direction
pkg load image;

% compute pixels for the selected range
function result = select_gdir(gmag, gdir, mag_min, angle_low, angle_high)
  result = gmag>=mag_min & angle_low <=gdir & gdir <=angle_high;
endfunction

% Load and convert image to double type, range[0 1] for convenience
img = double(imread('octagon.png'))/255.;
imshow(img); % assumes [0, 1] range for double imagesc

%Compute x, y gradients
[gx gy] = imgradientxy(img, 'sobel');

%Obtain gradient magnitude and direction
[gmag gdir] = imgradient(gx, gy);
imshow((gdir+180.0)/360.0); %angle in degrees [-180 180]

%Find pixels with desired gradient direction
imshow(select_gdir(gmag, gdir, 1, 30,60));


