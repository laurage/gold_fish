class AddFirstNameLastNamePicturePhoneNumberDescriptionAddressToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :picture, :string
    add_column :users, :description, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
  end
end

