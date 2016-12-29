class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :only_current_user
  
  # GET to /user/:user_id/profile/new
  def new
    # Render blank profile details form
    @profile = Profile.new
  end
  
  # POST request to /users/:user_id/profile
  def create
    # Get correct user
    @user = User.find(params[:user_id])
    
    # Create profile linked to this specific user
    @profile = @user.build_profile(profile_params)
    
    if @profile.save
      flash[:success] = "Profile updated!"
      
      # Redirect user to their profile page
      redirect_to user_path(id: params[:user_id])
    else
      render action :new
    end
  end
  
  # GET to /users/:user_id/profile/edit
  def edit
    # Get correct user
    @user = User.find(params[:user_id])
    
    # Get profile linked to this specific user
    @profile = @user.profile
  end
  
  # PATCH to /users/:user_id/profile
  def update
    # Get correct user
    @user = User.find(params[:user_id])
    
    # Get profile linked to this specific user
    @profile = @user.profile
    
    # Mass assign edited profile attributes and save (update)
    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile updated!"
      
      # Redirect user to their profile page
      redirect_to user_path(id: params[:user_id])
    else
      render action :new
    end
  end
  
  private
    # To collect data from form, use strong parameters
    # Whitelist the form fields
    def profile_params
      params.require(:profile).permit(:first_name,
                                      :last_name,
                                      :avatar,
                                      :job_title,
                                      :phone_number,
                                      :contact_email,
                                      :description
      )
    end
    
    # 
    def only_current_user
      # Get correct user
      @user = User.find(params[:user_id])
      
      # Redirect other users
      redirect_to root_url unless @user == current_user
    end
end