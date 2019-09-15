defmodule MrBadger.MixProject do
  use Mix.Project

  def project do
    [
      app: :mr_badger,
      name: "MrBadger",
      description: "Achievement tracking for Elixir apps",
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      source_url: "https://github.com/tfwright/mr_badger",
      docs: docs(),
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp package do
   %{
     name: :mr_badger,
     files: ["lib", "mix.exs", "README*"],
     maintainers: [
       "T. Floyd Wright",
     ],
     licenses: ["MIT"],
     links: %{
       "GitHub" => "https://github.com/tfwright/mr_badger"
     }
   }
  end

  def docs do
    [main: "MrBadger"]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
