class CommentsController < ApplicationController
    before_action :find_commentable
     def index
      @comments = Comment.all 
     end
    def new
      @comment = Comment.new
    end

    def create
      @comment = @commentable.comments.new(comment_params)

      if @comment.save
        redirect_back(fallback_location: root_path)
      else
        redirect_to :back, notice: "Your comment wasn't posted!"
      end
    end
    def edit
      @comment = Comment.find(params[:id])
    end  
  
    private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
    end
end
