class DogsController < ApplicationController
	def index
		@dog = Dog.find(params[:dog_id])
	end

	def show
		@dog = Dog.find(params[:dog_id])
		@comment = Comment.new
	end
end
