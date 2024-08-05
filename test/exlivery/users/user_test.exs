defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build("Matheus", "matheus@mail.com", "12345678911", 23, "Rua do Limoeiro, 35")

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when the are invalid params, returns an error" do
      response = User.build("Matheus", "matheus@mail.com", "12345678911", 1, "Rua do Limoeiro")

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
