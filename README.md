# iOS15-UiKit-GCD

#Grand Central Dispatch

Behind the scenes your app actually executes multiple sets of instructions at the same time, which allows it to take advantage of having multiple CPU cores. Each CPU can be doing something independently of the others, which hugely boosts your performance. These code execution processes are called threads, and come with a number of important provisos:
- Threads execute the code you give them, they don't just randomly execute a few lines from viewDidLoad() each. This means by default your own code executes on only one CPU, because you haven't created threads for other CPUs to work on.
- All user interface work must occur on the main thread, which is the initial thread your program is created on. If you try to execute code on a different thread, it might work, it might fail to work, it might cause unexpected results, or it might just crash.
- You don't get to control when threads execute, or in what order. You create them and give them to the system to run, and the system handles executing them as best it can.
- Because you don't control the execution order, you need to be extra vigilant in your code to ensure only one thread modifies your data at one time.

Broadly speaking, if you’re accessing any remote resource, you should be doing it on a background thread – i.e., any thread that is not the main thread. If you're executing any slow code, you should be doing it on a background thread. If you're executing any code that can be run in parallel – e.g. adding a filter to 100 photos – you should be doing it on multiple background threads.

