class ArticlesController < ApplicationController
 	#load_and_authorize_resource
 	before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
 	#load_and_authorize_resource
 	#http_basic_authenticate_with name: "q", password: "q", except: [:index, :show]

	def index
		@articles = Article.all
	end

	def show
		puts "=============="
    	#puts can? :crete, Article
    	puts "=============="
		#authorize! :read, @article
		@article = Article.find(params[:id])
	end

	def new
		#authorize! :new, @article
		@article = Article.new
	end

	def create
		
		@article = Article.new(article_params)
		@article.user_id = current_user.id
	   #@article = Article.new(params.require(:article).permit(:title, :text))
		
		if @article.save
			 puts "Se guardó bien!"
			redirect_to @article
		else
			 
			 #puts article.errors.full_messages.join(", ")	
			render 	'new'
		end
	end 

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	private
	
	def article_params
	params.require(:article).permit(:title, :text)
	end
end
