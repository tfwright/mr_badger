# MrBadger

[![CircleCI](https://circleci.com/gh/tfwright/mr_badger.svg?style=svg)](https://circleci.com/gh/tfwright/mr_badger)

**Achievement tracking for Elixir apps**

## Installation

The package can be installed by adding `mr_badger` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mr_badger, "~> 0.1.0"}
  ]
end
```

## Usage

```elixir
defmodule MyBadges do
  use MrBadger

  award(:my_first_badge, {user, :action}) do
    user.done_action?
  end
end

MyBadges.badges_earned({user, :action})
# => [:my_first_badge]

MyBadges.earns_my_first_badge?({user, :action})
# => true

MyBadges.earns_my_first_badge?({user, :another_action})
# => false
```


Docs can be found at [https://hexdocs.pm/mr_badger](https://hexdocs.pm/mr_badger).
