defmodule CbsWeb.UserController do
  use CbsWeb, :controller

  alias Ecto.Changeset
  # alias Plug.Conn
  alias Cbs.Main
  alias Cbs.Main.User
  alias CbsWeb.ErrorHelpers


  action_fallback CbsWeb.FallbackController

  def index(conn, _params) do
    users = Main.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    conn
    |> Pow.Plug.create_user(user_params)
    |> case do
      {:ok, _user, conn} ->
        json(conn, %{
          data: %{
            token: conn.private[:api_auth_token],
            renew_token: conn.private[:api_renew_token]
          }
        })

      {:error, changeset, conn} ->
        errors = Changeset.traverse_errors(changeset, &ErrorHelpers.translate_error/1)

        conn
        |> put_status(500)
        |> json(%{error: %{status: 500, message: "Couldn't create user", errors: errors}})
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
    with {:ok, token, _claims} <- Main.authenticate_user(username, password),
         do: conn |> render("jwt.json", acess_token: token)
  end
end
