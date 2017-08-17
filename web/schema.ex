defmodule Graphqltest.Schema do
  use Absinthe.Schema
  import_types Graphqltest.Schema.Types

  query do
    field :posts, list_of(post) do
      resolve &Graphqltest.PostResolver.all/2
    end

    field :users, list_of(:user) do
      resolve &Graphqltest.UserResolver.all/2
    end
  end
end
