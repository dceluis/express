class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :conversation_user, index: true, foreign_key: true
      t.string :content, null: false

      t.timestamps
    end
  end
end
