class ArticlesController < ApplicationController
 #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
 before_action :logged_in_user, only: [:create, :edit, :update, :destroy]
 #before_action :currentuser, only: [:create, :edit, :update, :destroy]

  def index
  	@articles = Article.all
  end

  def show
    #byebug
  	@article = Article.find(params[:id])
    @comments = @article.comments
    #byebug
  end

  def new
  	@article = Article.new
  end

  def create
  	#@article = Article.new(article_params)
    @article = @current_user.articles.build(article_params)
    #byebug
  	if @article.save
      #byebug
  		redirect_to @article
  	else
  		render :new
  	end
  end

  def edit
  	@article = Article.find(params[:id]) # по умолчанию отрендерит на edit.html.erb
  end

  def destroy
  	@article = Article.find(params[:id])
  	@article.destroy
  	redirect_to root_path
  end

  def update
    #byebug
  	@article = Article.find(params[:id])
  	if @article.update(article_params)
  		redirect_to @article
  	else
  		render :edit
  	end	
  end





private

  def article_params

  	params.require(:article).permit(:title, :body, :status)
  end


end

