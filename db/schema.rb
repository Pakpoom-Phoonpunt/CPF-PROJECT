# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_11_061534) do

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password"
    t.string "role"
    t.json "detail"
    t.integer "factory_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["factory_id"], name: "index_accounts_on_factory_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.integer "factory_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["factory_id"], name: "index_departments_on_factory_id"
  end

  create_table "factories", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.datetime "day"
    t.string "shift"
    t.integer "ot"
    t.datetime "enterTime"
    t.datetime "startTime"
    t.datetime "endTime"
    t.datetime "exitTime"
    t.boolean "active"
    t.integer "account_id"
    t.integer "department_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_tasks_on_account_id"
    t.index ["department_id"], name: "index_tasks_on_department_id"
  end

end
