defmodule CbsWeb.UserController do
  use CbsWeb, :controller

  alias Cbs.Main
  alias Cbs.Main.User

  action_fallback CbsWeb.FallbackController

  def index(conn, _params) do
    users = Main.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Main.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Main.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Main.get_user!(id)

    with {:ok, %User{} = user} <- Main.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Main.get_user!(id)

    with {:ok, %User{}} <- Main.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

  def login(conn, %{"user" => %{"username" => username, "password" => password}}) do
    # data =
    with {:ok, token, _claims} <- Main.authenticate_user(username, password), do:
      conn |> render("jwt.json", jwt: token)


    # IO.inspect data
    # {:ok, jwt} = data
    # render(conn, "show.json", "")
    # send_resp(conn, :no_content, jwt)
  end
end
