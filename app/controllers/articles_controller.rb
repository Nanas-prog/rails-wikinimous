class ArticlesController < ApplicationController
  # before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
   @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
    # redirect to article_path(@article.id)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private

    # def set_article
    #   @article = Article.find(params[:id])
    # end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
