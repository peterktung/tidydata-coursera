###Codebook for subjectActivityMean.txt

subject_id : id of the subject, ranges from 1 to 30
activity : the activity that the subject is being measured.  Can be one of:
    - WALKING
    - WALKING_UPSTAIRS
    - WALKING_DOWNSTAIRS
    - SITTING
    - STANDING
    - LAYING
<feature><function><XYZ> : Double value where
    - <feature> : time or frequency based signals 
    - <function> : function used to estimate the signals. Can be one of:
      - stdFunc: standard deviation
      - meanFunc: mean
    - <XYZ> : the axis being measured (if applicable)
    
