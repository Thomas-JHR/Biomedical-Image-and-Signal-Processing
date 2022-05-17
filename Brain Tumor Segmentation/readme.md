### Image binary conversion

  - Binary implementation in each image pixel helps to simplify the area separated into the black area and the white area. 
  
  - The black area means intact regions of the brain, while the white area refers to the diseased region in the brain.

<p align="center">
<img src=https://github.com/Thomas-JHR/Biomedical-Image-and-Signal-Processing/blob/main/image/Output%201%20Image%20conversion%20to%20binary.jpg width=80% height=80%>
</p><p align="center">  

### Tumor localization using thresholding

  - Set a threshold value to the processed image to compare with the ground truth.
  
  - Realize the minimization of the intraclass class of the threshold black and white pixels.
  
  <p align="center">
<img src=https://github.com/Thomas-JHR/Biomedical-Image-and-Signal-Processing/blob/main/image/localization%20using%20thresholding.jpg width=80% height=80%>
</p><p align="center">  
 
### Tumor localization using segmentation

  - Two edge detectors: Marr-Hilldreth vs Canny
 
  - Marr–Hildreth algorithm by convolving the digital input image with the Laplacian of the Gaussian function, followed by zero-crossing.
  
  - Canny algorithm by gaussian filter for smoothing, intensity gradient comuputation, non-maximum suppression, double thresholding, and Hysteresis.
  
<p align="center">
<img src=https://github.com/Thomas-JHR/Biomedical-Image-and-Signal-Processing/blob/main/image/localization%20using%20edge%20detection.jpg width=80% height=80%>
</p><p align="center">  

### Tumor localization using clustering

  - K-mean clustering 
  
<p align="center">
<img src=https://github.com/Thomas-JHR/Biomedical-Image-and-Signal-Processing/blob/main/image/localization%20using%20kmean%20clustering.jpg width=80% height=80%>
</p><p align="center">  
