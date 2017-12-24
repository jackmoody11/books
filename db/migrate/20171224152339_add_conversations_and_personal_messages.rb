class AddConversationsAndPersonalMessages < ActiveRecord::Migration[5.1]
  def change
    create_table "conversations", force: :cascade do |t|
      t.integer "author_id"
      t.integer "receiver_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["author_id", "receiver_id"], name: "index_conversations_on_author_id_and_receiver_id", unique: true
      t.index ["author_id"], name: "index_conversations_on_author_id"
      t.index ["receiver_id"], name: "index_conversations_on_receiver_id"
    end


      create_table "personal_messages", force: :cascade do |t|
        t.text "body"
        t.bigint "conversation_id"
        t.bigint "user_id"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.index ["conversation_id"], name: "index_personal_messages_on_conversation_id"
        t.index ["user_id"], name: "index_personal_messages_on_user_id"
      end
      
  end
end
