Ada Tasks - Example 4
=====================
This is an example with three tasks that are cyclic, created from the same task
type. Example from "Concurrent and Real-Time Programming in Ada by Alan Burns and
Andy Wellings pp. 440 - 441, ISBN: 978-0-521-86697-2

Compile with "make all", "make ravenscar" or "make restricted" depending on
which profile you want to use.

### Expected result
Output will be something similiar as below with `make all` when compiling
and running on Ubuntu 12.04.3. `Main - Started` is printed from its own
thread so that line can be printed between any pair lines (or as first or
last line).

Output is seconds since "epoch" + fractions of seconds.

    Task type cyclic - Start, ID:  1
    Task type cyclic - Start, ID:  2
    Task type cyclic - Start, ID:  3
    Main - Started
    Task 2 - 1383545384 + 0.582844000
    Task 1 - 1383545384 + 0.582933000
    Task 2 - 1383545384 + 0.582944000
    Task 2 - 1383545384 + 0.583044000
    Task 3 - 1383545384 + 0.583091000
    Task 1 - 1383545384 + 0.583133000
    Task 2 - 1383545384 + 0.583144000
    Task 2 - 1383545384 + 0.583244000
    Task type cyclic - End, ID: 2
    Task 1 - 1383545384 + 0.583333000
    Task 3 - 1383545384 + 0.583391000
    Task 3 - 1383545384 + 0.583691000
    Task 1 - 1383545384 + 0.583533000
    Task 1 - 1383545384 + 0.583733000
    Task type cyclic - End, ID: 1
    Task 3 - 1383545384 + 0.583991000
    Task 3 - 1383545384 + 0.584291000
    Task type cyclic - End, ID: 3

### Warning
If you compile with `make ravenscar` or `make restricted` the pragma
restriction `No_Task_Termination` will be activated. This will cause the
Task\_One to stay alive even if it has run to the end of it e.g. no infinite loop.
The main subprogram will in turn never exit cause all threads haven't
terminated so if you test this on Ubuntu you will have to kill the process(es).
