# Bank Transaction Processing System

This repository contains a Ruby-based system for processing bank transactions. It includes classes for logging, user management, transaction handling, and a specific bank implementation (CBABank). The system is designed to handle multiple transactions, log various types of messages, and provide feedback on the success or failure of each transaction.

## Features

- **Singleton Logger**: A centralized logging system that ensures all logs are written to a single file. The logger includes methods for logging info, warnings, and errors.
- **User Management**: A `User` class that represents bank customers with a name and balance.
- **Transaction Handling**: A `Transaction` class that encapsulates a transaction between a user and a value.
- **Bank Processing**: A `Bank` class with an abstract method for processing transactions. A concrete implementation, `CBABank`, is provided to handle transactions for its users.
- **Error Handling**: The system includes robust error handling to catch and log any issues that occur during transaction processing.
- **Callback Mechanism**: A callback is used to notify the system of the outcome of each transaction, which can be used to trigger further actions such as updating a user interface or sending notifications.

## Usage

1. **Initialize Users**: Create instances of the `User` class to represent the bank's customers.
2. **Create Transactions**: Use the `Transaction` class to create transactions with a user and a value.
3. **Set Up Bank**: Initialize a `CBABank` instance with the list of users.
4. **Process Transactions**: Call the `process_transactions` method on the bank instance, passing in the list of transactions and a block for the callback.
5. **Monitor Logs**: Check the `app.logs` file for detailed logs of the transaction processing.

## Example

```ruby
users = [
  User.new("Ali", 200),
  User.new("Peter", 500),
  User.new("Manda", 100)
]

outside_bank_users = [
  User.new("Menna", 400),
]

transactions = [
  Transaction.new(users[0], -20),
  Transaction.new(users[0], -30),
  Transaction.new(users[0], -50),
  Transaction.new(users[0], -100),
  Transaction.new(users[0], -100),
  Transaction.new(outside_bank_users[0], -100)
]

cbabank = CBABank.new(users)

cbabank.process_transactions(transactions) do |status|
  puts "Call endpoint for #{status == "success" ? "Success" : "Failure"}"
end
```

## Logging

The system uses a singleton logger to ensure that all logs are written to a single file (`app.logs`). The logger includes methods for logging info, warnings, and errors. The log file is automatically closed when the program exits.

## Error Handling

The `CBABank` class includes error handling to catch and log any issues that occur during transaction processing. If a transaction fails, an error message is logged, and the callback is notified of the failure.