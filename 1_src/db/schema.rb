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

ActiveRecord::Schema[7.0].define(version: 2023_02_24_235938) do
  create_table "active_storage_attachments", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "articles", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.date "publish_date"
    t.integer "pages"
    t.text "abstract"
    t.string "keywords"
    t.string "url"
    t.string "ids"
    t.string "type"
    t.string "journal_name"
    t.string "volume"
    t.string "issue"
    t.string "proceedings"
    t.string "place"
    t.string "edition"
    t.string "publisher"
    t.string "departement"
    t.string "university"
    t.string "thesis_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles_projects", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_articles_projects_on_article_id"
    t.index ["project_id"], name: "index_articles_projects_on_project_id"
  end

  create_table "articles_researchers", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.bigint "researcher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_articles_researchers_on_article_id"
    t.index ["researcher_id"], name: "index_articles_researchers_on_researcher_id"
  end

  create_table "institutions", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "url"
    t.text "partner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutions_researchers", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "institution_id", null: false
    t.bigint "researcher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_institutions_researchers_on_institution_id"
    t.index ["researcher_id"], name: "index_institutions_researchers_on_researcher_id"
  end

  create_table "projects", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "researcher_id"
    t.string "title"
    t.text "description"
    t.string "project_role"
    t.string "avatar"
    t.date "start_date"
    t.date "end_date"
    t.string "funding_type"
    t.date "fund_start_date"
    t.date "fund_end_date"
    t.string "funding_entity"
    t.string "funding_program"
    t.string "name_program"
    t.float "total_budget"
    t.float "local_budget"
    t.string "grant_number"
    t.string "url_project"
    t.string "researcher"
    t.string "relationship"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["researcher_id"], name: "index_projects_on_researcher_id"
  end

  create_table "researchers", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "user_type"
    t.date "birthday"
    t.text "resume"
    t.string "email"
    t.string "website"
    t.string "degree"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_researchers_on_user_id"
  end

  create_table "researchers_vacancies", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "researcher_id", null: false
    t.bigint "vacancy_id", null: false
    t.index ["researcher_id"], name: "index_researchers_vacancies_on_researcher_id"
    t.index ["vacancy_id"], name: "index_researchers_vacancies_on_vacancy_id"
  end

  create_table "taggings", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "tagger_type"
    t.bigint "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at", precision: nil
    t.string "tenant", limit: 128
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
    t.index ["tenant"], name: "index_taggings_on_tenant"
  end

  create_table "tags", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", collation: "utf8mb3_bin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "user_type", default: "user", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "blocked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vacancies", charset: "utf8mb4", force: :cascade do |t|
    t.string "reference"
    t.string "position"
    t.text "requirement"
    t.date "deadline"
    t.string "link"
    t.string "euraxess"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_vacancies_on_project_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "articles_projects", "articles"
  add_foreign_key "articles_projects", "projects"
  add_foreign_key "articles_researchers", "articles"
  add_foreign_key "articles_researchers", "researchers"
  add_foreign_key "institutions_researchers", "institutions"
  add_foreign_key "institutions_researchers", "researchers"
  add_foreign_key "projects", "researchers"
  add_foreign_key "researchers", "users"
  add_foreign_key "researchers_vacancies", "researchers"
  add_foreign_key "researchers_vacancies", "vacancies"
  add_foreign_key "taggings", "tags"
  add_foreign_key "vacancies", "projects"
end
