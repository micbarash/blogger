class ArticlesController < ApplicationController
	include ArticlesHelper

	def index #Displays the list of articles
		@articles = Article.all
	end

	def show #Displays an individiaul article
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article_id 
	end

	def new #Opens the 'submit new article' form
		@article = Article.new
	end

	def create #Submits and creates new article
  		@article = Article.new(article_params)
  		@article.save

  		flash.notice = "Article '#{@article.title}' created!"

  		redirect_to article_path(@article)
	end

	def destroy #Deletes article and directs to index
		@article = Article.find(params[:id])
		@article.destroy

		flash.notice = "Article '#{@article.title}' deleted!"

		redirect_to articles_path
	end

	def edit #Opens the 'edit article' form
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' updated!"

		redirect_to article_path(@article)
	end
end
