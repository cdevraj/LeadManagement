class CreateUserLeadGenerators < ActiveRecord::Migration[5.1]
  def change
    create_table :user_lead_generators do |t|
      t.integer :user_id
      t.integer :lead_generator_id

      t.timestamps
    end
  end
end
