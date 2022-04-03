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

ActiveRecord::Schema[7.0].define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "adminpack"
  enable_extension "plpgsql"

  create_table "animals", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 20
    t.date "date_of_birth"
    t.integer "escape_attempts"
    t.boolean "neutered"
    t.decimal "weight_kg"
    t.integer "species_id"
    t.integer "owner_id"
  end

  create_table "owners", id: :integer, default: nil, force: :cascade do |t|
    t.string "full_name", limit: 20
    t.integer "age"
  end

  create_table "specializations", id: :integer, default: nil, force: :cascade do |t|
    t.integer "species_id"
    t.integer "vet_id"
  end

  create_table "species", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 20
  end

  create_table "vets", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 20
    t.integer "age"
    t.date "date_of_graduation"
  end

  create_table "visits", id: :integer, default: nil, force: :cascade do |t|
    t.integer "animal_id"
    t.integer "vet_id"
    t.date "date_of_visit"
  end

  add_foreign_key "animals", "owners", name: "animals_owner_id_fkey"
  add_foreign_key "animals", "species", name: "animals_species_id_fkey"
  add_foreign_key "specializations", "species", name: "specializations_species_id_fkey"
  add_foreign_key "specializations", "vets", name: "specializations_vet_id_fkey"
  add_foreign_key "visits", "animals", name: "visits_animal_id_fkey"
  add_foreign_key "visits", "vets", name: "visits_vet_id_fkey"
end
