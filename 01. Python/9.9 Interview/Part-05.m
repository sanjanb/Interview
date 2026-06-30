### **Python Interview Questions: Part 5 (41–50)**

#### **41. What is the use of sessions in the Django framework?**
In Django, **sessions** are used to **persist information across user requests**, allowing the server to remember specific data about a user's activity and preferences. This is critical for functionalities like **user authentication**, as it keeps a user logged in while they navigate different parts of a site. Sessions also store items like shopping cart contents, enhancing the user experience securely since the data is **stored server-side**.

#### **42. Write a oneliner that will count the number of capital letters in a file.**
To count capital letters in a file that might be too large for memory, you can use a **oneliner** consisting of the **`sum()` function and list comprehension** (or a generator expression). This code iterates over each line and each character within the file, checking if the character is uppercase using the **`isupper()` method**, and then sums the total occurrences.

#### **43. Discuss Django architecture.**
Django follows the **Model-View-Template (MVT)** architecture. The **Model** layer represents the data structure and interacts with the database using an ORM. The **View** layer handles the business logic and user interaction, processing HTTP requests and returning responses. The **Template** layer manages the presentation, using HTML files with embedded tags to generate dynamic content based on data passed from the view.

#### **44. List out the inheritance styles in Django.**
Django supports three main inheritance styles for models:
*   **Abstract Base Classes**: These act as **blueprints** and do not create their own database tables; instead, their fields are added to their subclasses.
*   **Multi-table Inheritance**: This is used when every model in the hierarchy requires its own **separate database table**, with all tables linked together.
*   **Proxy Models**: These allow you to change the **Python-level behavior** of a model (like adding methods) without changing the underlying database structure or creating a new table.

#### **45. Create a program to add two integers greater than zero without using the plus (+) operator.**
Adding two positive integers without the plus operator is achieved through **bitwise operations**. Specifically, a function can use bitwise **AND, XOR, and left shifts** to perform the addition bit by bit until there is no carry-over left.

#### **46. How to save an image locally using Python whose URL address I already know?**
You can save an image by using the **`requests` library** to fetch the image data from its URL. The program checks if the download was successful (status code 200) and then **writes the image data to a file** on your local computer using a name you choose.

#### **47. Scrape data from IMDb top 250 movie pages.**
To scrape this data, you use the **`requests` library** to fetch the web page and **`BeautifulSoup`** to parse the HTML. You then loop through the table rows on the page to extract specific fields—**movie names, years, and ratings**—storing them in a structured format like a list of dictionaries.

#### **48. How to send an email in Python?**
Sending emails is handled using the built-in **`smtplib`** for the Simple Mail Transfer Protocol and the **`email` library** for composing the message. The process involves setting up sender and receiver addresses, creating a MIME object for the message body and subject, logging into the SMTP server with authentication, and finally **sending the mail** before closing the connection.

#### **49. Create a program to convert dates from year-month-day to day-month-year.**
This conversion is performed using the **`datetime` module**. You first use **`strptime()`** to parse the input string from the original "year-month-day" format into a datetime object, and then use **`strftime()`** to format that object into the desired "day-month-year" output.

#### **50. How can you get the Google cache age of any URL or web page?**
To find the age of a cached page, you send a **special request to the Google cache URL** for the specific web page you are interested in. You then **analyze Google's response** to extract and display the information regarding how old the cached version of that page is.

***

This concludes all **50 Python interview questions and answers** discussed in the source material.
