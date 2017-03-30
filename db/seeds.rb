# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'


50.times do
  User.create(email: Faker::Internet.email,
              password: 123456)
end

users = User.all

users.each do |user|

	lat = rand(39.928494..39.937511)

	lng = rand(-75.181917..-75.171231)

	stat = rand(0..2)

	space = Space.new(:user_id=>user.id, :latitude=>lat, :longitude=>lng, :status=>stat, :claimed=>false)

	space.save


end
