# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_30_151200) do

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "assignees", force: :cascade do |t|
    t.integer "assignment_id", null: false
    t.integer "team_id", null: false
    t.integer "role_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assignment_id"], name: "index_assignees_on_assignment_id"
    t.index ["team_id"], name: "index_assignees_on_team_id"
  end

  create_table "assignment_items", force: :cascade do |t|
    t.integer "assignment_id", null: false
    t.integer "work_item_id"
    t.integer "rating"
    t.string "remarks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "serial_number"
    t.index ["assignment_id"], name: "index_assignment_items_on_assignment_id"
    t.index ["work_item_id"], name: "index_assignment_items_on_work_item_id"
  end

  create_table "assignment_logs", force: :cascade do |t|
    t.integer "assignment_id", null: false
    t.integer "actor_id"
    t.string "action"
    t.integer "team_id"
    t.integer "operation_team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assignment_id"], name: "index_assignment_logs_on_assignment_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.integer "work_id"
    t.integer "location_id", null: false
    t.integer "team_id", null: false
    t.integer "operation_team_id"
    t.string "name"
    t.datetime "start_datetime"
    t.datetime "due_datetime"
    t.datetime "end_datetime"
    t.integer "status"
    t.string "aasm_state"
    t.integer "aasm_supplement"
    t.integer "ref_no"
    t.string "ancestry"
    t.string "user_ref"
    t.integer "parent_id"
    t.text "comments"
    t.string "color"
    t.string "date_range"
    t.string "address"
    t.decimal "longitude", precision: 10, scale: 6
    t.decimal "altitude", precision: 10, scale: 6
    t.decimal "latitude", precision: 10, scale: 6
    t.string "block_hash"
    t.integer "nonce"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "source"
    t.string "origin"
    t.boolean "delete_bimfile"
    t.integer "client_id"
    t.integer "site_id"
    t.string "our_ref"
    t.string "project_site"
    t.string "attention"
    t.string "phone"
    t.string "client_ref"
    t.index ["client_id"], name: "index_assignments_on_client_id"
    t.index ["location_id"], name: "index_assignments_on_location_id"
    t.index ["site_id"], name: "index_assignments_on_site_id"
    t.index ["team_id"], name: "index_assignments_on_team_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "local_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.string "address4"
    t.string "phone"
    t.string "fax"
    t.string "email"
    t.string "local_address"
    t.string "site"
    t.integer "parent_id"
    t.string "phone2"
  end

  create_table "collections", force: :cascade do |t|
    t.string "customer_contract_no"
    t.string "request_ref"
    t.string "location"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.date "received_date"
  end

  create_table "commodities", force: :cascade do |t|
    t.string "code"
    t.string "tag"
    t.string "name"
    t.string "local_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "containers", force: :cascade do |t|
    t.string "code"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "object"
    t.string "size"
    t.integer "collection_id"
    t.string "tag"
    t.index ["collection_id"], name: "index_containers_on_collection_id"
  end

  create_table "defects", force: :cascade do |t|
    t.integer "assignment_id", null: false
    t.integer "issue_id"
    t.integer "rating"
    t.string "remarks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assignment_id"], name: "index_defects_on_assignment_id"
  end

  create_table "folders", force: :cascade do |t|
    t.string "foldable_type", null: false
    t.integer "foldable_id", null: false
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["foldable_type", "foldable_id"], name: "index_folders_on_foldable_type_and_foldable_id"
  end

  create_table "laboratories", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "local_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lines", force: :cascade do |t|
    t.string "lineable_type", null: false
    t.integer "lineable_id", null: false
    t.integer "product_id", null: false
    t.decimal "price"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "thing"
    t.string "description"
    t.integer "percentage", default: 0
    t.decimal "discount"
    t.string "category"
    t.string "code"
    t.string "unit"
    t.string "method"
    t.index ["lineable_type", "lineable_id"], name: "index_lines_on_lineable_type_and_lineable_id"
    t.index ["product_id"], name: "index_lines_on_product_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "local_name"
    t.string "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "team_id"
    t.index ["team_id"], name: "index_locations_on_team_id"
  end

  create_table "masters", force: :cascade do |t|
    t.integer "team_id", null: false
    t.string "code"
    t.string "name"
    t.string "local_name"
    t.integer "parent_id"
    t.string "icon"
    t.integer "setting1"
    t.string "param1"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_masters_on_team_id"
  end

  create_table "members", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "team_id", null: false
    t.integer "role", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "last_read_at"
    t.index ["team_id"], name: "index_members_on_team_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "user_id", null: false
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_messages_on_team_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer "category"
    t.string "image"
    t.decimal "longitude", precision: 15, scale: 8
    t.decimal "altitude", precision: 15, scale: 8
    t.decimal "latitude", precision: 15, scale: 8
    t.string "photoable_type"
    t.bigint "photoable_id"
    t.boolean "is_printable"
    t.datetime "photo_datetime"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["photoable_id"], name: "index_photos_on_photoable_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "local_name"
    t.integer "unit_rate"
    t.integer "unit_type_id"
    t.integer "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ancestry"
    t.string "category_name"
    t.string "unit_name"
    t.index ["ancestry"], name: "index_products_on_ancestry"
  end

  create_table "readings", force: :cascade do |t|
    t.string "thing"
    t.datetime "reading_time"
    t.string "content"
    t.integer "thing_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sale_items", force: :cascade do |t|
    t.integer "sale_id", null: false
    t.integer "work_item_id", null: false
    t.decimal "price", precision: 10, scale: 2
    t.integer "quantity"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sale_id"], name: "index_sale_items_on_sale_id"
    t.index ["work_item_id"], name: "index_sale_items_on_work_item_id"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "category"
    t.date "sale_date"
    t.string "our_ref"
    t.string "client_ref"
    t.integer "client_id", null: false
    t.string "project_site"
    t.string "attention"
    t.string "phone"
    t.decimal "total_amount"
    t.string "authorised_person"
    t.date "authorised_date"
    t.string "aasm_state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "term_id"
    t.integer "authorised_staff_id"
    t.integer "ship_client_id"
    t.string "ship_project_site"
    t.string "ship_attention"
    t.string "ship_phone"
    t.string "contact"
    t.string "ship_contact"
    t.string "ship_to"
    t.string "ship_address"
    t.decimal "discount", precision: 5, scale: 2, default: "0.0"
    t.integer "parent_id"
    t.string "authorised_person2"
    t.string "fax"
    t.string "email"
    t.string "cc"
    t.index ["client_id"], name: "index_sales_on_client_id"
    t.index ["client_ref"], name: "index_sales_on_client_ref"
    t.index ["our_ref"], name: "index_sales_on_our_ref"
    t.index ["team_id"], name: "index_sales_on_team_id"
  end

  create_table "sales_terms", force: :cascade do |t|
    t.integer "sale_id", null: false
    t.integer "term_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sale_id"], name: "index_sales_terms_on_sale_id"
    t.index ["term_id"], name: "index_sales_terms_on_term_id"
  end

  create_table "sites", force: :cascade do |t|
    t.integer "client_id", null: false
    t.string "code"
    t.string "name"
    t.string "local_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_sites_on_client_id"
  end

  create_table "task_materials", force: :cascade do |t|
    t.integer "task_id"
    t.integer "material_id"
    t.integer "quantity"
    t.integer "cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
    t.date "booking_date"
    t.index ["task_id"], name: "index_task_materials_on_task_id"
  end

  create_table "task_staffs", force: :cascade do |t|
    t.integer "task_id"
    t.integer "task_role_id"
    t.integer "staff_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
    t.date "booking_date"
    t.index ["task_id"], name: "index_task_staffs_on_task_id"
  end

  create_table "task_vehicles", force: :cascade do |t|
    t.integer "task_id"
    t.integer "vehicle_id"
    t.integer "driver_id"
    t.integer "start_km"
    t.integer "end_km"
    t.integer "run_km"
    t.integer "tunnel_expense"
    t.integer "parking_expense"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
    t.date "booking_date"
    t.index ["task_id"], name: "index_task_vehicles_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "category", default: 0
    t.date "task_date"
    t.string "our_ref"
    t.string "customer_ref"
    t.string "request_ref"
    t.string "location"
    t.integer "object_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "laboratory_id"
    t.integer "client_id"
    t.string "sample"
    t.string "contact"
    t.string "phone"
    t.string "fax"
    t.string "aasm_state"
    t.integer "no_of_sample"
    t.boolean "all_day", default: true
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "title"
    t.date "sample_received_date"
    t.date "test_start_date"
    t.date "test_end_date"
    t.date "report_drafted_date"
    t.date "report_typed_date"
    t.date "report_checked_date"
    t.date "report_signed_date"
    t.date "report_dispatched_date"
    t.string "report_no"
    t.string "quotation_no"
    t.string "invoice_no"
    t.date "invoice_date"
    t.integer "invoice_amount"
    t.date "account_signoff_date"
    t.date "laboratory_signoff_date"
    t.index ["client_id"], name: "index_tasks_on_client_id"
    t.index ["laboratory_id"], name: "index_tasks_on_laboratory_id"
  end

  create_table "team_assignments", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "assignment_id", null: false
    t.integer "role_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assignment_id"], name: "index_team_assignments_on_assignment_id"
    t.index ["assignment_id"], name: "index_teams_on_assignment_id"
    t.index ["team_id"], name: "index_team_assignments_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "local_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "terms", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.string "local_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "things", force: :cascade do |t|
    t.string "thingable_type"
    t.integer "thingable_id"
    t.string "code"
    t.string "cname"
    t.string "local_name"
    t.integer "category_id"
    t.integer "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "commodity_id"
    t.string "mark"
    t.string "set_no"
    t.index ["thingable_type", "thingable_id"], name: "index_things_on_thingable_type_and_thingable_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "no"
    t.integer "user_id", null: false
    t.integer "actor_id"
    t.string "message"
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "read_at"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.integer "invited_by_id"
    t.integer "invitations_count", default: 0
    t.integer "role", default: 0
    t.string "name"
    t.integer "unread", default: 0
    t.string "encrypted_otp_secret"
    t.string "encrypted_otp_secret_iv"
    t.string "encrypted_otp_secret_salt"
    t.integer "consumed_timestep"
    t.boolean "otp_required_for_login"
    t.string "otp_backup_codes"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", limit: 8, null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 1073741823
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "work_items", force: :cascade do |t|
    t.integer "work_id", null: false
    t.string "code"
    t.string "name"
    t.string "local_name"
    t.integer "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "unit_rate", precision: 10, scale: 2
    t.integer "unit_type_id"
    t.string "heading"
    t.index ["work_id"], name: "index_work_items_on_work_id"
  end

  create_table "works", force: :cascade do |t|
    t.integer "team_id", null: false
    t.string "code"
    t.string "name"
    t.string "local_name"
    t.integer "icon_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "workflow_id"
    t.index ["team_id"], name: "index_works_on_team_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "assignees", "assignments"
  add_foreign_key "assignees", "teams"
  add_foreign_key "assignment_items", "assignments"
  add_foreign_key "assignment_logs", "assignments"
  add_foreign_key "assignments", "clients"
  add_foreign_key "assignments", "locations"
  add_foreign_key "assignments", "sites"
  add_foreign_key "assignments", "teams"
  add_foreign_key "containers", "collections"
  add_foreign_key "defects", "assignments"
  add_foreign_key "lines", "products"
  add_foreign_key "locations", "teams"
  add_foreign_key "masters", "teams"
  add_foreign_key "members", "teams"
  add_foreign_key "members", "users"
  add_foreign_key "messages", "teams"
  add_foreign_key "messages", "users"
  add_foreign_key "sale_items", "sales"
  add_foreign_key "sale_items", "work_items"
  add_foreign_key "sales", "clients"
  add_foreign_key "sales", "teams"
  add_foreign_key "sales_terms", "sales"
  add_foreign_key "sales_terms", "terms"
  add_foreign_key "sites", "clients"
  add_foreign_key "task_materials", "tasks"
  add_foreign_key "task_staffs", "tasks"
  add_foreign_key "task_vehicles", "tasks"
  add_foreign_key "tasks", "clients"
  add_foreign_key "tasks", "laboratories"
  add_foreign_key "team_assignments", "assignments"
  add_foreign_key "team_assignments", "teams"
  add_foreign_key "tickets", "users"
  add_foreign_key "work_items", "works"
  add_foreign_key "works", "teams"
end
