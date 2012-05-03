Fabricator(:dream) do
  title { Faker::Lorem.words(3).join(' ').capitalize }
  description { Faker::Lorem.paragraph(5) }
  votes 0
end
