class CreatePitches < ActiveRecord::Migration
  def change

  create_table "pitches", :force => true do |t|
    t.string   "msg"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  end # def change

end
