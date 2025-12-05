defmodule LpcWeb.PageController do
  use LpcWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
