# Book Management System

Welcome to the Book Management System, a comprehensive Ruby application designed to facilitate the management of book inventories. This system provides a user-friendly interface for listing, adding, removing, and searching for books, with the added capability of sorting books by their ISBN.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

The Book Management System is an application tailored for libraries, bookstores, or individuals looking to manage a collection of books efficiently. It leverages a file-based database to store book information, ensuring data persistence and ease of access.

## Features

- **Book Listing**: Display a list of all books in the inventory.
- **Add New Book**: Introduce new books to the system with title, author, and ISBN details.
- **Remove Book**: Eliminate books from the inventory using their ISBN.
- **Search Functionality**: Locate books by title, author, or ISBN.
- **Sorting**: Arrange the book list by ISBN for improved navigation.
- **Data Persistence**: Book data is securely stored in a file, maintaining changes across sessions.

## Getting Started

To start using the Book Management System, follow the steps below to set up the application on your local machine.

### Prerequisites

Ensure you have Ruby installed on your system. You can download it from the official website: [https://www.ruby-lang.org/en/downloads/](https://www.ruby-lang.org/en/downloads/)

### Installation

1. Clone the repository to your local machine:

```bash
git clone https://github.com/MohamedAliEsmaill/ITI_ruby_course.git
```

2. Navigate to the project directory:

```bash
cd ITI_ruby_course/day-1
```

3. Run the application:

```bash
ruby main.rb
```

## Usage

The system interacts with a `books.txt` file, which acts as the database. Each line in the file corresponds to a book, with the title, author, and ISBN separated by a delimiter (e.g., '|').

To utilize the system, you can:

- List all books by selecting option '1' from the main menu.
- Add a new book by selecting option '2' from the main menu and providing the necessary details.
- Remove a book by its ISBN using option '3' from the main menu.
- Search for books by title, author, or ISBN with option '4' from the main menu.
- Sort the book inventory by ISBN using the `sort_books` method.




**Happy Reading!**