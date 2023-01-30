class AnimesController < ApplicationController
  def index
    @anime = Anime.find(params[:id])
    @animes = Anime.all
    @user = current_user
  end

  def new
    @anime = Anime.new
  end
  
  def show
    @animes = Anime.all
    @anime = Anime.find(params[:id])
    @user = @anime.user
  end


  def create
    @animes = Anime.all
    @anime = current_user
    @anime = Anime.new(anime_params)
    @anime.user_id = @anime.id  
    if @anime.save
      flash[:notice] = "Successfully created."
      redirect_to anime_path(@anime)
    else
      render :index
    end
  end


  def edit
    @anime = Anime.find(params[:id])
    if @anime.user_id != current_user.id
      redirect_to animes_path
    end
  end
  
  def update
    @anime = Anime.find(params[:id])
    if @anime.update(anime_params)
    flash[:notice] = "Successfully updated."
    redirect_to anime_path(@anime)
    else
     render :edit
    end
  end

  def destroy
    @anime = Anime.find(params[:id])
    if @anime.destroy
     redirect_to animes_path
    end
  end
  
  private
  
    def correct_user 
      @anime = Anime.find(params[:id])
      redirect_to(animes_path) unless current_user?(@anime.user)
    end

    def current_user?(user)
      user == current_user
    end
  
    def anime_params
      params.require(:anime).permit(:title, :body, :user_id)
    end
    
    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
  
end
