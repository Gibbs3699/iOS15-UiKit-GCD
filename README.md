# iOS15-UiKit-GCD

#Grand Central Dispatch

Behind the scenes your app actually executes multiple sets of instructions at the same time, which allows it to take advantage of having multiple CPU cores. Each CPU can be doing something independently of the others, which hugely boosts your performance. These code execution processes are called threads, and come with a number of important provisos:
- Threads execute the code you give them, they don't just randomly execute a few lines from viewDidLoad() each. This means by default your own code executes on only one CPU, because you haven't created threads for other CPUs to work on.
- All user interface work must occur on the main thread, which is the initial thread your program is created on. If you try to execute code on a different thread, it might work, it might fail to work, it might cause unexpected results, or it might just crash.
- You don't get to control when threads execute, or in what order. You create them and give them to the system to run, and the system handles executing them as best it can.
- Because you don't control the execution order, you need to be extra vigilant in your code to ensure only one thread modifies your data at one time.

Broadly speaking, if you’re accessing any remote resource, you should be doing it on a background thread – i.e., any thread that is not the main thread. If you're executing any slow code, you should be doing it on a background thread. If you're executing any code that can be run in parallel – e.g. adding a filter to 100 photos – you should be doing it on multiple background threads.

“How important” some code is depends on something called “quality of service”, or QoS, which decides what level of service this code should be given. Obviously at the top of this is the main queue, which runs on your main thread, and should be used to schedule any work that must update the user interface immediately even when that means blocking your program from doing anything else. But there are four background queues that you can use, each of which has their own QoS level set:

- User Interactive: this is the highest priority background thread, and should be used when you want a background thread to do work that is important to keep your user interface working. This priority will ask the system to dedicate nearly all available CPU time to you to get the job done as quickly as possible.
- User Initiated: this should be used to execute tasks requested by the user that they are now waiting for in order to continue using your app. It's not as important as user interactive work – i.e., if the user taps on buttons to do other stuff, that should be executed first – but it is important because you're keeping the user waiting.
- The Utility queue: this should be used for long-running tasks that the user is aware of, but not necessarily desperate for now. If the user has requested something and can happily leave it running while they do something else with your app, you should use Utility.
The Background queue: this is for long-running tasks that the user isn't actively aware of, or at least doesn't care about its progress or when it completes.
- Those QoS queues affect the way the system prioritizes your work: User Interactive and User Initiated tasks will be executed as quickly as possible regardless of their effect on battery life, Utility tasks will be executed with a view to keeping power efficiency as high as possible without sacrificing too much performance, whereas Background tasks will be executed with power efficiency as its priority.
