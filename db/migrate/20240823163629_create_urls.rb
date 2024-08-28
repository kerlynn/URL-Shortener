class CreateUrls < ActiveRecord::Migration[7.1]
  def change
    create_table :urls do |t|
      t.string :target_url
      t.string :short_url
      t.string :title
      t.integer :clicks_count

      t.timestamps
    end
  end
end
