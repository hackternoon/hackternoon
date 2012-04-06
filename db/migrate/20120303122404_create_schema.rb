class CreateSchema < ActiveRecord::Migration
  def change

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "twitter_handle"
    t.string   "location"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "dscrptn"
    t.integer  "user_id"
    t.string   "github_url"
    t.string   "tech_tag1"
    t.string   "tech_tag2"
    t.string   "tech_tag3"
    t.string   "biz_tag1"
    t.string   "biz_tag2"
    t.string   "biz_tag3"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "projects", ["user_id"], :name => "projects_n1"

  create_table "invitations", :force => true do |t|
    t.string   "msg"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "invitations", ["user_id"], :name => "invitations_n1"
  add_index "invitations", ["project_id"], :name => "invitations_n2"

  create_table "photo_urls", :force => true do |t|
    t.string   "the_url"
    t.integer  "user_id"
    t.boolean  "profile_photo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "photo_urls", ["user_id"], :name => "photo_urls_n1"

  create_table "pitches", :force => true do |t|
    t.string   "msg"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pitches", ["user_id"], :name => "pitches_n1"
  add_index "pitches", ["project_id"], :name => "pitches_n2"

  end # def change

end # class
