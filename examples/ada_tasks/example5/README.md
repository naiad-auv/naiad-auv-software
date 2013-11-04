Ada Tasks - Example 5
=====================
This is an example with two tasks that are cyclic, reading and writing
to the same protected object.
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
    Main - Started
    Task type cyclic - Start, ID:  2
    Task 1 - 42 + 3 = 45 - ( 1383549723 + 0.094181000)
    Task 2 - 45 + 5 = 50 - ( 1383549723 + 0.094366000)
    Task 1 - 50 + 3 = 53 - ( 1383549723 + 0.094381000)
    Task 1 - 53 + 3 = 56 - ( 1383549723 + 0.094581000)
    Task 2 - 56 + 5 = 61 - ( 1383549723 + 0.094666000)
    Task 1 - 61 + 3 = 64 - ( 1383549723 + 0.094781000)
    Task 2 - 64 + 5 = 69 - ( 1383549723 + 0.094966000)
    Task 1 - 69 + 3 = 72 - ( 1383549723 + 0.094981000)
    Task type cyclic - End, ID: 1
    Task 2 - 72 + 5 = 77 - ( 1383549723 + 0.095266000)
    Task 2 - 77 + 5 = 82 - ( 1383549723 + 0.095566000)
    Task type cyclic - End, ID: 2

### Warning
If you compile with `make ravenscar` or `make restricted` the pragma
restriction `No_Task_Termination` will be activated. This will cause the
Task\_One to stay alive even if it has run to the end of it e.g. no infinite loop.
The main subprogram will in turn never exit cause all threads haven't
terminated so if you test this on Ubuntu you will have to kill the process(es).
