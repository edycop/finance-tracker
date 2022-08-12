class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end

  def my_portfolio
    @user = current_user
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @followed_friends = current_user.friends
  end

  def search
    if params[:friend].present?
      @friends = User.search(params[:friend])
      @friends = current_user.except_current_user(@friends)
      if @friends
        @followed_friends = current_user.friends
        render 'users/my_friends', locals: { friends: @friends, followed_friends: @followed_friends }
      else
        flash.now[:alert] = "Couldn't find  user"
        @followed_friends = current_user.friends
        render 'users/my_friends', locals: { friends: nil, followed_friends: @followed_friends }
      end
    else
      flash.now[:alert] = 'Please enter a friend name or email to search'
      @followed_friends = current_user.friends
      render 'users/my_friends', locals: { friends: nil, followed_friends: nil }
    end
  end
end
