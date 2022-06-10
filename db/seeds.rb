# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Event.create kind: 'opening', starts_at: Time.now, ends_at: Time.now + 3, weekly_recurring: true
Event.create kind: 'appointment', starts_at: Time.now+1, ends_at: Time.now + 1.5