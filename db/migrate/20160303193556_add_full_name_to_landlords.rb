class AddFullNameToLandlords < ActiveRecord::Migration
  def change
    add_column :landlords, :first_name, :text
    add_column :landlords, :last_name, :text
  end
end
