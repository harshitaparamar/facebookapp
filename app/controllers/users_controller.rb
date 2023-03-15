class UsersController < ApplicationController
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

end
