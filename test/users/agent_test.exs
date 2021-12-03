defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "save/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "saves the user" do
      user = build(:user)

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when the user is found, returns the user" do
      :user
      |> build(cpf: "123")
      |> UserAgent.save()

      response = UserAgent.get("123")

      expected_response =
        {:ok,
         %User{
           address: "Address",
           age: 18,
           cpf: "123",
           email: "user@email.com",
           name: "user"
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      response = UserAgent.get("123")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
