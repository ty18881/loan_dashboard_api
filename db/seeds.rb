# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create_table "borrowers", force: :cascade do |t|
#     t.string "name"
#     t.string "state"
#     t.string "business_segment"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.integer "rel_mgr_id"
#   end

## Relationship Manager data seeding.
# 2.times do
#     RelationshipMgr.create(
#         name: Faker::Name.name,
#         state: Faker::Address.state_abbr,
#         employee_id: Faker::Number.number(digits: 6)
#     )
# end

## Create two borrowers - CRE business segment
# 2.times do
#     Borrower.create(
#         name: Faker::Company.name,
#         state: Faker::Address.state_abbr,
#         business_segment: "CRE"
#     )
# end


# ## Create two borrowers - Energy Segment
# 4.times do
#     Borrower.create(
#         name: Faker::Company.name,
#         state: Faker::Address.state_abbr,
#         business_segment: "Energy"
#     )
# end

# puts "Borrower Data Seeded"

## Create an application that has been approved

#     Application.create(
#         submit_date: Faker::Date.backward(days: 15),
#         review_date: Faker::Date.backward(days: 9),
#         decision_date: Faker::Date.backward(days: 6),
#         status: "approved"
#     )

# # ## Create an application that was declined.

#     Application.create(
#         submit_date: Faker::Date.backward(days: 10),
#         review_date: Faker::Date.backward(days: 5),
#         decision_date: Faker::Date.backward(days: 2),
#         status: "declined"
#     )

# puts "Statused Applications seeded"
## create two applications that have yet to be decisioned
# 2.times do
#     Application.create(
#         submit_date: Faker::Date.backward(days: 3),
#         review_date: Faker::Date.backward(days: 1),
#         status: ""
#     )
# end

# puts "Seeded unstatused applications"
# create_table "loans", force: :cascade do |t|
#     t.decimal "principal_amount"
#     t.decimal "interest_rate"
#     t.date "maturity_date"
#     t.integer "term"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.integer "application_id"
#   end

## create sample loans

3.times do
    Loan.create(
        principal_amount: Faker::Number.decimal(l_digits: 5, r_digits:2),
        interest_rate: Faker::Number.decimal(l_digits: 1, r_digits:2),
        maturity_date: Faker::Date.in_date_period(year: 2025, month: 7),
        term: 5
    )
end

puts "Seeded loans"