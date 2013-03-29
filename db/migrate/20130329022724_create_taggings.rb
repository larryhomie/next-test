class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :genre
      t.belongs_to :tv

      t.timestamps
    end
    add_index :taggings, :genre_id
    add_index :taggings, :tv_id
  end
end
