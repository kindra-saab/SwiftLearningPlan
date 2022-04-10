import UIKit

var topic = "Concurrency"
print(topic)



//Main Thread and Background Thread

//Main Thread - On which user Interaction happens-> (Button click etc)
//Bakcground Thread - process which are going on in background like -> api calls, loading a heavy Image.

//We have to keep main thread free.
//To keep user Interaction healthy.


//QUEUE -> FIFO.

//***Serial Queue -> where 1 operation completes 100% and then another operation comes.
//1. Executes the task one after another.
//2. we use serial queues when order of task execution matters.

//task D ---->>>> task C ----->>>>  task B ---->>>> task A ---->>>>
//Example ->

//                                   |
//Display the contents of user --->>>|Read the contents of file --->>> Save the file in iphone --->>> API Call to fetch the file
//                                   |
//    *** Main Thread ***            |          *** Background  Thread ***

//Concurrency -> means Multi Tasking.

//*** Concurrent Queue->
//Where multiple operation starts together -> like Race of athletes, They all start parallely.
// Unpredictable code of execution ->like who is going to win, we don't know.
//Faster because there's no waiitng and all task run at same time.
// Task B doesnot have to wait for Task A to complete.
//Use when order of execution does not matters.


//For the task performed above in line 27, we can't put these tasks in concurrent queue.
//Because for these tasks, order of execution matters a lot.


// Race Condtion
//Race Condition occus in a multi-threaded environment when more than one thread try to access a shared resource(modify, write) at same time.
//Reading at same time is not a propblem, but yes modifying at same time is a problem.

//Netbannking and withdrawal bank example.



//There are two ways to do multithread operation
//1. Dispatch Framework (GCD)  - more popular  (Grand Cnetral Dispatch)

//2. Operation Queue


//Operation Queue

//Operation Queue is an abstract class, prewrittten by apple developers.


//Multithreading depends on core of the CPU.

//why concurrency -> to ensure that app runs smoothly and the end user is not ever forced to wait for something to happen.

//GCD is a low level API for managung concurrent Operations


//The Queue that will execute all these block operations together is called ** operation queue. **

//Dispatch Queue => An Object that manages the execution of tasks serially or concurrently on your app's main thread or background thread.

// Dispatch Queues are FIFO queues to which yuor application can submit tasks in the form of block Objectds


//QOS ( Quality of Service) is class that categorize work to perform on Dispatch Queue.
//By specifying the quality of task , we indicate the importance to our app.
//when scheduling task, the system prioritize those have a higher service clas.


//Asynchrnous Function->
//special kind of method that can be suspended while it's partway through execution


// Made this function asynchronous, because there is some API call which takes time to fetch the data and allow rest of the app to keep running while this code waits for a picture to appear.

//******** ASYNCHRONOUS FUNCTION **********
//func listPhotos(inGallery name: String) async -> [String] {
//    let result = // ... some asynchronous networking code ...
//    return result
//}


//********* CALLIING THE ASYNCHRONOUS FUNCTION  ******

//let photoNames = await listPhotos(inGallery: "Summer Vacation")
//Now as we have used await, code execution suspends and it returns for the function to return.

//When we are waiting for some asynchronous method to return , then it is called yielding the thread.

//Swift suspends execution of code on current thread and runs some another code on that thread.




//Calling Aynchronous Functions in Parallel.

//let firstPhoto = await downloadPhoto(named: photoNames[0])
//let secondPhoto = await downloadPhoto(named: photoNames[1])
//let thirdPhoto = await downloadPhoto(named: photoNames[2])
//
//let photos = [firstPhoto, secondPhoto, thirdPhoto]
//show(photos)


//In the above code, it waits for each  photo to download first and then it goes to the next line,
//However there's no need for these operations to wait, each photo ca download independently or even at the same time.

//To get rid of above problem, what we can do is ->

//async let firstPhoto = downloadPhoto(named: photoNames[0])
//async let secondPhoto = downloadPhoto(named: photoNames[1])
//async let thirdPhoto = downloadPhoto(named: photoNames[2])
//
//let photos = await [firstPhoto, secondPhoto, thirdPhoto]
//show(photos)


