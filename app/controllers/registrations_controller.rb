class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    if session[:shotgun_id]
      @shotgun = Shotgun.find(session[:shotgun_id])
      @shotgun.user = @user
      @shotgun.save
    end
  end

  def update
    super
  end
end
