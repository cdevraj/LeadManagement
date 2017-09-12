class CreateEmailTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :email_templates do |t|
      t.integer :user_id
      t.string :subject
      t.text :content
      t.timestamps
    end
  end
end
