% Step 1: Loading the video
videoFile = '.\videos\Adel Imam .mp4';
videoReader = VideoReader(videoFile);
frameRate = videoReader.FrameRate;
frameWidth = videoReader.Width;
frameHeight = videoReader.Height;

% Step 2: Face detection
faceDetector = vision.CascadeObjectDetector('FrontalFaceCART');

while hasFrame(videoReader)
    frame = readFrame(videoReader);
    grayFrame = rgb2gray(frame);
    
    % Perform face detection
    bboxes = step(faceDetector, grayFrame);
    
    % Draw rectangles around detected faces
    detectedFrame = insertShape(frame, 'Rectangle', bboxes, 'LineWidth', 3);
    
    % Display the frame with detected faces
    imshow(detectedFrame);
    
    % Pause for a short duration to display the frame
    pause(1 / frameRate);
end

% Step 4: Cleanup
release(videoReader);
close all;