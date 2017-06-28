class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :actors
      t.string :genre
      t.string :image

      t.timestamps
    end
  end
end
