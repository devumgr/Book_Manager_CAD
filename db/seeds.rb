# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Generate books for a subset of users.
users = User.order(:created_at).take(6)

50.times do
  title = Faker::Book.title
  author = Faker::Book.author
  genre = %w[Fiction Non-Fiction Mystery Sci-Fi Fantasy].sample
  status = %w[Available Checked-Out Reserved].sample
  notes = Faker::Lorem.sentence(word_count: 10)

  users.each do |user|
    user.books.create!(
      title: title,
      author: author,
      genre: genre,
      status: status,
      notes: notes
    )
  end
end

puts "Sample books created successfully!"
