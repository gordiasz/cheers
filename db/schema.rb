# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100514192117) do

  create_table "coctails", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "recipe"
    t.binary   "photo"
  end

  create_table "coctails_ingredients", :id => false, :force => true do |t|
    t.integer "coctail_id",    :null => false
    t.integer "ingredient_id", :null => false
  end

  add_index "coctails_ingredients", ["coctail_id", "ingredient_id"], :name => "index_coctails_ingredients_on_coctail_id_and_ingredient_id", :unique => true

  create_table "comments", :force => true do |t|
    t.integer  "coctail_id"
    t.text     "body"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "coctail_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
