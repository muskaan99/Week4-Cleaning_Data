Variables mentioned in R code:

feat- features.txt file
activ- activity_labels.txt file

The folllowing files were obtained from test folder
subject_test- subject_test.txt file
X_test-X_test file
y_test- y_test file

The folllowing files were obtained from train folder
subject_train- subject_train file
X_train- X_train file
y_train- y_train file
   
tidy_x- combine X_train & X_test by rows
tidy_y- combine y_train & y_test by rows
tidy_sub- combine subject_train & subject_test by rows
tidy_total-combine tidy_x, tidy_y & tidy_sub by columns (merged in one dataset)

meanstd- subset of tidy_total by selecting subject, label, mean & std

dat2- final dataset with the average of each variable for each activity and each subject stored as data2.txt file
