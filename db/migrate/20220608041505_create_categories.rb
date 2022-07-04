class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :post_image_id, null:false

      t.timestamps
    end
  end
end
