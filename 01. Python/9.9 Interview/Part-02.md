### **Python Interview Questions: Part 2 (11–20)**

#### **11. What is PEP 8?**
**PEP** stands for **Python Enhancement Proposal**. **PEP 8** is a specific document that provides a **set of rules and guidelines** on how to format Python code to ensure it has **maximum readability** for other developers.

#### **12. What is PYTHONPATH?**
**PYTHONPATH** is an **environment variable** used by the Python interpreter when a module is imported. Whenever an import occurs, Python looks at the directories listed in PYTHONPATH to determine which **module to load**.

#### **13. What are Python modules and name some commonly used built-in modules?**
**Python modules** are simply files with a `.py` extension that contain Python code, which can include **functions, classes, or variables**. Some of the most **commonly used built-in modules** include:
*   **os**: For operating system dependent functionality.
*   **sys**: For system-specific parameters and functions.
*   **math**: For mathematical operations.
*   **random**: For generating random numbers.
*   **datetime**: For manipulating dates and times.
*   **json**: For parsing and generating JSON data.

#### **14. What is break and continue in Python?**
The **break statement** is used to **exit a loop prematurely** when a specific condition is met, stopping any further iterations. The **continue statement** is used to **skip the current iteration** of the loop and immediately move on to the next one, without executing the remaining code in the loop for that specific turn.

#### **15. Can we pass a function as an argument in Python?**
**Yes**, you can pass a function as an argument to another function. This is possible because functions in Python are **first-class objects**, meaning they are treated like any other object, such as integers, strings, or lists. They can be assigned to variables, stored in data structures, and **passed into other functions** to be invoked dynamically.

#### **16. What does the Hash symbol (#) do in Python?**
The **hash symbol (#)** is used to **denote comments**. Any text that follows the hash symbol on the same line is **not executed** when the Python code runs.

#### **17. What is type conversion in Python?**
**Type conversion** refers to the process of converting one data type into another. Python provides several built-in functions for this, such as **int()** for integers, **float()** for floating-point numbers, **list()** to convert to a list, **dict()** to convert key-value pairs into a dictionary, and **str()** to convert values into strings.

#### **18. What is a docstring in Python?**
A **docstring** (documentation string) is a string literal that appears as the **first statement** in a module, function, class, or method definition. Its purpose is to provide **inline documentation** about the object's purpose and usage. Docstrings are typically enclosed in **triple quotes** and are accessible via the object's `__doc__` attribute.

#### **19. What is slicing in Python?**
**Slicing** is a technique used to **access specific parts of sequences**, such as strings, tuples, and lists. The syntax is `start:end:step`. It returns all elements from the "start" index (inclusive) up to the "end" index (exclusive). The **step** value indicates how many elements to skip between each item in the slice.

#### **20. What is pickling and unpickling?**
**Pickling** is the process where the `pickle` module takes a Python object, converts it into a **string representation**, and dumps it into a file. **Unpickling** is the inverse process of **retrieving the original Python object** from that stored string representation.
