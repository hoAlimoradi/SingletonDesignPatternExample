# SingletonDesignPatternExample
It's one of the simplest design patterns,
The singleton's primary purpose is to guarantee that we can create only one instance of a given type.
Singletons can serve you well if there's a single resource, and you need to access and manage that single instance throughout your application.

The UIApplication object is a good example. We need one in every IOS app, but we shouldn't have more than one. The singleton UIApplication instance can be accessed using the shared type property.

Another example would be a log file handler. You want to ensure that all the logs emitted by the various components of your software system, get inserted into the log file. Also, you need to avoid synchronization issues and data corruption.

Using Singletons as global shared state goes against the single responsibility principle which tells us that each type should have one well-defined responsibility.
 
The single responsibility principle is one of the five fundamental object-oriented design principles, known as solid principles.

Another issue with singletons is that once you start using them, they tend to spread across your code base.
Eventually, you lose track of the objects that depend on the singletons.

These dependencies are hidden since you don't have to pass the singleton to a method, an initializer, or assign it to a property of a type to use it.

Changing the singleton requires refactoring lots of other seemingly unrelated components.

This ripple effect is quite a common problem in projects that rely heavily on singletons and global instances. Now, besides these object-oriented design concerns,
implementing the singleton correctly isn't always easy and straightforward.

Synchronization issues arise if we forget to protect our singletons against concurrent usage. On the other hand, a threat safe singleton might become a performance bottleneck if multiple threads are using it in parallel.

Swift dictionaries are not thread safe
