class CreateGiftees < ActiveRecord::Migration[5.1]
  def change
    create_table :giftees do |t|
      t.string :name
      t.string :gift
      t.integer :user_id
  end
end

end
