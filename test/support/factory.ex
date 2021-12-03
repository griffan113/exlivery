defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Order, Item}

  def user_factory do
    %User{
      address: "Address",
      age: 18,
      cpf: "123",
      email: "user@email.com",
      name: "user"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza",
      category: :pizza,
      unity_price: Decimal.new("35.5"),
      quantity: 1
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Address",
      items: [
        build(:item),
        build(:item)
      ],
      total_price: Decimal.new("71.00"),
      user_cpf: "123"
    }
  end
end
