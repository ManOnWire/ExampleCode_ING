##The dataset contains the following variables:

- subject

Subject is an integer variable. It contains the subject ID's (from 1 through 30).

- activity

Activity is character variable. It contains information about the sort of activity the measurements are for (laying, sitting, standing, walking, etc.). There are six different activities.

All the other variables are numeric. So that goes for tBodyAcc-mean()-X through to angle(Z,gravityMean). The values represent the average for each activity for each subject. The averages are actually means of means or the means of standard deviations for a particular measurement.

The base measurements were obtained as follows:

The data was collected come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

From this means and standard deviations were calculated. Those have been filtered out and are contained in the current dataset. As was mentioned above, these means / standard deviations were further averaged per subject and per activity.

- tBodyAcc-mean()-X 
- tBodyAcc-mean()-Y                   
- tBodyAcc-mean()-Z         
- tBodyAcc-std()-X                    
- tBodyAcc-std()-Y          
- tBodyAcc-std()-Z                    
- tGravityAcc-mean()-X     
- tGravityAcc-mean()-Y                
- tGravityAcc-mean()-Z     
- tGravityAcc-std()-X                 
- tGravityAcc-std()-Y      
- tGravityAcc-std()-Z                 
- tBodyAccJerk-mean()-X    
- tBodyAccJerk-mean()-Y               
- tBodyAccJerk-mean()-Z   
- tBodyAccJerk-std()-X                
- tBodyAccJerk-std()-Y   
- tBodyAccJerk-std()-Z                
- tBodyGyro-mean()-X     
- tBodyGyro-mean()-Y                  
- tBodyGyro-mean()-Z     
- tBodyGyro-std()-X                   
- tBodyGyro-std()-Y    
- tBodyGyro-std()-Z                   
- tBodyGyroJerk-mean()-X    
- tBodyGyroJerk-mean()-Y              
- tBodyGyroJerk-mean()-Z    
- tBodyGyroJerk-std()-X               
- tBodyGyroJerk-std()-Y     
- tBodyGyroJerk-std()-Z               
- tBodyAccMag-mean()         
- tBodyAccMag-std()                   
- tGravityAccMag-mean()       
- tGravityAccMag-std()                
- tBodyAccJerkMag-mean()      
- tBodyAccJerkMag-std()               
- tBodyGyroMag-mean()       
- tBodyGyroMag-std()                  
- tBodyGyroJerkMag-mean()   
- tBodyGyroJerkMag-std()              
- fBodyAcc-mean()-X     
- fBodyAcc-mean()-Y                   
- fBodyAcc-mean()-Z     
- fBodyAcc-std()-X                    
- fBodyAcc-std()-Y       
- fBodyAcc-std()-Z                    
- fBodyAccJerk-mean()-X    
- fBodyAccJerk-mean()-Y               
- fBodyAccJerk-mean()-Z    
- fBodyAccJerk-std()-X                
- fBodyAccJerk-std()-Y     
- fBodyAccJerk-std()-Z                
- fBodyGyro-mean()-X        
- fBodyGyro-mean()-Y                  
- fBodyGyro-mean()-Z         
- fBodyGyro-std()-X                   
- fBodyGyro-std()-Y       
- fBodyGyro-std()-Z                   
- fBodyAccMag-mean()      
- fBodyAccMag-std()                   
- fBodyBodyAccJerkMag-mean()     
- fBodyBodyAccJerkMag-std()           
- fBodyBodyGyroMag-mean()      
- fBodyBodyGyroMag-std()              
- fBodyBodyGyroJerkMag-mean()  
- fBodyBodyGyroJerkMag-std()

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable. The values in the current dataset are (again) averages of the calculated mean values in the original dataset.

- angle(tBodyAccMean,gravity)    
- angle(tBodyAccJerkMean),gravityMean)
- angle(tBodyGyroMean,gravityMean)   
- angle(tBodyGyroJerkMean,gravityMean)
- angle(X,gravityMean)             
- angle(Y,gravityMean)                
- angle(Z,gravityMean)                
