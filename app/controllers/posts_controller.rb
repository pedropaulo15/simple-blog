class PostsController < ApplicationController

	# Basic HTTP authentication
	http_basic_authenticate_with name: "pedrosantos", password: "1234", except: [:index, :show]

	def index
		# it gets all the posts from the model/DB
		@posts = Post.all
	end

	# Form
	def new
		@post = Post.new # It executes the insertion on the table for the new post
	end 

	def show
		# Passing the id from the URL to get that single post
		@post = Post.find(params[:id]) 
		
	end

	# it receives the form data
	def create
		# It prints the object from the form
		#render plain: params[:post].inspect

		# Creating a new model object and pass the data from the form to add to the model/db
		# post_params will get the data from the method below
		@post = Post.new(post_params)

		# in here, if the post are saved, it will redirect the user to the show view
		if (@post.save)
			redirect_to @post # It loads the show view
		else
			# Re-render the new view, as the data entered was not valid
			render 'new'
		end

	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		# in here, if the post are saved, it will redirect the user to the show view
		if (@post.update(post_params))
			redirect_to @post # It loads the show view
		else
			# Re-render the new view, as the data entered was not valid
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	# Seeting the permitions to get the title and body from the form
	private def post_params
		params.require(:post).permit(:title, :body)
	end

end
