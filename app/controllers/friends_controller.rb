class FriendsController < ApplicationController
  before_action :set_friend, only: %i[ show edit update destroy ]
  def index
    @friend = Friend.all
  end

  def new
    @friend = Friend.new  
  end
  
  def show

  end

  def edit

  end

  def create
     @friend = Friend.new(friend_params)

     if @friend.save
       redirect_to @friend, notice: "Friend was successfully created."
     else
       render :new, status: :unprocessable_entity
     end
  end

  def update
     @friend = Friend.find(params[:id])
     
     if @friend.update(friend_params)
        redirect_to @friend, notice: "Friend was successfully updated." 
      else
         render :edit, status: :unprocessable_entity 
      end
  end

  def destroy
      @friend.destroy
       redirect_to root_path, notice: "Friend was successfully destroyed." 
       head :no_content 
  end

  private

  def set_friend
      @friend = Friend.find(params[:id])
  end

  def friend_params
      params.require(:friend).permit(:first_name, :last_name, :email, :phone, :address)
  end
end
