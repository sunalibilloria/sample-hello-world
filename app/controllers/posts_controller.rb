class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
    def index
        @posts = Post.all
        if user_signed_in?
          @current_user_id = current_user.id
            respond_to do |format|
          format.js {render layout: false}
          format.html { render 'index'}
            end
        else 
          
          render :index, status: :unprocessable_entity
         
        end
      end
      
    
      def show
        @post = Post.find(params[:id])
        
      end
      def current_user_id
        
        @posts = Post.where(user_id:  current_user.id)
        puts " 3333 #{@posts}"
      end
      def rhythm
        @posts = Post.all
        @current_user_id = current_user.id
      end
      def public
        @posts = Post.all
        @current_user_id = current_user.id
      end
      def private
        @posts = Post.all
        @current_user_id = current_user.id
      
      end
      def new
        @post = Post.new
      end
    
      def create
        @post = Post.new(post_params)
    
        if @post.save
          redirect_to @post
        else
            render :new, status: :unprocessable_entity
        end
      end
    
      def edit
        @post = Post.find(params[:id])
      end
      
      def update
        @post = Post.find(params[:id])
    
        if @post.update(post_params)
          redirect_to @post
        else
            render :edit, status: :unprocessable_entity
        end
      end
    
      def destroy
        @post = Post.find(params[:id])
        @post.destroy
    
        redirect_to root_path, status: :see_other
      end
     
      private
        def post_params
            params[:post].merge!(:user_id => current_user.id.to_s)
          params.require(:post).permit(:title, :description, :status, :user_id )
        end
        
      
end
