defmodule Cbs.Main do
  @moduledoc """
  The Main context.
  """

  import Ecto.Query, warn: false
  alias Cbs.Repo

  alias Cbs.Main.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Cbs.Main.Accounts

  @doc """
  Returns the list of accounts.

  ## Examples

      iex> list_accounts()
      [%Accounts{}, ...]

  """
  def list_accounts do
    Repo.all(Accounts)
  end

  @doc """
  Gets a single accounts.

  Raises `Ecto.NoResultsError` if the Accounts does not exist.

  ## Examples

      iex> get_accounts!(123)
      %Accounts{}

      iex> get_accounts!(456)
      ** (Ecto.NoResultsError)

  """
  def get_accounts!(id), do: Repo.get!(Accounts, id)

  @doc """
  Creates a accounts.

  ## Examples

      iex> create_accounts(%{field: value})
      {:ok, %Accounts{}}

      iex> create_accounts(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_accounts(attrs \\ %{}) do
    %Accounts{}
    |> Accounts.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a accounts.

  ## Examples

      iex> update_accounts(accounts, %{field: new_value})
      {:ok, %Accounts{}}

      iex> update_accounts(accounts, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_accounts(%Accounts{} = accounts, attrs) do
    accounts
    |> Accounts.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a accounts.

  ## Examples

      iex> delete_accounts(accounts)
      {:ok, %Accounts{}}

      iex> delete_accounts(accounts)
      {:error, %Ecto.Changeset{}}

  """
  def delete_accounts(%Accounts{} = accounts) do
    Repo.delete(accounts)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking accounts changes.

  ## Examples

      iex> change_accounts(accounts)
      %Ecto.Changeset{source: %Accounts{}}

  """
  def change_accounts(%Accounts{} = accounts) do
    Accounts.changeset(accounts, %{})
  end

  alias Cbs.Main.Adress

  @doc """
  Returns the list of adresses.

  ## Examples

      iex> list_adresses()
      [%Adress{}, ...]

  """
  def list_adresses do
    Repo.all(Adress)
  end

  @doc """
  Gets a single adress.

  Raises `Ecto.NoResultsError` if the Adress does not exist.

  ## Examples

      iex> get_adress!(123)
      %Adress{}

      iex> get_adress!(456)
      ** (Ecto.NoResultsError)

  """
  def get_adress!(id), do: Repo.get!(Adress, id)

  @doc """
  Creates a adress.

  ## Examples

      iex> create_adress(%{field: value})
      {:ok, %Adress{}}

      iex> create_adress(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_adress(attrs \\ %{}) do
    %Adress{}
    |> Adress.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a adress.

  ## Examples

      iex> update_adress(adress, %{field: new_value})
      {:ok, %Adress{}}

      iex> update_adress(adress, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_adress(%Adress{} = adress, attrs) do
    adress
    |> Adress.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a adress.

  ## Examples

      iex> delete_adress(adress)
      {:ok, %Adress{}}

      iex> delete_adress(adress)
      {:error, %Ecto.Changeset{}}

  """
  def delete_adress(%Adress{} = adress) do
    Repo.delete(adress)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking adress changes.

  ## Examples

      iex> change_adress(adress)
      %Ecto.Changeset{source: %Adress{}}

  """
  def change_adress(%Adress{} = adress) do
    Adress.changeset(adress, %{})
  end

  alias Cbs.Main.Deposit

  @doc """
  Returns the list of deposits.

  ## Examples

      iex> list_deposits()
      [%Deposit{}, ...]

  """
  def list_deposits do
    Repo.all(Deposit)
  end

  @doc """
  Gets a single deposit.

  Raises `Ecto.NoResultsError` if the Deposit does not exist.

  ## Examples

      iex> get_deposit!(123)
      %Deposit{}

      iex> get_deposit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_deposit!(id), do: Repo.get!(Deposit, id)

  @doc """
  Creates a deposit.

  ## Examples

      iex> create_deposit(%{field: value})
      {:ok, %Deposit{}}

      iex> create_deposit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_deposit(attrs \\ %{}) do
    %Deposit{}
    |> Deposit.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a deposit.

  ## Examples

      iex> update_deposit(deposit, %{field: new_value})
      {:ok, %Deposit{}}

      iex> update_deposit(deposit, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_deposit(%Deposit{} = deposit, attrs) do
    deposit
    |> Deposit.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a deposit.

  ## Examples

      iex> delete_deposit(deposit)
      {:ok, %Deposit{}}

      iex> delete_deposit(deposit)
      {:error, %Ecto.Changeset{}}

  """
  def delete_deposit(%Deposit{} = deposit) do
    Repo.delete(deposit)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking deposit changes.

  ## Examples

      iex> change_deposit(deposit)
      %Ecto.Changeset{source: %Deposit{}}

  """
  def change_deposit(%Deposit{} = deposit) do
    Deposit.changeset(deposit, %{})
  end

  alias Cbs.Main.Withdrawal

  @doc """
  Returns the list of withdrawals.

  ## Examples

      iex> list_withdrawals()
      [%Withdrawal{}, ...]

  """
  def list_withdrawals do
    Repo.all(Withdrawal)
  end

  @doc """
  Gets a single withdrawal.

  Raises `Ecto.NoResultsError` if the Withdrawal does not exist.

  ## Examples

      iex> get_withdrawal!(123)
      %Withdrawal{}

      iex> get_withdrawal!(456)
      ** (Ecto.NoResultsError)

  """
  def get_withdrawal!(id), do: Repo.get!(Withdrawal, id)

  @doc """
  Creates a withdrawal.

  ## Examples

      iex> create_withdrawal(%{field: value})
      {:ok, %Withdrawal{}}

      iex> create_withdrawal(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_withdrawal(attrs \\ %{}) do
    %Withdrawal{}
    |> Withdrawal.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a withdrawal.

  ## Examples

      iex> update_withdrawal(withdrawal, %{field: new_value})
      {:ok, %Withdrawal{}}

      iex> update_withdrawal(withdrawal, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_withdrawal(%Withdrawal{} = withdrawal, attrs) do
    withdrawal
    |> Withdrawal.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a withdrawal.

  ## Examples

      iex> delete_withdrawal(withdrawal)
      {:ok, %Withdrawal{}}

      iex> delete_withdrawal(withdrawal)
      {:error, %Ecto.Changeset{}}

  """
  def delete_withdrawal(%Withdrawal{} = withdrawal) do
    Repo.delete(withdrawal)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking withdrawal changes.

  ## Examples

      iex> change_withdrawal(withdrawal)
      %Ecto.Changeset{source: %Withdrawal{}}

  """
  def change_withdrawal(%Withdrawal{} = withdrawal) do
    Withdrawal.changeset(withdrawal, %{})
  end


  # def auth(%{})
  def authenticate_user(username, plain_text_password) do
    query = from u in User, where: u.username == ^username
    case Repo.one(query) do
      nil ->
        Argon2.no_user_verify()
        {:error, :invalid_credentials}
      user ->
        if Argon2.verify_pass(plain_text_password, user.password) do
          {:ok, user}
        else
          {:error, :invalid_credentials}
        end
    end
  end
end
