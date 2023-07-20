class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :name
      t.string :email
      t.text :biography
      t.string :phoneNumber
      t.string :address
      t.text :outerLink
      t.string :role
      t.text :avatar
      t.text :resume

      t.timestamps
    end
  end
end
