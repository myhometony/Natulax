class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.string :end_user_id, null: false
      t.string :title
      t.text :caption

      t.timestamps
    end
  end
end
