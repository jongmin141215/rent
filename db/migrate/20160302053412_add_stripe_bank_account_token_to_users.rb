class AddStripeBankAccountTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_bank_account_token, :text
  end
end
