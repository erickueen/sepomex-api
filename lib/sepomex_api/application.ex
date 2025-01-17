defmodule SepomexAPI.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: SepomexAPI.Worker.start_link(arg)
      # {SepomexAPI.Worker, arg}
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: SepomexAPI.Endpoint,
        options: [port: port()]
      )
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SepomexAPI.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def port() do
    Application.get_env(:sepomex_api, :http_port, 80)
  end
end
