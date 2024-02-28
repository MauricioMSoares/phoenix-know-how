defmodule PhoenixKnowHow.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixKnowHowWeb.Telemetry,
      PhoenixKnowHow.Repo,
      {DNSCluster, query: Application.get_env(:phoenix_know_how, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhoenixKnowHow.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhoenixKnowHow.Finch},
      # Start a worker by calling: PhoenixKnowHow.Worker.start_link(arg)
      # {PhoenixKnowHow.Worker, arg},
      # Start to serve requests, typically the last entry
      PhoenixKnowHowWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixKnowHow.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixKnowHowWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
