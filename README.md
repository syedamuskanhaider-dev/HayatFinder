# 🧭 HayatFinder – Lost & Found Management System

HayatFinder is a web-based Lost and Found Management System developed using ASP.NET Web Forms and SQL Server. The system enables users to report lost or found items, browse available listings, search for items, and securely contact item owners through email notifications.

---

## 📌 Features

- 🔐 User Authentication (Login)
- 📝 Report Lost and Found Items
- 🔍 Search Items by Name, Category, Description, or Location
- 📋 Browse Latest Reported Items
- 📧 Send Claim Requests to Item Owners
- 🤝 Send Help Requests
- 📨 Automatic Email Notifications
- 🗄️ SQL Server Database Integration
- 👤 Session-Based User Management
- 📱 Responsive Web Interface

---

## 🛠️ Technologies Used

- ASP.NET Web Forms (.NET Framework)
- C#
- SQL Server
- ADO.NET
- HTML5
- CSS3
- JavaScript
- Bootstrap
- SMTP (Gmail) Email Service

---

## 📂 Project Structure

```
HayatFinder/
│
├── landing.aspx
├── login.aspx
├── feed1.aspx
├── myitem.aspx
│
├── *.cs
├── *.designer.cs
│
├── App_Data/
├── Images/
├── CSS/
├── Scripts/
│
├── packages.config
├── HayatFinder.csproj
└── README.md
```

---

## 🚀 Main Modules

### 🏠 Landing Page
- Introduction to the platform
- Navigation to Login and Main Features

### 🔐 Login System
- User authentication
- Session management
- Secure access to application features

### 📋 Item Feed
- View all reported items
- Search functionality
- View item details

### 📧 Contact Item Owner
- Send Help Request
- Send Claim Request
- Email notifications using Gmail SMTP

### 👤 My Items
- View items reported by the logged-in user

---

## 🗃️ Database

The project uses **Microsoft SQL Server**.

Example Tables:

- Users
- ReportedItems

---

## ⚙️ Installation

### Prerequisites

- Visual Studio 2022 (or later)
- SQL Server
- IIS Express
- .NET Framework
- SQL Server Management Studio (SSMS)

### Steps

1. Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/HayatFinder.git
```

2. Open `HayatFinder.csproj` in Visual Studio.

3. Restore NuGet packages.

4. Create the SQL Server database.

5. Update the connection string in the project.

6. Configure Gmail SMTP credentials (or use your own email service).

7. Run the project using IIS Express.

---

## 📧 Email Notifications

The system automatically sends email notifications when:

- A user wants to claim an item.
- A user wants to help the owner.

---

## 👩‍💻 Developed By

**Syeda Muskan Haider**

BS Software Engineering Student

---

## 📄 License

This project was developed for educational and academic purposes.