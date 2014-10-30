# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Ninja.delete_all
Target.delete_all

100.times do |i|
  ninja = Ninja.create!(
    email:    "example#{ i + 1 }@example.ninja",
    password: '123456'
  )

  if i.between?(1, 10)
    100.times do |j|

      if j % 3 == 0 && j % 5 == 0 && i % 3 == 0
        name = "rare name"
      else
        name = "target ##{ 100*i + j + 1 }"
      end

      ninja.targets.create!(
        name: name,
        is_completed: false
      )
    end
  end
end
