class CommentsController < ApplicationController
	#http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

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
  #   	@comment = @article.comments.create(comment_params)
		# if @comment.save
		#    flash[:success] = "comment added !"
		#    redirect_to article_path(@article)
		# else
		#    flash[:danger] = "invalid commenter = #{comment_params[:commenter]}, body = #{comment_params[:body]}!"
		#    redirect_to article_path(@article)
		   
		# end

		 @article = Article.find(params[:article_id])
		 @comment = @article.comments.build(comment_params)
		 if @comment.save
		 	flash[:success] = "comment added!"
		 	redirect_to article_path(@article)
		 else
		 	flash[:danger] = "invalid commenter = #{comment_params[:commenter]}, body = #{comment_params[:body]}!"
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
		@comment = Comment.find(params[:id]) # article_id - это id - commenta
		redirect_to article_path(params[:article_id])
		#redirect_to article_path(params[:article_id], params[:comment_id])
		#redirect_to article_path(@comment)
		#redirect_to article_path(params: { article_id: params[:article_id], comment_id: params[:id] })

	end

private 

	def comment_params
		params.require(:comment).permit(:commenter, :body, :status)
		
	end	
end
