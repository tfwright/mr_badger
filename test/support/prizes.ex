defmodule MrBadgerTest.Prizes do
  use MrBadger

  award(:true, nil, do: true)

  award(:false, nil, do: false)

  award(:true_or_false, {result}) do
    if result, do: true, else: false
  end
end
