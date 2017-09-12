class CreateEmailConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :email_conversations do |t|
      t.integer :sender_id
      t.integer :reciever_id
      t.string :reciever_email
      t.string :subject
      t.text :content
      t.string :smtp
      t.boolean :is_sent
      t.sent_date :datetime 
      t.timestamps
    end
  end
end
