# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

users = []

50.times do
  users << User.create(email: Faker::Internet.email,
              password: 123456)
end

users.each do |user|

	lat = rand(39.910090..39.958765)

	lng = rand(-75.177882..-75.150160)

	stat = rand(0..2)

	space = Space.new(:user_id=>user.id, :latitude=>lat, :longitude=>lng, :status=>stat, :claimed=>false)

	space.save


end
