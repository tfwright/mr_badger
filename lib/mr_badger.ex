defmodule MrBadger do
  @moduledoc """
  When used in a module, adds method for programatically defining badges
  """

  defmacro __using__(_opts) do
    quote do
      import MrBadger, only: [award: 3]

      @before_compile MrBadger

      Module.register_attribute(__MODULE__, :badges, accumulate: true)
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      def badges_earned(action) do
        @badges
        |> Enum.reduce([], fn name, earned ->
          if apply(__MODULE__, :"earns_#{name}?", [action]) do
            [name | earned]
          else
            earned
          end
        end)
      end
    end
  end

  defmacro award(badge, action, do: check) do
    quote do
      MrBadger.register_badge(unquote(badge), __MODULE__)

      def unquote(:"earns_#{badge}?")(unquote(action)), do: unquote(check)
      def unquote(:"earns_#{badge}?")(_), do: false
    end
  end

  def register_badge(name, module) do
    module
    |> Module.get_attribute(:badges)
    |> List.keymember?(name, 0)
    |> case do
      true -> raise MrBadger.DuplicateBadgeError, ~s(badge named "#{name}" is already registered)
      _ -> module
    end
    |> Module.put_attribute(:badges, name)
  end
end

defmodule MrBadger.DuplicateBadgeError do
  defexception message: "Badge has already been defined"
end
