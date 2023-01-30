class CreateData < ActiveRecord::Migration[7.0]
  def change
    # Author.create(first_name: "Kishan", last_name: "Lad", date_of_birth: "2001-08-16", email: "kishan09@gmail.com")
    # Author.create(first_name: "Naruto", last_name: "Uzumaki", date_of_birth: "2005-02-10", email: "uzumakin99@gmail.com")
    # Author.create(first_name: "Kakashi", last_name: "Hatake", date_of_birth: "1990-12-20", email: "kakashi37@gmail.com")

    Book.create(name: "The Secret", price: 500, author_id: 1)
    Book.create(name: "Art of War", price: 300, author_id: 3)
    Book.create(name: "Rich Man", price: 800, author_id: 2)
    Book.create(name: "The fly", price: 40, author_id: 1)
    
  end
end
