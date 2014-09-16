class CommentsController < ApplicationController
	
	#SECURITY !!!
	http_basic_authenticate_with name: "admin", password: "1234", only: :destroy

	#create a comment
	def create
    		@article = Article.find(params[:article_id])
    		@comment = @article.comments.create(comment_params)
    		redirect_to article_path(@article)
  	end
	
	#delete a comment
 	def destroy
    		@article = Article.find(params[:article_id])
    		@comment = @article.comments.find(params[:id])
    		@comment.destroy
    		redirect_to article_path(@article)
  	end

	#
	#PRIVATE FUNCTIONS
	#
  	private
    	
	#check parameters for creation
	def comment_params
      		params.require(:comment).permit(:commenter, :body)
    	end
end
