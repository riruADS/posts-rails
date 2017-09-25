class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user_friends = current_user.friends
    @user_pending = current_user.pending
    
    ids = @user_friends.pluck(:id) +  @user_pending.pluck(:id) + current_user.id.to_s.split('')
    @users = User.where.not(id: ids)
  end
end
