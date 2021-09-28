50.times do
Article.create([{title: Faker::Artist.name, body: Faker::Lorem.paragraphs , theme: [:theme1, :theme2,:theme3,:theme4].sample}])
end
