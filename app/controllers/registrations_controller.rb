class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:landlord).permit(:first_name, :last_name, :email, :password, :password_confirmation, :business_type, :date_of_birth, :ssn, :address)
  end

  def account_update_params
    params.require(:landlord).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end
