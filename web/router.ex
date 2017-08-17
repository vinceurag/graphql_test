defmodule Graphqltest.Router do
  use Graphqltest.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :graphql do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
    plug Graphqltest.Web.Context
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Graphqltest do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api" do
    pipe_through :graphql
    
    forward "/", Absinthe.Plug,
      schema: Graphqltest.Schema
  end

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: Graphqltest.Schema

  # Other scopes may use custom stacks.
  # scope "/api", Graphqltest do
  #   pipe_through :api
  # end
end
