class Space < ApplicationRecord


	require "net/http"
	require "json"


	def self.search(lat,lng)

		uri = URI("https://maps.googleapis.com/maps/api/geocode/json?latlng="+lat+","+lng+"&key=AIzaSyCYca2a6AWCOLReuJ4AqN8EYGG9dAKcYL8")

		response = Net::HTTP.get(uri)

		json = JSON.parse(response)

	end


	belongs_to :user



	
end
