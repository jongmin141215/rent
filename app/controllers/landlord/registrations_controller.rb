class Landlord::RegistrationsController < Devise::RegistrationsController
  def create
    # Stripe.api_key = PLATFORM_SECRET_KEY
    Stripe::Account.create(
      {
        :country => "US",
        :managed => true
      }
    )
    super
  end
  private

  def sign_up_params
    params.require(:landlord).permit(:first_name, :last_name, :email, :password, :password_confirmation, :business_type, :date_of_birth, :ssn, :address)
  end

  def account_update_params
    params.require(:landlord).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end
