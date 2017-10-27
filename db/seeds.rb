# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create(first_name: "Jack",
                    last_name: "Moody",
                    admin: true,
                    email: "jacklm@live.unc.edu",
                    password: "password",
                    password_confirmation: "password")
admin.skip_confirmation!
admin.save!
