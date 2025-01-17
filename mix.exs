defmodule SepomexAPI.MixProject do
  use Mix.Project

  def project do
    [
      app: :sepomex_api,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [
        sepomex_api: [
          include_executables_for: [:unix],
          applications: [runtime_tools: :permanent]
        ]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {SepomexAPI.Application, [:plug_cowboy]}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.5"},
      {:jason, "~> 1.2"},
      {:cors_plug, "~> 2.0"},
      {:sepomets, github: "poncho/sepomets"}
    ]
  end
end
