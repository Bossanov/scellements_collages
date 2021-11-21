#50.times do
#Article.create([{title: Faker::Artist.name, body: Faker::Lorem.paragraphs , theme: [:theme1, :theme2,:theme3,:theme4].sample}])
#end

Profile.destroy_all
User.destroy_all

puts "***--- ADMIN #1 CREATION ---***"
user = User.create!(
   email: "staumont.antoine@me.com",
    password: "Bossanova1",


)
  prof = Profile.create!(
   first_name: "Antoine",
    last_name: "STAUMONT",

    statut: "admin",
  address: "277 Avenue Jean Garaialde",
    post_code: "62152",
    city: "HARDELOT",
    country: "France",
    user_id: user.id,
  )


puts "***--- Autor #2 CREATION ---***"
user = User.create!(
    email: "staumont.antoine@icloud.com",
    password: "Bossanova1",


)
  prof = Profile.create!(
   first_name: "Jean Pierre",
    last_name: "SALOMON",

    statut: "autor",
   address: "1 rue Jeanne de Lallaing",
    post_code: "59550",
    city: "Landrecies",
    country: "France",
    user_id: user.id,
  )

puts "***--- Autor #3 CREATION ---***"
user = User.create!(
    email: "antoine.staumont@gmail.com",
    password: "Bossanova1",


)


