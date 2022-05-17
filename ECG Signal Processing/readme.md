*Note: Two ECG data from older and younger adults is considered as main dataset to to discover [heart rate variability analysis](https://link.springer.com/article/10.1007/s11517-006-0119-0)*

### Pre-processing step

  - offsets removal by detrending, followed by designed low-pass, and high-pass filter 
  
    - Detrending: remove the trends that affect the data analysis
    
    - Low-pass filter: smooth the detrend signals
    
    - High-pass filter: wander line removal and noise removal  
   
### Heart rate intervals 

  - Amplitude spectrum 
  
  - QRS complex
  
  - Tachogram or NN intervals: duration between two successive R waves of the QRS signal on the ECG
  
  - Statistical information of the NN intervals including mean, min-max range, and standard deviation with respect to different segments

### Frequency domain analysis

  - Power spectrum density by Fast Fourier Transform and power computation in Low-Freq and High-Freq region

### Extra work

  - Pointcare plots and standard descriptors calculation
