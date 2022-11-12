# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "nokogiri"

puts "Cleaning DB"

Country.delete_all

puts "DB Cleaned"

url = "https://www.marca.com/futbol/mundial/palmares.html"
serialized_data = URI.open(url).read
doc = Nokogiri::HTML(serialized_data)
elements = doc.search('.bloque')


elements.each do |element|
 country = Country.new(
    name: element.search('.content').text.strip,
    year: element.search('.fecha').text.strip.to_i,
    address: element.search('.content').text.strip,
    image_url: element.search('img').attribute('src').value
  )
  country.save
  puts "#{country.name} was created"
end

puts "DB ready to be used"
