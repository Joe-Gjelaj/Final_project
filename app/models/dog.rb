require 'nokogiri'

require 'open-uri'


class Dog < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	def self.retrieve_new_dogs(num)
		url = "http://www.dogchannel.com/dog-breeds/page/#{num}/dog-breeds-starting-with-letter-all.aspx"
		data = Nokogiri::HTML(open(url))
		dogs = data.css(".searchResultItem")
		dogs.each do |dog|
			name = dog.css('h4').css("span").text
			info = dog.css("p").css("span").text
			image = dog.css(".searchResultItemImg").css("img").attr('src').value
			p name
			p info
			p image
			Dog.create(breed: name, description: info, image_url: image)
		end
	end

	def self.retrieve_all_dogs
		14.times do |num|
			num += 1
			Dog.retrieve_new_dogs(num)
		end
	end



end