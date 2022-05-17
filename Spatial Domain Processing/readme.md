# Point operation for Angiogram X ray

### Negative of the image

  - A complement approach with respect to input image in the limited intensity level.
 
  - The horizontal and vertical length are considered to be 256 intensity levels since the images are assumed to be 8 bits grayscale.

  - Image enhancement analysis of bright regions embedded in dark regions.

<p align="center">
 <img src=https://github.com/Thomas-JHR/Biomedical-Image-and-Signal-Processing/blob/main/image/Image%20negative.JPG width=65% height=65%>
</p>


### Power law transformation

  - produce a reconstructed image than darker than intended, followed by 
  
<p align="center">
 <img src=https://github.com/Thomas-JHR/Biomedical-Image-and-Signal-Processing/blob/main/image/formula1.JPG width=65% height=65%>
</p>

where ```c``` is the coefficient of the input intensity and ```gamma``` is the power coefficient.

  - By changing gamma value and applying this transformation function, a rechanged image can be created.

<p align="center">
 <img src=https://github.com/Thomas-JHR/Biomedical-Image-and-Signal-Processing/blob/main/image/Power%20transform.JPG width=65% height=65%>
</p>

### Contrast stretching

  - Piece-wise linear function that increases the dynamic range of the gray levels.
  
  - Before reconstructing the image, two locations points within horizontal and vertical limited domains are necessary to control the shape of the function.

  - The function should satisfy a linearly increasing relationship between the input and output image. 

<p align="center">
 <img src=https://github.com/Thomas-JHR/Biomedical-Image-and-Signal-Processing/blob/main/image/Contrast%20streching.JPG width=65% height=65%>
</p>
  
### Gray-level slicing

  - Slicing transformation to observe specific details clearly. The intensity values of the specific input intensity are highlighted. 

<p align="center">
 <img src=https://github.com/Thomas-JHR/Biomedical-Image-and-Signal-Processing/blob/main/image/Gray-level%20slicing.JPG width=65% height=65%>
</p>

# Histogram processing for chest X ray image

### Histogram equalization

  - Require cumulative distribution function to make a new reconstructed image equalized

<p align="center">
 <img src=https://github.com/Thomas-JHR/Biomedical-Image-and-Signal-Processing/blob/main/image/Equalization.JPG width=65% height=65%>
</p>

### Histogram specification

  - Initially requires the user to find cumulative distribution function based on an input image with probability density and desired intensity distribution.

  - Followed by mapping each pixel in equalized image to each pixel in a new image. 

<p align="center">
 <img src=https://github.com/Thomas-JHR/Biomedical-Image-and-Signal-Processing/blob/main/image/output%20image.JPG width=65% height=65%>
</p>





















