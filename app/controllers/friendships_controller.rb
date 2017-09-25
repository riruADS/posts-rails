class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = 'Friend requested.'
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = 'Unable to request friendship.'
      redirect_back(fallback_location: root_path)
    end
  end
  
  def update
    @friendship = Friendship.find_by(user_id: params[:id])
    @friendship.update(accepted: true)
    if @friendship.save
      redirect_to root_url, notice: 'Successfully confirmed friend!'
    else
      redirect_to root_url, notice: 'Sorry! Could not confirm friend!'
    end
  end
  
  def destroy
    @friendship = Friendship.find_by(user_id: params[:id])
    @friendship.destroy
    flash[:notice] = 'Removed friendship.'
    redirect_back(fallback_location: root_path)
  end
end
