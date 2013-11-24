Ada Tasks Examples
==================
In this examples directory you'll find a couple of different Ada examples that
use Ada tasks. The first examples keep it simple and comply with the Ravenscar
profile.

### Example 1
One task, no big deal.

### Example 2
Added cyclic behaviour to the task. This example shows how to use ```delay
until``` without getting complaints from the compiler about
"No_Relative_Delay" allowed due to Ravenscar profile.

### Example 3
Two different tasks but with the same behaviour. This example also shows how
to print the time when the tasks executes.

### Example 4
This example shows how to create multiple tasks from the same task type. Look
at the difference from example three in ```common_tasks.ads```.

### Example 5
Two tasks that use the same Protected Object, a simple shared integer.

### Example 6
Similiar to example 5 but with the addition that they all share the same
starting time.

### Example 7
Incomplete example, but it runs. Two different programs A/B that do the same
thing. Creates a TCP listener and server and transmits to the other one. Start
both programs and when one of the terminates start it again.
