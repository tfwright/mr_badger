defmodule MrBadgerTest do
  use ExUnit.Case

  alias MrBadgerTest.Prizes

  describe "badges_earned/2" do
    test "returns badges that evaluate to true" do
      assert Enum.member?(Prizes.badges_earned(nil), true)
    end

    test "excludes badges that evaluate to false" do
      refute Enum.member?(Prizes.badges_earned(nil), false)
    end
  end

  describe "earns_true?/1" do
    test "is true" do
      assert Prizes.earns_true?(nil)
    end
  end

  describe "earns_true_or_false?/1" do
    test "is true" do
      assert Prizes.earns_true_or_false?({true})
    end

    test "is false" do
      refute Prizes.earns_true_or_false?({false})
    end
  end
end
