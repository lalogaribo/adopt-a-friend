class AddPasswordDigestToShelter < ActiveRecord::Migration[6.0]
  def change
    add_column :shelters, :password_digest, :string
    add_column :shelters, :email, :string
  end
end
