class CreateTvs < ActiveRecord::Migration
  def change
    create_table :tvs do |t|
      t.string :title
      t.text :story

      t.timestamps
    end
  end
end
