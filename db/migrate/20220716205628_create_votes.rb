class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.integer :category, null: false
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
