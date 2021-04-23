defmodule Inmana.WelcomerTest do
  use ExUnit.Case, async: true

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special, returns a special message" do
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "You are very special banana"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is not special, returns a message" do
      params = %{"name" => "Gustavo", "age" => "20"}
      expected_result = {:ok, "Welcome gustavo"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is under age, returns a error" do
      params = %{"name" => "Gustavo", "age" => "10"}
      expected_result = {:error, "You shall not passa gustavo"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end
