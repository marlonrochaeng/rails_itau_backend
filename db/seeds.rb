# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

500.times do |i|
  random_time = rand(Time.new(2020, 1, 1)..Time.now)
  random_datetime = random_time.to_datetime

  Transaction.create!(valor: rand(0.0..1000.0), dataHora: random_datetime)
end
