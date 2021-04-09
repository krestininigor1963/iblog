class CommentsController < ApplicationController
	#http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
	before_action :logged_in_user, only: [:create, :edit, :update, :destroy]
	#before_action :currentuser, only: [:create, :edit, :update, :destroy]

	
	def new
   #       @article = Article.find(params[:article_id])
		 # @comment = @article.comments.build
		 # #byebug
		 # redirect_to article_path(@article)
		 # #redirect_to new_path(@article)
	end

	
	def create
		#byebug
		# @article = Article.find(params[:article_id])
     	#@comment = @article.comments.create(comment_params)
		# if @comment.save
		#    flash[:success] = "comment added !"
		#    redirect_to article_path(@article)
		# else
		#    flash[:danger] = "invalid commenter = #{comment_params[:commenter]}, body = #{comment_params[:body]}!"
		#    redirect_to article_path(@article)
		   
		# end

		 @article = Article.find(params[:article_id])
		 @comment = @article.comments.build(comment_params)
		 @comment.user_id = @current_user.id
		 #byebug
		 if @comment.save
		 	flash[:success] = "comment added !"
		 	redirect_to article_path(@article)
		 	#byebug
		 else
		 	#byebug
		 	 flash[:danger] = "invalid commenter #{comment_params[:commenter]}, body #{comment_params[:body]}!"
		 	 redirect_to article_path(@article)
		 end	
		
			
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	def edit
		#byebug
		@comment = Comment.find(params[:article_id]) # article_id - это id - commenta
		redirect_to article_path(:comment_id => @comment.id)
		#redirect_to article_path(:id => @comment.article_id, :comment_id => @comment.id)

		#redirect_to article_path(params[:article_id])
		#redirect_to article_path(params[:article_id], params[:comment_id])
		#redirect_to article_path(@comment.article_id, @comment.id)
		#redirect_to article_path(params: { article_id: params[:article_id], comment_id: params[:id] })
		#redirect_to edit_article_comment_path(params[:article_id], params[:id])
		#redirect_to comment_path(comment_params)

	end

	def update
		#byebug
	  	@comment = Comment.find(params[:id])
	  	@article = Article.find(@comment.article_id)
	  	#byebug
	  	if @comment.update(comment_params)
	  		#@params[:session][:comment_id] = @comment.id
	  		#byebug
	  		#format.html {redirect_to article_path(@comment.article_id)}
	  		
	  		#redirect_to article_path(@comment.article_id)


	  		#redirect_to article_path(:id => @comment.article_id, :comment_id => @comment.id)
	  		redirect_to article_path(@article)


	  		#redirect_to article_path(@comment.article_id), params: { comment: { comment_id: @comment.id } }
	  		#redirect_to @article, :article_id => @article.id, :comment_id => @comment.id
	  	else
	  		render :edit
	  	end	
  	end

    def show
  	  @comment = Comment.find(params[:id])
  end

private 

	def comment_params
		params.require(:comment).permit(:commenter, :body, :status)
		
	end	
end

