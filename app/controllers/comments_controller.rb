class CommentsController < ApplicationController

	# Basic HTTP authentication
	http_basic_authenticate_with name: "pedrosantos", password: "1234", only: [:destroy]

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		redirect_to post_path(@post)
	end

	def destroy
		# Get the post
		@post = Post.find(params[:post_id])
		# Get the comment
		@comment = @post.comments.find(params[:id])
		# Destroy the comment
		@comment.destroy
		#Redirect to the post view
		redirect_to post_path(@post)
	end

	private def comment_params
		params.require(:comment).permit(:username, :body)
	end
end
