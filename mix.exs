defmodule Datasets.MixProject do
  use Mix.Project

  def project do
    [
      app: :datasets,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      xref: [exclude: [:httpc]],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:csv, "~> 2.4"},
      {:poison, "~> 5.0"}
    ]
  end
end
