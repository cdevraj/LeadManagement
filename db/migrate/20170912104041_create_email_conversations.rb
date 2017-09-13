class CreateEmailConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :email_conversations do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :receiver_email
      t.string :subject
      t.text :content
      t.string :smtp
      t.boolean :is_sent
      t.datetime :sent_date
      t.string :receiver_type
      t.timestamps
    end
  end
end
