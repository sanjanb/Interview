### **Python Interview Questions: Part 1 (1–10)**

#### **1. What are the common built-in data types in Python?**
The common built-in data types in Python include **numbers, lists, tuples, strings, sets, dictionaries, and Booleans**. **Numbers** consist of integers, floating-point numbers, and complex numbers. A **list** is an ordered sequence of items that can belong to different data types, while a **tuple** is a similar ordered sequence but is **immutable**, meaning it cannot be changed. A **string** is a sequence of characters declared within quotes, and a **set** is an unordered collection of unique items. **Dictionaries** store data in **key-value pairs**, and **Booleans** represent two values: true or false.

#### **2. What are the key features of Python?**
Python is an **interpreted language**, meaning it does not need to be compiled before it is run. It is **dynamically typed**, so you do not need to state variable types when declaring them. Python supports **object-oriented programming**, allowing for classes, composition, and inheritance. Notably, it lacks explicit **access specifiers** like "public" or "private" found in C++. Furthermore, functions and classes are **first-class objects**, meaning they can be assigned to variables or passed as arguments.

#### **3. What are Lambda functions in Python?**
**Lambda functions** are small, **anonymous functions** that can have any number of arguments but are restricted to **only one expression**. They are often thought of as **tiny, disposable functions** created on the fly without a name. For example, a Lambda function can be used to square a number concisely without a formal `def` statement.

#### **4. Is Python a compiled language or an interpreted language?**
Python actually works in two ways: it is **partly compiled and partly interpreted**. When you run code, Python first **compiles it into bytecode**. Following this, the **Python Virtual Machine (PVM)** translates this bytecode to work properly on the specific computer and its operating system.

#### **5. What are Python namespaces?**
A **namespace** is described as a **labeled box** where Python keeps track of the names given to variables and functions. There are four types of namespaces: **built-in** (default Python stuff), **global** (main program code), **enclosing** (inner functions accessing outer function data), and **local** (stuff inside a specific function). They help Python organize and track everything you have created based on where it was defined.

#### **6. What are local variables and global variables in Python?**
**Global variables** are declared outside a function or in a global space and can be **accessed by any function** in the program. To modify a global variable inside a function, the `global` keyword must be used. In contrast, **local variables** are declared inside a function and are only present in that **local space**, not the global space. Their scope is limited to the function where they are defined, and they are **reinitialized** with each function call.

#### **7. What is "self" in Python?**
The `self` keyword represents an **instance or object of a class**. It is used to **distinguish between class methods and attributes** and local variables. In the `__init__` method, `self` points to the newly created object, while in other methods, it points to the object that called that specific method.

#### **8. How are arguments passed in Python: by value or by reference?**
In Python, arguments are passed to functions by **assignment**, which is also called **pass by object reference** or pass by sharing. This means the function receives a reference to the **actual object**, not a copy. If the object is **mutable**, changes made within the function affect the original object. If the object is **immutable**, it cannot be changed, and any attempt to modify it creates a **new object** instead.

#### **9. What is "pass" in Python?**
The `pass` statement signifies **executing no action** and serves as a **placeholder** within a compound statement. It indicates a blank space where no specific action is required. It is useful in scenarios where a statement is **syntactically required** but the developer does not want any command or code to execute yet.

#### **10. What is a dynamically typed language?**
**Dynamically typed languages** are those that do **not require predefined data types** for variables. The data type is **assigned at runtime** by the interpreter based on the value assigned to the variable.
