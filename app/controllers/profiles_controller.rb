class ProfilesController < ApplicationController
  # GET to /user/:user_id/profile/new
  def new
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
      redirect_to user_path(params[:user_id])
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
end