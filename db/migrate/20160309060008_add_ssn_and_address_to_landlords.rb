class AddSsnAndAddressToLandlords < ActiveRecord::Migration
  def change
    add_column :landlords, :ssn, :text
    add_column :landlords, :address, :text
  end
end
