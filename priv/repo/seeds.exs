alias Graphqltest.{User, Post, Repo}

Repo.insert!(%User{name: "Vince Urag", email: "vince@urag.com"})
Repo.insert!(%User{name: "Jomal Linao", email: "jomal@kamikazee.com"})

for _ <- 1..10 do
  Repo.insert!(%Post{
    title: Faker.Lorem.sentence,
    body: Faker.Lorem.paragraph,
    user_id: [1, 2] |> Enum.take_random(1) |> hd 
  })
end
