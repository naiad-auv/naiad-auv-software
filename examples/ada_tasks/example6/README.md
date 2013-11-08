Ada Tasks - Example 6
=====================
This is an example with two tasks that are cyclic, reading and writing
to the same protected object. The difference to task example 5 is that the
tasks in this example share the same starting time, "Epoch".
Example partly from "Concurrent and Real-Time Programming in Ada by Alan Burns
and Andy Wellings pp. 131 - 132, ISBN: 978-0-521-86697-2

Compile with "make all", "make ravenscar" or "make restricted" depending on
which profile you want to use.

### Expected result
Output will be something similiar as below with `make all` when compiling
and running on Ubuntu 12.04.3. `Main - Started` is printed from its own
thread so that line can be printed between any pair lines (or as first or
last line).

Output is seconds since "epoch" + fractions of seconds.

    Task type cyclic - Start, ID:  1
    Task 1 - Epoch: 1383551977 + 0.764109000)
    Main - Started
    Task type cyclic - Start, ID:  2
    Task 2 - Epoch: 1383551977 + 0.764109000)
    Task 1 - 42 + 3 = 45 - ( 1383551977 + 0.964140000)
    Task 2 - 45 + 5 = 50 - ( 1383551977 + 0.964202000)
    Task 1 - 50 + 3 = 53 - ( 1383551978 + 0.164140000)
    Task 2 - 53 + 5 = 58 - ( 1383551978 + 0.164202000)
    Task 2 - 58 + 5 = 63 - ( 1383551978 + 0.364202000)
    Task 1 - 63 + 3 = 66 - ( 1383551978 + 0.364140000)
    Task 1 - 66 + 3 = 69 - ( 1383551978 + 0.564140000)
    Task 2 - 69 + 5 = 74 - ( 1383551978 + 0.564202000)
    Task 1 - 74 + 3 = 77 - ( 1383551978 + 0.764140000)
    Task type cyclic - End, ID: 1
    Task 2 - 77 + 5 = 82 - ( 1383551978 + 0.764202000)
    Task type cyclic - End, ID: 2

### Warning
If you compile with `make ravenscar` or `make restricted` the pragma
restriction `No_Task_Termination` will be activated. This will cause the
Task\_One to stay alive even if it has run to the end of it e.g. no infinite
loop. The main subprogram will in turn never exit cause all threads haven't
terminated so if you test this on Ubuntu you will have to kill the process(es).
