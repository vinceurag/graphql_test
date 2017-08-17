defmodule Graphqltest.PageController do
  use Graphqltest.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
