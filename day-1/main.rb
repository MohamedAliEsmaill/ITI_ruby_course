class Book
  attr_accessor :title, :author, :isbn

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def self.all_books
    File.readlines("books.txt").map do |line|
      title, author, isbn = line.chomp.split('|')
      Book.new(title, author, isbn)
    end
  end

  def self.find_book_by_isbn(isbn)
    all_books.find { |book| book.isbn == isbn }
  end

  def self.add_book(new_book)
    books = all_books
    existing_book = find_book_by_isbn(new_book.isbn)
    if existing_book
      existing_book.title = new_book.title
      existing_book.author = new_book.author
    else
      books << new_book
    end
    File.open("books.txt", "w") do |file|
      books.each { |book| file.puts("#{book.title}|#{book.author}|#{book.isbn}") }
    end
  end

  def self.remove_book(isbn)
    books = all_books.reject { |book| book.isbn == isbn }
    File.open("books.txt", "w") do |file|
      books.each { |book| file.puts("#{book.title}|#{book.author}|#{book.isbn}") }
    end
  end

  def self.list_books
    all_books.each { |book| puts "Title: #{book.title}, Author: #{book.author}, ISBN: #{book.isbn}" }
  end

  def self.sort_books
    sorted_books = all_books.sort_by { |book| book.isbn }
    sorted_books.each { |book| puts "ISBN: #{book.isbn}, Title: #{book.title}, Author: #{book.author}" }
  end

  def self.search_books(criteria, type)
    results = all_books.select do |book|
      case type
      when 'title'
        book.title.downcase.include?(criteria.downcase)
      when 'author'
        book.author.downcase.include?(criteria.downcase)
      when 'isbn'
        book.isbn == criteria
      end
    end

    if results.empty?
      puts "No books found matching the criteria: #{criteria}"
    else
      results.each { |book| puts "Found: Title: #{book.title}, Author: #{book.author}, ISBN: #{book.isbn}" }
    end
  end
end

def main_menu
  loop do
    puts "\nSelect option:"
    puts "1- List books"
    puts "2- Add new book"
    puts "3- Remove book by ISBN"
    puts "4- Search book"
    puts "5- Exit"
    print "Enter your choice: "

    
    choice = gets.chomp
    case choice
    when '1'
      Book.list_books
    when '2'
      print "Enter title: "
      title = gets.chomp
      print "Enter author: "
      author = gets.chomp
      print "Enter ISBN: "
      isbn = gets.chomp
      Book.add_book(Book.new(title, author, isbn))
      puts "Book added successfully."
    when '3'
      print "Enter ISBN to remove: "
      isbn = gets.chomp
      Book.remove_book(isbn)
      puts "Book removed successfully."
    when '4'
      print "Search by (title/author/isbn): "
      type = gets.chomp
      print "Enter search criteria: "
      criteria = gets.chomp
      Book.search_books(criteria, type)
    when '5'
      puts "Exiting..."
      break
    else
      puts "Invalid choice. Please try again."
    end
  end
end

main_menu