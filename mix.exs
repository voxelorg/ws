defmodule MyWebsocketApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :my_websocket_app,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {MyWebsocketApp, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 2.4"},
      {:plug, "~> 1.7"},
      {:plug_cowboy, "~> 2.0"},
      {:jason, "~> 1.1"},
      {:httpoison, "~> 1.0"},
      {:gen_registry, "~> 1.0"},
      {:manifold, "~> 1.0"}
    ]
  end
end