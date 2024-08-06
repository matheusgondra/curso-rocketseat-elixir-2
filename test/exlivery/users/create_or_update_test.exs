defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.CreateOrUpdate
  alias Exlivery.Users.Agent, as: UserAgent

  setup do
    UserAgent.start_link(%{})

    :ok
  end

  describe "call/1" do
    test "when all params are valid, saves the user" do
      params = %{
        name: "Matheus",
        address: "Rua do Limoeiro",
        email: "matheus@mail.com",
        cpf: "12345678911",
        age: 23
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created or updated successfully"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Matheus",
        address: "Rua do Limoeiro",
        email: "matheus@mail.com",
        cpf: "12345678911",
        age: 10
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
