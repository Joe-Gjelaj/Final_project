class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(bio: params[:profile][:bio],
                           user_id: session[:user_id])
    if @profile.save
      flash[:notice] = "Your profile was saved"
    else
      flash[:alert] = "Your profile was not saved"
    end

    redirect_to ""
  end

  def show
    @profile = Profile.find(params[:id])
    @current_user = User.find(session[:user_id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update(params[:profile])
      flash[:notice] = "Profile was Updated"
    else
      flash[:alert] = "Profile was not Updated"
    end

    redirect_to ""
  end
end