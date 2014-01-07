failedbanklist = load 'banklist.csv' using PigStorage(',') as (bankname, city, state, cert, acqinst, closedate, updatedate);
dump failedbanklist;
