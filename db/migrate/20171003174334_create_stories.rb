class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :type, null: false
      t.integer :events_count, default: 0

      t.timestamps
    end
  end
end
