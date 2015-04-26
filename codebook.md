###Codebook for subjectActivityMean.txt

subject_id : id of the subject, ranges from 1 to 30

activity : the activity that the subject is being measured.  Can be one of:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

&lt;feature&gt;&lt;function&gt;&lt;XYZ&gt; : Double value where
- &lt;feature&gt; : time or frequency based signal
- &lt;function&gt; : function used to estimate the signals. Can be one of:
  - stdFunc: standard deviation
  - meanFunc: mean
- &lt;XYZ&gt; : the axis being measured (if applicable)
    
