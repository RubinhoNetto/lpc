defmodule Lpc.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LpcWeb.Telemetry,
      Lpc.Repo,
      {DNSCluster, query: Application.get_env(:lpc, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Lpc.PubSub},
      # Start a worker by calling: Lpc.Worker.start_link(arg)
      # {Lpc.Worker, arg},
      # Start to serve requests, typically the last entry
      LpcWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Lpc.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LpcWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
