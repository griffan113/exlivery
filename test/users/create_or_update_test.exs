defmodule Exlivery.Users.CreateorUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "saves the user" do
      params = %{name: "name", email: "email", cpf: "cpf", age: 18, address: "address"}

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "Success"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %{name: "name", email: "email", cpf: "cpf", age: 10, address: "address"}

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
