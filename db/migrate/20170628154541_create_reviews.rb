class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :author
      t.integer :rating
      t.string :content

      t.timestamps
    end
  end
end
