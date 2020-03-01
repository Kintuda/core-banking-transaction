defmodule Cbs.MainTest do
  use Cbs.DataCase

  alias Cbs.Main

  describe "users" do
    alias Cbs.Main.User

    @valid_attrs %{email: "some email", first_name: "some first_name", last_name: "some last_name", password: "some password", username: "some username"}
    @update_attrs %{email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", password: "some updated password", username: "some updated username"}
    @invalid_attrs %{email: nil, first_name: nil, last_name: nil, password: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Main.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Main.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Main.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Main.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.first_name == "some first_name"
      assert user.last_name == "some last_name"
      assert user.password == "some password"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Main.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Main.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.first_name == "some updated first_name"
      assert user.last_name == "some updated last_name"
      assert user.password == "some updated password"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Main.update_user(user, @invalid_attrs)
      assert user == Main.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Main.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Main.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Main.change_user(user)
    end
  end

  describe "accounts" do
    alias Cbs.Main.Accounts

    @valid_attrs %{description: "some description", routing_number: "some routing_number"}
    @update_attrs %{description: "some updated description", routing_number: "some updated routing_number"}
    @invalid_attrs %{description: nil, routing_number: nil}

    def accounts_fixture(attrs \\ %{}) do
      {:ok, accounts} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Main.create_accounts()

      accounts
    end

    test "list_accounts/0 returns all accounts" do
      accounts = accounts_fixture()
      assert Main.list_accounts() == [accounts]
    end

    test "get_accounts!/1 returns the accounts with given id" do
      accounts = accounts_fixture()
      assert Main.get_accounts!(accounts.id) == accounts
    end

    test "create_accounts/1 with valid data creates a accounts" do
      assert {:ok, %Accounts{} = accounts} = Main.create_accounts(@valid_attrs)
      assert accounts.description == "some description"
      assert accounts.routing_number == "some routing_number"
    end

    test "create_accounts/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Main.create_accounts(@invalid_attrs)
    end

    test "update_accounts/2 with valid data updates the accounts" do
      accounts = accounts_fixture()
      assert {:ok, %Accounts{} = accounts} = Main.update_accounts(accounts, @update_attrs)
      assert accounts.description == "some updated description"
      assert accounts.routing_number == "some updated routing_number"
    end

    test "update_accounts/2 with invalid data returns error changeset" do
      accounts = accounts_fixture()
      assert {:error, %Ecto.Changeset{}} = Main.update_accounts(accounts, @invalid_attrs)
      assert accounts == Main.get_accounts!(accounts.id)
    end

    test "delete_accounts/1 deletes the accounts" do
      accounts = accounts_fixture()
      assert {:ok, %Accounts{}} = Main.delete_accounts(accounts)
      assert_raise Ecto.NoResultsError, fn -> Main.get_accounts!(accounts.id) end
    end

    test "change_accounts/1 returns a accounts changeset" do
      accounts = accounts_fixture()
      assert %Ecto.Changeset{} = Main.change_accounts(accounts)
    end
  end

  describe "adresses" do
    alias Cbs.Main.Adress

    @valid_attrs %{county: "some county", ibge_code: "some ibge_code", neighborhood: "some neighborhood", state: "some state", street: "some street", zipcode: "some zipcode"}
    @update_attrs %{county: "some updated county", ibge_code: "some updated ibge_code", neighborhood: "some updated neighborhood", state: "some updated state", street: "some updated street", zipcode: "some updated zipcode"}
    @invalid_attrs %{county: nil, ibge_code: nil, neighborhood: nil, state: nil, street: nil, zipcode: nil}

    def adress_fixture(attrs \\ %{}) do
      {:ok, adress} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Main.create_adress()

      adress
    end

    test "list_adresses/0 returns all adresses" do
      adress = adress_fixture()
      assert Main.list_adresses() == [adress]
    end

    test "get_adress!/1 returns the adress with given id" do
      adress = adress_fixture()
      assert Main.get_adress!(adress.id) == adress
    end

    test "create_adress/1 with valid data creates a adress" do
      assert {:ok, %Adress{} = adress} = Main.create_adress(@valid_attrs)
      assert adress.county == "some county"
      assert adress.ibge_code == "some ibge_code"
      assert adress.neighborhood == "some neighborhood"
      assert adress.state == "some state"
      assert adress.street == "some street"
      assert adress.zipcode == "some zipcode"
    end

    test "create_adress/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Main.create_adress(@invalid_attrs)
    end

    test "update_adress/2 with valid data updates the adress" do
      adress = adress_fixture()
      assert {:ok, %Adress{} = adress} = Main.update_adress(adress, @update_attrs)
      assert adress.county == "some updated county"
      assert adress.ibge_code == "some updated ibge_code"
      assert adress.neighborhood == "some updated neighborhood"
      assert adress.state == "some updated state"
      assert adress.street == "some updated street"
      assert adress.zipcode == "some updated zipcode"
    end

    test "update_adress/2 with invalid data returns error changeset" do
      adress = adress_fixture()
      assert {:error, %Ecto.Changeset{}} = Main.update_adress(adress, @invalid_attrs)
      assert adress == Main.get_adress!(adress.id)
    end

    test "delete_adress/1 deletes the adress" do
      adress = adress_fixture()
      assert {:ok, %Adress{}} = Main.delete_adress(adress)
      assert_raise Ecto.NoResultsError, fn -> Main.get_adress!(adress.id) end
    end

    test "change_adress/1 returns a adress changeset" do
      adress = adress_fixture()
      assert %Ecto.Changeset{} = Main.change_adress(adress)
    end
  end

  describe "deposits" do
    alias Cbs.Main.Deposit

    @valid_attrs %{amount: "120.5"}
    @update_attrs %{amount: "456.7"}
    @invalid_attrs %{amount: nil}

    def deposit_fixture(attrs \\ %{}) do
      {:ok, deposit} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Main.create_deposit()

      deposit
    end

    test "list_deposits/0 returns all deposits" do
      deposit = deposit_fixture()
      assert Main.list_deposits() == [deposit]
    end

    test "get_deposit!/1 returns the deposit with given id" do
      deposit = deposit_fixture()
      assert Main.get_deposit!(deposit.id) == deposit
    end

    test "create_deposit/1 with valid data creates a deposit" do
      assert {:ok, %Deposit{} = deposit} = Main.create_deposit(@valid_attrs)
      assert deposit.amount == Decimal.new("120.5")
    end

    test "create_deposit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Main.create_deposit(@invalid_attrs)
    end

    test "update_deposit/2 with valid data updates the deposit" do
      deposit = deposit_fixture()
      assert {:ok, %Deposit{} = deposit} = Main.update_deposit(deposit, @update_attrs)
      assert deposit.amount == Decimal.new("456.7")
    end

    test "update_deposit/2 with invalid data returns error changeset" do
      deposit = deposit_fixture()
      assert {:error, %Ecto.Changeset{}} = Main.update_deposit(deposit, @invalid_attrs)
      assert deposit == Main.get_deposit!(deposit.id)
    end

    test "delete_deposit/1 deletes the deposit" do
      deposit = deposit_fixture()
      assert {:ok, %Deposit{}} = Main.delete_deposit(deposit)
      assert_raise Ecto.NoResultsError, fn -> Main.get_deposit!(deposit.id) end
    end

    test "change_deposit/1 returns a deposit changeset" do
      deposit = deposit_fixture()
      assert %Ecto.Changeset{} = Main.change_deposit(deposit)
    end
  end

  describe "withdrawals" do
    alias Cbs.Main.Withdrawal

    @valid_attrs %{amount: "120.5"}
    @update_attrs %{amount: "456.7"}
    @invalid_attrs %{amount: nil}

    def withdrawal_fixture(attrs \\ %{}) do
      {:ok, withdrawal} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Main.create_withdrawal()

      withdrawal
    end

    test "list_withdrawals/0 returns all withdrawals" do
      withdrawal = withdrawal_fixture()
      assert Main.list_withdrawals() == [withdrawal]
    end

    test "get_withdrawal!/1 returns the withdrawal with given id" do
      withdrawal = withdrawal_fixture()
      assert Main.get_withdrawal!(withdrawal.id) == withdrawal
    end

    test "create_withdrawal/1 with valid data creates a withdrawal" do
      assert {:ok, %Withdrawal{} = withdrawal} = Main.create_withdrawal(@valid_attrs)
      assert withdrawal.amount == Decimal.new("120.5")
    end

    test "create_withdrawal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Main.create_withdrawal(@invalid_attrs)
    end

    test "update_withdrawal/2 with valid data updates the withdrawal" do
      withdrawal = withdrawal_fixture()
      assert {:ok, %Withdrawal{} = withdrawal} = Main.update_withdrawal(withdrawal, @update_attrs)
      assert withdrawal.amount == Decimal.new("456.7")
    end

    test "update_withdrawal/2 with invalid data returns error changeset" do
      withdrawal = withdrawal_fixture()
      assert {:error, %Ecto.Changeset{}} = Main.update_withdrawal(withdrawal, @invalid_attrs)
      assert withdrawal == Main.get_withdrawal!(withdrawal.id)
    end

    test "delete_withdrawal/1 deletes the withdrawal" do
      withdrawal = withdrawal_fixture()
      assert {:ok, %Withdrawal{}} = Main.delete_withdrawal(withdrawal)
      assert_raise Ecto.NoResultsError, fn -> Main.get_withdrawal!(withdrawal.id) end
    end

    test "change_withdrawal/1 returns a withdrawal changeset" do
      withdrawal = withdrawal_fixture()
      assert %Ecto.Changeset{} = Main.change_withdrawal(withdrawal)
    end
  end
end
