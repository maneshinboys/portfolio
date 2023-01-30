class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @anime  = Anime.new
    @animes = Anime.all
    @animes = @user.animes
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private
   
   def user_params
     params.require(:user).permit(:name, :profile_image, :introduction)
   end
   def book_params
       params.require(:anime).permit(:title, :body, :user_id)
   end
  
end
