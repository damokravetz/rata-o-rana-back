class AddWikiIdAndImagesToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :wiki_id, :string, null: false
    add_column :profiles, :image_urls, :jsonb, default: []
    add_index :profiles, :wiki_id, unique: true
  end
end
