class DogsController < ApplicationController
	def index
		@dogs = Dog.paginate(:page => params[:page], per_page:18)
	end

	def show
		@dog = Dog.find(params[:dog_id])
		@comment = Comment.new
	end
end
