Ada Tasks - Example 1
=====================
This is a simple example with a task.

Compile with "make all", "make ravenscar" or "make restricted" depending on
which profile you want to use.

### Expected result
Output will be as follows with `make all` when compiling and running on Ubunut
12.04.3. `Main - Started` is printed from its own thread so that line can be
printed between any line from Task\_One.

    ´´´
    Task_One - Start
    Task_One -  1
    Task_One -  2
    Task_One -  3
    Task_One -  4
    Task_One -  5
    Main - Started
    Task_One -  6
    Task_One -  7
    Task_One -  8
    Task_One -  9
    Task_One - End
    ´´´

### Warning
If you compile with `make ravenscar` or `make restricted` the pragma
restriction `No_Task_Termination` will be activated. This will cause the
Task\_One to stay alive even if it has run to the end of it e.g. no infinite loop.
The main subprogram will in turn never exit cause all threads haven't
terminated so if you test this on Ubuntu you will have to kill the process(es).
