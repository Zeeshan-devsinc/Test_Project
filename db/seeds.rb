# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Plan.create([
  {
    name: "plan_1",
    monthly_fee: 15
  },

  {
    name: "plan_2",
    monthly_fee: 10
  },

  {
    name: "plan_3",
    monthly_fee: 20
  }
])

Plan.destroy_all


Feature.create([
  {
    name: "Harry Potter Novel",
    code: "11",
    unit_price: 15,
    max_unit_limit: 40
  },

  {
    name: "Sherlock Holmes",
    code: "12",
    unit_price: 10,
    max_unit_limit: 40
  },

  {
    name: "The Great Gatsby",
    code: "13",
    unit_price: 20,
    max_unit_limit: 40
  }
])

Feature.destroy_all


user_1 = User.create(name: "ZeeshanRafiq", email: "zeeshanrafiq86@gmail.com", billing_day: 28, role: 0)
user_2 = User.create(name: "Zeeshan", email: "zeeshan.rafiq@devsinc.com", billing_day: 28, role: 1)

User.destroy_all

