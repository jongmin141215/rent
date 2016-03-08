class AddDateOfBirthToLandlords < ActiveRecord::Migration
  def change
    add_column :landlords, :date_of_birth, :text
  end
end
