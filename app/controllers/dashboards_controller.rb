class DashboardsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :charge]
  def show
  end

  def pay
  end

  def create
    exchangeTokenResponse = Plaid.exchange_token(params[:public_token], params[:account_id])
    current_user.update(stripe_bank_account_token: exchangeTokenResponse.stripe_bank_account_token)
    user = Plaid.set_user(exchangeTokenResponse.access_token, ['auth'])
    user.get('auth')
    user.accounts.each { |account| print account.meta['name'] + "\n"}
    redirect_to dashboard_url
  end

  def charge
      # Amount in cents
    @amount = 500
    p 'hi'
    p current_user.stripe_bank_account_token
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => current_user.stripe_bank_account_token
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    redirect_to dashboard_url
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to dashboard_url
  end
end
