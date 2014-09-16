class ArticlesController < ApplicationController

	#SECURITY !!!
	http_basic_authenticate_with name: "admin", password: "1234", except: [:index, :show]

	#instance of a new article for the new form
	def new
		@article = Article.new
	end
	
	#create article
	def create
  		@article = Article.new(article_params)
  		if @article.save
    			redirect_to @article
  		else
    			render 'new'
  	end
	end
	 
	#show article
	def show
		@article = Article.find(params[:id])
	end
	
	#index of articles
	def index
		@articles = Article.all
	end

	#edit article
	def edit
  		@article = Article.find(params[:id])
	end

	#update the modification of an article
	def update
  		@article = Article.find(params[:id])
		if @article.update(article_params)
    			redirect_to @article
  		else
    			render 'edit'
  		end
	end

	#delete article
	def destroy
  		@article = Article.find(params[:id])
  		@article.destroy
 		redirect_to articles_path
	end
	
	#
	#PRIVATE FUNCTIONS
	#
	private
	
	#Check params for article during creation (see def creat)
  	def article_params
    		params.require(:article).permit(:title, :text)
  	end
end
