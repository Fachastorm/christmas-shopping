class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    t.string :name
    t.string :password
    t.string :password_digest
  end
end
