class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true, null: false
      t.references :story, foreign_key: true, null: false
      t.string :state, null: false, default: 'active'

      t.timestamps
    end
  end
end
