class CommentsController < ApplicationController
	#http_basic_authenticate_with name: "q", password: "q", only: :destroy
	before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

	def create
	@article = Article.find(params[:article_id])
	@comment = @article.Comments.create(comment_params)
	redirect_to article_path(@article)
	end

	def destroy
		@article =Article.find(params[:article_id])
		@comment = @article.Comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private

	def comment_params
	  params.require(:comment).permit(:commenter, :body)
	end
end