failedbanksall = LOAD 'banklist.csv' USING PigStorage(',')
                 AS (bankname, city, state, cert, acqinst, closedate, updatedate);
failedbanks = FILTER failedbanksall BY cert MATCHES '\\d+';
banksbystate = GROUP failedbanks BY state;
bankcount = FOREACH banksbystate GENERATE group, COUNT(failedbanks);
sorted = ORDER bankcount BY $1 DESC;
top3 = LIMIT sorted 3;
STORE top3 INTO 'result';
