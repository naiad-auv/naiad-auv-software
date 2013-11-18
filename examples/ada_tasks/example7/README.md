Ada Tasks - Example 7
=====================
Compile with "make all", "make ravenscar" or "make restricted" depending on
which profile you want to use.

### Expected result
Output will be something similiar as below with `make all` when compiling
and running on Ubuntu 12.04.3. `Main - Started` is printed from its own
thread so that line can be printed between any pair lines (or as first or
last line).

### Warning
If you compile with `make ravenscar` or `make restricted` the pragma
restriction `No_Task_Termination` will be activated. This will cause the
Task\_One to stay alive even if it has run to the end of it e.g. no infinite
loop. The main subprogram will in turn never exit cause all threads haven't
terminated so if you test this on Ubuntu you will have to kill the process(es).
