class CreateConversationUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :conversation_users do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :conversation, index: true, foreign_key: true, null: false
      t.index [:user_id, :conversation_id], unique: true

      t.timestamps
    end
  end
end
