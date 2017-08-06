# Getting-Cleaning-Data-Assignment

The Getting & Cleaning Data course finishes up with an assignment. The challenge is uploading an R-script that will produce a dataset out of a source dataset. The assignment points to a weblocation where the dataset can be downloaded from. When the file is downloaded it must be unzipped first before the contents can be used inside R. Via a number of steps / commands the script will produce another tidy dataset that has been uploaded to Coursera. Eventhough the script file itself contains comments regarding the how and why of the commands they will be repeated here. Inside this repository you will also find a Codebook that describes the variables in the dataset.

## Setting the working directory / location of source data

The working directory needs to be set to the same directory where the source data is located —— or the directory containing this data should be moved to the working directory. If the source data would have had to be downloaded via the script it would have arrived as a .zip file. This would require unzipping of course. This could have been handled by the script too.

## Combining data about the subject and activity with measurements

The data about the subject and the activities performed has been stored in separate files. This data should be read into R and combined with the actual measurements. This should be done for test data aswell as training data.

## Naming the colums in the dataset

The variables (colums) contain no names at the moment, but there is a separate file that lists all 561 original variables. I've assigned that list to an object so that the information can be used to name the colums in the dataframe. The two added colums / variables (subject and activity) will be named too, of course.

## Combining the test and training datasets

The dataset has been split into parts: one part for training, one part for testing. By adding these two datasets together BEFORE we provide the names for the colums / variables we don't have to perform that trick only once.

## Replacing the activity data

Data about the kind of activity was being provided by way of a number, but that isn't descriptive, so I've replaced them with the actual labels. These could be found in a separate text file aswell.

## Filtering the dataset

Only a fraction of the dataset is needed fot this assignment, so I've filterd the dataset. The result was a dataset measuring about 10.000 observations and 75 variables.

## Reshaping the dataset

Finally I was able to reshape the dataset. Using the melt() commando in conjunction with dcast() I could calculate the average values for each activity and for each subject

Of course the newly created dataset has been exported and uploaded too.
