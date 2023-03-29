class UsersController < ApplicationController
  before_action :set_user, only: [:suspend, :unsuspend]
  def index
    @users = User.all

  end
  def show
    if params[:search]==nil
      @user=User.find_by(user_name: params[:id])
    else
      @user=User.find_by(user_name: params[:search])
    end
  end
  def suspend
    
    @user.update(suspended:true)
    redirect_to root_path, notice: 'user suspended'
  end
  def unsuspend
    
    @user.update(suspended:false)
    redirect_to root_path, notice: 'user unsuspended'
  end
  private
  def set_user
    @user= User.find(params[:id])
  end

end
