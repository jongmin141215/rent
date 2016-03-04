class AddBusinessTypeToLandlords < ActiveRecord::Migration
  def change
    add_column :landlords, :business_type, :text
  end
end