//In above example, all three calls start simultaneously without waiting for the previous one to complete.
//We write "await" in line 127 to pause execution until all three photos finish downloading.



//Task and Task group

//In the line no 123,124,125. these are child tasks for us,
//Now , we can create a task group and add a child task in that, which gives us more control over priority and cacncellation.
//Tasks are arranged in heirarchy,
//Each task in task group has some parent task and child task
//This approach is called Structured Concurrency.



// *** Actor ****

//Actors are like classes, they are also reference type
//Unlike classes, actors allow only one task to access their mutable state at a time.
//So, that multiple task do not interact at the same time, which leads to error.


actor TemperatureLogger {
    let label: String
    var measurements: [Int]
    private(set) var max: Int

    init(label: String, measurement: Int) {
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }
}


//let logger = TemperatureLogger(label: "Outdoors", measurement: 25)
//print(await logger.label)


// if code from another task is already interacting with the logger, this code suspends while it waits to access the property.




//*********    ***********   *************

//So how can we execute code on other threads in Swift and iOS? Here are the iOS and Swift native possibilities:
//
//
//1. Grand Central Dispatch (GCD)
//2. Operation and OperationQueues
//3. Swift Concurrency


//Grand Central Dispatch (GCD) Is Used For Managing Concurrent Operation, It Is A Low-Level API. It Was First Introduced In IOS 4. The Main Purpose Of Grand Central Dispatch Is To Manage The Heavy Tasks In The Background.

//First, we will see what is a queue, a queue is a block of code that is managed by the operating system to execute it synchronously or asynchronously either on the main thread or background thread


func myFirstQueue() {
        let myqueue = DispatchQueue(label: "com.app.myqueue")
        myqueue.sync {
            for item in 1..<10{
                print(item)
            }
 
        }
        for item in 20..<30 {
            print(item)
        }
    }

myFirstQueue()


func myFirstQueue2() {
        let myqueue = DispatchQueue(label: "com.app.myqueue")
        myqueue.async {
            for item in 1..<10{
                print(item)
            }
 
        }
        for item in 20..<30 {
            print(item)
        }
    }

myFirstQueue2()

//Quality Of Service.

//1. To determine the priorities of the task we used the QoS class property.
//2. It is done so that system will know which task has higher priority. So that the execution has to be done accordingly. Although the task runs on the main thread has the highest priority since it makes UI responsive.


func exampleQoS() {
        let firstQueue = DispatchQueue(label: "com.app.firstQueue", qos: .userInitiated)
        let secondQueue = DispatchQueue(label: "com.app.secondQueue", qos: .utility)
        secondQueue.async {
            for item in 1..<10{
                print(item)
            }
        }
        firstQueue.async {
            for item in 20..<30 {
                print(item)
            }
        }
        
    }

exampleQoS()


func exampleSerialQueue() {
        let queue = DispatchQueue(label: "com.app.queue", qos: .utility)
        
        queue.async {
            for _ in 1..<5{
                print("**********")
            }
        }
        
        queue.async {
            for _ in 1..<5{
                print("AAAAAAAAAA")
            }
        }
        
        queue.async {
            for _ in 1..<5{
                print("0000000000")
            }
        }
 
    }

exampleSerialQueue()
// In this case we see output as when first function completes then only, then only second function start as they are in serial queue.


//Now we make our queue as Concurrent.


func concurrentQueueExample(){
        let concurrentQueue = DispatchQueue(label: "com.app.concurrentQueue", qos: .userInitiated, attributes: .concurrent)
        concurrentQueue.async {
            for _ in 1..<10{
                print("**********")
            }
        }
        
        concurrentQueue.async {
            for _ in 30..<40{
                print("AAAAAAAAAA")
            }
        }
        
        concurrentQueue.async {
            for _ in 50..<60{
                print("0000000000")
            }
        }
    }

concurrentQueueExample() // Now the output is mixed.


