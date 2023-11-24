# Passive_MySQL80

MySQL in Windows run as a windows service automatically, this batch file makes MySQL80 passive.

**MUST RUN AS AN ADMINISTRATOR!!!!**

1. Passive_MySQL80
   
    Make MySQL80 only starts by user's demand, and make batch files in ~\Documents\Scripts_MySQL80.

2. Active_MySQL80

    Rollback all changes.


**In fact, modify an "obj" in line 10 to other service name will works as well.**

Name of service can be found at services.msc.
