class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :msg
      t.integer :project_id
      t.integer :sender_id
      t.integer :user_id

      t.timestamps
    end
  end
end
