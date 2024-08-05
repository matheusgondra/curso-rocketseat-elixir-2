defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.Item
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Matheus",
      email: "matheus@mail.com",
      cpf: "12345678911",
      age: 23,
      address: "Rua do Limoeiro, 35"
    }
  end

  def item_factory do
    %Item{
      category: :pizza,
      description: "Pizza de peperoni",
      unity_price: Decimal.new("35.5"),
      quantity: 1
    }
  end
end
