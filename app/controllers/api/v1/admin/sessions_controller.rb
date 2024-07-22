class Api::V1::Admin::SessionsController < Devise::SessionsController
  respond_to :json

  before_action :skip_session_storage

  def create
  admin = Admin.find_by(email: params[:admin][:email])
  
  if admin&.valid_password?(params[:admin][:password])
    token = JWT.encode({ admin_id: admin.id }, Rails.application.credentials.devise[:jwt_secret_key], 'HS256')
    render json: { message: 'Logged in successfully.', token: token, admin: admin }, status: :ok
  else
    render json: { error: 'Invalid Email or Password' }, status: :unauthorized
  end
end

  def destroy
    head :no_content
  end

  private

  def skip_session_storage
    request.session_options[:skip] = true
  end

  def sign_in_params
    params.require(:admin).permit(:email, :password)
  end
end
