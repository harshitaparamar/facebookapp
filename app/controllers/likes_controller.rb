class LikesController < ApplicationController
    def like
        @post = Post.find(params[:id])

        
        Like.create(user_id: current_user.id, post_id: @post.id)
        redirect_to root_path(@post)
    end
    def destroy_like
        # @like=post.likes.find_by(user_id: current_user.id, post: post.id)
        # @like.destroy
        if Like.destroy(params[:id])
          redirect_to root_path
         end
    end

    # def new
    #     byebug
    #     @like = Like.new(like_params)
    # end

    # def create
        
    #     @like.create(user_id: current_user.id, post_id: @post.id)
    #     redirect_to root_path(@post)
    # end
   
#   def create
#     @user = current_user.id
#     @post = params[:post_id]
#     likes = {user_id: @user, post_id: @post}
#     @like = Like.new(likes)

#     @like.save!
#     if @like.save
#       redirect_to root_path(@user)
#     end
#   end
    # def destroy
    #     byebug
    #     if Like.destroy(params[:id])
    #       redirect_to root_path
    #     end
    # end
    # def create
    #     # prevent from liking for other users
    #     params[:like][:user_id] = current_user.id
    #     @like = Like.new(like_params)
    #     if @like.save
    #       flash[:success] = 'Thanks for liking!'
    #     else
    #       flash[:alert] = @like.errors.full_messages.join(', ')
    #     end
    # end
    private
    # def like_params
    #     params.require(:like).permit( :user_id, :post_id)
    # end
    def find_post
        @post = Like.find(params[:post_id])
    end
    def find_like
        @like = @post.likes.find(params[:id])
    end
    def already_liked?
        Like.where(user_id: current_user.id, post_id:params[:post_id]).exists?
    end
end
