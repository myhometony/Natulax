class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :end_user_id
      t.integer :post_image_id

      t.timestamps
    end
  end
end
