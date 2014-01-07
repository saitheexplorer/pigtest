A = LOAD 'banklist.csv' USING PigStorage(',') AS (bankname, city, state, cert, acqinst, closedate, updatedate);
B = FILTER A BY cert MATCHES '\\d+';
C = GROUP B BY closedate;
D = FOREACH C GENERATE group, COUNT(B)
DUMP D

-- Can't group by year
