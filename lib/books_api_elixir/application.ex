defmodule BooksApiElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BooksApiElixirWeb.Telemetry,
      BooksApiElixir.Repo,
      {DNSCluster, query: Application.get_env(:books_api_elixir, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BooksApiElixir.PubSub},
      # Start a worker by calling: BooksApiElixir.Worker.start_link(arg)
      # {BooksApiElixir.Worker, arg},
      # Start to serve requests, typically the last entry
      BooksApiElixirWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BooksApiElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BooksApiElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
