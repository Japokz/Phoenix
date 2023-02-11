defmodule Jojo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Jojo.Repo,
      # Start the Telemetry supervisor
      JojoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Jojo.PubSub},
      # Start the Endpoint (http/https)
      JojoWeb.Endpoint
      # Start a worker by calling: Jojo.Worker.start_link(arg)
      # {Jojo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Jojo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    JojoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
