class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :like, :destroy]
    def index
        # byebug

        # @posts = Post.order('created_at DESC')
        @posts = current_user.posts.order('created_at DESC')

        
    end
    def show
        
        # @posts = current_user.posts.order('created_at DESC')

    end
    def new
       
        @post = Post.new
        
    end
    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            
            redirect_to root_path
        else
            render :new
        end
    end
    def edit
    end
    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to @post
        
        else
            render :edit
        end
    end
    def like
        Like.create(user_id: current_user.id, post_id: @post.id)
        redirect_to root_path(@post)
    end
    def destroy_like
        if Like.destroy(params[:id])
          redirect_to root_path
        end
    end
    def destroy
        
        # if current_user.id == Post.find(post_id).user.find(user_id)
        #     byebug
        #     @post.destroy
        # end
        # @post=Post.find(params[:id])
        # @post.likes.destroy_all
        # @post.comments.destroy(@post.id)
        # redirect_to root_path
        if @post.likes.present? || @post.comments.present?
            @post.likes.destroy_all
            @post.comments.destroy_all
            redirect_to root_path        
        else
            @post.destroy
            redirect_to root_path
        end

    end
    
    
    private
    def post_params
        params.require(:post).permit(:title, :body, :image)
    end
    def set_post
        @post = Post.find(params[:id])
        # @post = current_user.posts
        # @posts = current_user.posts.find(params[:id])
    end
end
