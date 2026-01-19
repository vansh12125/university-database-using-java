# 🎓 University Database Management System (Java)

A **college-level University Database Management System** built using **Java, Servlet, JSP, Hibernate, and MySQL**.
This project demonstrates a **clean MVC architecture**, modern UI pages, and proper database interaction using Hibernate ORM.

---

## 📌 Project Overview

This project is designed for **BCA / MCA students** to understand how a real-world university system works, including:

* Student login using **Roll Number & Name**
* Hibernate-based database operations (no JDBC)
* Servlet-based request handling
* JSP for dynamic web pages
* MySQL as the backend database

It is **exam-oriented**, **interview-friendly**, and suitable as a **mini / major project**.

---

## 🔐 Student Login Flow

1. Student enters **Roll Number & Name**
2. Form submits data to **StudentLoginServlet**
3. Servlet calls **StudentDAO**
4. Hibernate checks data in MySQL
5. Login success or failure message shown

---

## 🧠 Hibernate Logic (Core Feature)

* Uses **HQL (Hibernate Query Language)**
* Uses **named parameters**
* Prevents SQL Injection
* Auto table generation

---

## ⚙️ Database Configuration

Database name: **`university`**

```sql
CREATE DATABASE university;
```

Hibernate handles:

* Table creation
* Auto-increment roll number
* Schema updates

---

## 🚀 How to Run the Project

1. Clone the repository
2. Import as **Maven Project** in Eclipse
3. Configure **MySQL username & password** in `hibernate.cfg.xml`
4. Run on **Apache Tomcat 10+**
5. Open in browser:

```
http://localhost:8080/lucknow/
```

---

* 📢 Share with friends

Happy Coding! 🚀
