defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case, async: true

  import Exlivery.Factory

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.User

  setup do
    UserAgent.start_link(%{})

    :ok
  end

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    test "when the user is found, returns the user" do
      :user
      |> build(cpf: "12345678888")
      |> UserAgent.save()

      response = UserAgent.get("12345678888")

      expected_response =
        {:ok,
         %User{
           name: "Matheus",
           email: "matheus@mail.com",
           cpf: "12345678888",
           age: 23,
           address: "Rua do Limoeiro, 35"
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      response = UserAgent.get("12345678888")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
