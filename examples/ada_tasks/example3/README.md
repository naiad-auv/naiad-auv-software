Ada Tasks - Example 3
=====================
This is a simple example with two tasks that are cyclic.

Compile with "make all", "make ravenscar" or "make restricted" depending on
which profile you want to use.

### Expected result
Output will be something similiar as below with `make all` when compiling
and running on Ubuntu 12.04.3. `Main - Started` is printed from its own
thread so that line can be printed between any pair lines (or as first or
last line).

Output is seconds since "epoch" + fractions of seconds.

    Task_One - Start
    Main - Started
    Task_Two - Start
    Task_Two -  1383316139 + 0.168188000
    Task_One -  1383316139 + 0.417980000
    Task_Two -  1383316139 + 0.418188000
    Task_Two -  1383316139 + 0.668188000
    Task_One -  1383316139 + 0.917980000
    Task_Two -  1383316139 + 0.918188000
    Task_Two -  1383316140 + 0.168188000
    Task_Two - End
    Task_One -  1383316140 + 0.417980000
    Task_One -  1383316140 + 0.917980000
    Task_One -  1383316141 + 0.417980000
    Task_One - End

### Warning
If you compile with `make ravenscar` or `make restricted` the pragma
restriction `No_Task_Termination` will be activated. This will cause the
Task\_One to stay alive even if it has run to the end of it e.g. no infinite loop.
The main subprogram will in turn never exit cause all threads haven't
terminated so if you test this on Ubuntu you will have to kill the process(es).
