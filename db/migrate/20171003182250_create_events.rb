class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :story, foreign_key: true, null: false
      t.references :eventable, polymorphic: true

      t.timestamps
    end
  end
end
