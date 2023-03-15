class CommentsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :show_data, only: [:show]
    def index
        @comments = Comment.all
    end
    def show
      
      
    end    
    def new
        if params[:parent_id]==nil
          @post=Post.find(params[:post_id])
        else
          @post=Post.find(Comment.find(params[:parent_id]).post_id)
        end
        @comment = @post.comments.new(parent_id: params[:parent_id])
        
    end
    def create
      

      post_id = params[:post_id]
      user_id =Post.find(params[:post_id]).user_id
      @user=User.find(user_id)
     
      if params[:comment][:parent_id]==nil
        
        @comment=User.find(user_id).posts.find(post_id).comments.create(comment: params[:comment][:comment], user_id: current_user.id, post_id: params[:post_id])
       
      else
        
        @comment=User.find(user_id).posts.find(post_id).comments.find(params[:comment][:parent_id]).replies.create(user_id: user_id,post_id: params[:post_id],comment: params[:comment][:comment])
      end
      respond_to do |format|
        if @comment.save
          format.html { redirect_to "", notice: 'Comment was successfully created.' } 
        end
      end
    end
    def destroy
      # @post = Post.find(params[:id])
      # @post.destroy

      # redirect_to root_path
      # @post = Post.find(params[:id])
      # @post.destroy
      if @comment.parent_id.present?
        @comment.destroy

      else
        @comment.destroy_all
      end

      redirect_to root_path, status: :see_other
    end

    private
    def set_post
        @comment=Comment.find(params[:id])
    end
    
    
end
