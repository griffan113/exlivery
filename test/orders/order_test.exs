defmodule ExliveryTest.OrderTest do
  use ExUnit.Case

  alias Exlivery.Orders.Order

  import Exlivery.Factory

  describe "build/2" do
    test "builds the order" do
      user = build(:user)
      items = build_list(2, :item)

      response = Order.build(user, items)

      expected_response = {:ok, build(:order)}

      assert response == expected_response
    end

    test "when there are no items, returns an error" do
      user = build(:user)

      response = Order.build(user, [])

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
