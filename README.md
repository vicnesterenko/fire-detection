# Fire Detection in Drone Video

This MATLAB code analyzes a forest drone video to detect potential fire regions based on color thresholds in the YCbCr color space.

## Features

- **Video Input**: The code reads a forest drone video ('forest_droneCam.mp4' by default).
- **Color Space Conversion**: Converts each frame to the YCbCr color space.
- **Thresholding**: Applies thresholding on Cb and Cr channels to identify potential fire regions.
- **Binary Mask Creation**: Generates a binary mask highlighting detected fire regions.
- **Visualization**: Displays the processed frames with detected fire regions using `implay`.

## Usage

1. Clone the repository.
2. Ensure MATLAB is installed.
3. Open MATLAB and navigate to the code directory.
4. Run the script (`detection.m`) with your desired video file.

```matlab
detectFire('your_video.mp4');
```

## Dependencies

- MATLAB Image Processing Toolbox
