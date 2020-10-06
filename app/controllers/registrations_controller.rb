class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)
    resource.save
    render json: resource, status: :created
  end

  private
  def sign_up_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :phone_number)
  end
end