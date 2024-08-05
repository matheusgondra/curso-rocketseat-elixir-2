defmodule Exlivery.Factory do
  use ExMachina

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
end
