clear;
close all;
clc;

fireVideo = VideoReader('forest_droneCam.mp4');
numFrames = get(fireVideo, 'NumFrames');
firstFrame = read(fireVideo, 1);

fireFrames = zeros([size(firstFrame, 1), size(firstFrame, 2), 3, numFrames], class(firstFrame));

for frameIdx = 1:numFrames
    currentFrame = read(fireVideo, frameIdx);

    % Convert the current frame to YCbCr color space
    ycbcrFrame = rgb2ycbcr(currentFrame);
    
    % Extract Y, Cb, and Cr channels
    yChannel = ycbcrFrame(:, :, 1);
    cbChannel = ycbcrFrame(:, :, 2);
    crChannel = ycbcrFrame(:, :, 3);

    % Thresholding based on Cb and Cr values
    fireMask = (cbChannel > 50) & (crChannel > 150);

    % Create a binary mask for the fire regions
    binaryFireMask = zeros(size(currentFrame, 1), size(currentFrame, 2), 3);
    binaryFireMask(repmat(fireMask, [1, 1, 3])) = 255;

    % Apply the binary mask to the original frame
    fireFrames(:, :, :, frameIdx) = binaryFireMask;
end
    frameRate = get(fireVideo, 'FrameRate');
    implay(fireFrames, frameRate);
