class AddPersonalDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :op_sys, :string
    add_column :users, :code_experience, :string, :length => 255
    add_column :users, :minecraft_experience, :integer
    add_column :users, :mobile_num, :string
    add_column :users, :parent_contact, :string

  end
end
