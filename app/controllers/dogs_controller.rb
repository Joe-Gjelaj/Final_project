class DogsController < ApplicationController
	def index
		@dogs = Dog.all
	end

	def show
		@dog = Dog.find(params[:dog_id])
		@comment = Comment.new
	end
end
