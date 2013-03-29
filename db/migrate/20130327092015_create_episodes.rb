class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :title
      t.integer :season
      t.references :tv

      t.timestamps
    end
    add_index :episodes, :tv_id
  end
end
