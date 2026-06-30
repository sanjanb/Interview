### **Python Interview Questions: Part 3 (21–30)**

#### **21. Explain inheritance in Python.**
**Inheritance** allows one class (the **subclass or child class**) to gain all the members, such as **attributes and methods**, of another class (the **superclass or parent class**). This provides **code reusability** and makes applications easier to create and maintain. Python supports four types of inheritance: **single inheritance** (one child from one parent), **multi-level inheritance** (a chain of inheritance), **hierarchical inheritance** (multiple children from one parent), and **multiple inheritance** (one child from more than one parent).

#### **22. Does Python make use of access specifiers?**
Python does **not have explicit access specifiers** like "public" or "private" found in Java or C++. Instead, it uses **naming conventions**: attributes starting with a **single underscore** are considered **protected** (accessible within the class or subclasses), while those starting with a **double underscore** are considered **private**. Private attributes undergo **name mangling**, making them harder to access from outside the class.

#### **23. Discuss different ways of deleting an element from a list.**
There are two primary built-in functions for this:
*   **remove()**: This function deletes a **specifically mentioned element** from the list based on its value.
*   **pop()**: This function deletes the element located at a **specific index** mentioned in the list.

#### **24. How are classes created in Python?**
Classes are created using the **`class` keyword** followed by the class name and a colon. Inside the class, you define **methods and attributes**. A special method called **`__init__`** acts as a **constructor** and is used for initializing newly created objects. The **`self`** parameter is required as a reference to the current instance to access its specific variables and methods.

#### **25. Write a program in Python to execute the bubble sort algorithm.**
**Bubble sort** is a simple algorithm that repeatedly steps through a list, **compares adjacent elements**, and **swaps them** if they are in the wrong order. This process is repeated until the entire list is sorted. It uses **nested loops** to traverse the list; if a pair is out of order (the first is greater than the second), they are swapped.
```python
def bubble_sort(arr):
    """
    Sorts a list in ascending order using Bubble Sort.
    Time Complexity: O(n^2) in worst case.
    """
    n = len(arr)
    for i in range(n):
        swapped = False  # Optimization: track if any swap happened
        for j in range(0, n - i - 1):
            if arr[j] > arr[j + 1]:
                # Swap elements
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
                swapped = True
        # If no swaps occurred, the list is already sorted
        if not swapped:
            break
    return arr
```

#### **26. Write a code snippet to generate the square of every element in a list.**
The most concise way to achieve this is through **list comprehension**. This method creates a new list by taking each number from an existing list, **squaring it**, and collecting the results into the new list (e.g., `[x**2 for x in numbers]`).
```python
# Given list 
numbers =[1, 2, 3, 4, 5] 
# Using list comprehension to square each element 
squared_numbers = [number ** 2 for number in numbers] 
print(squared_numbers) |
```

#### **27. Write a program to produce the Fibonacci series in Python.**
The **Fibonacci series** is a sequence where each number is the **sum of the two preceding ones**, typically starting with **0 and 1**. A program generates this by starting with those first two terms and, in each iteration, calculating the next number by **adding the last two numbers** in the series and appending it to the list.
```python
def generate_fibonacci(n): 
    # Initialize the first two Fibonacci numbers 
    fib_series = [0, 1] 

    # Generate Fibonacci sequence 
    for i in range(2, n): 
    next_fib = fib_series[-1] + fib_series[-2] 
    fib_series.append(next_fib) 
    return fib_series 
    
    # Example usage 
num_terms = int(input(“Enter the number of terms for the Fibonacci series: ")) 
fibonacci_series = generate_fibonacci(num_terms) 
print("Fibonacci series up to", num_terms, "terms:”, fibonacci_series) 
```

#### **28. What is the difference between a shallow copy and a deep copy?**
A **shallow copy** creates a new object but **copies only the references** to nested objects; therefore, the original and the copy **share the same nested objects**. A **deep copy** creates a new object and **recursively copies all objects** it contains. In a deep copy, the original and the copy **do not share any nested objects**, so changes in one do not affect the other.

#### **29. Write a program in Python to check if a sequence is a palindrome.**
A **palindrome** is a sequence that reads the **same backward as forward** (like "radar" or "level"). To check this in Python, you can write a function that **compares the original sequence to its reverse**. If they match exactly, the sequence is a palindrome.

#### **30. How is multi-threading achieved in Python?**
Multi-threading is achieved using the **`threading` module**, which allows different parts of a program to **run concurrently** as smaller units of execution called **threads**. You can create a subclass of `threading.Thread`, override its **`run` method** with the desired task, and use the **`start()`** and **`join()`** methods to manage the execution.
