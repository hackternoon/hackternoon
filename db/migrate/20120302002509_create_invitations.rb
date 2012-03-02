class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :msg

      t.timestamps
    end
  end
end
