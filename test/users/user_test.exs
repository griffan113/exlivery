defmodule ExliveryTest.UsersTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "builds the user" do
      response = User.build("user", "user@email.com", "123", 18, "Address")

      expected_response = {:ok, build(:user)}

      assert expected_response == response
    end

    test "fails if the params are not valid" do
      response = User.build("user", "user@email.com", "123", 1, "Address")

      expected_response = {:error, "Invalid parameters"}

      assert expected_response == response
    end
  end
end
