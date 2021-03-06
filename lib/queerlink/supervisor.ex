defmodule Queerlink.Supervisor do
@moduledoc false

use Supervisor
require Logger

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    Logger.info( IO.ANSI.green <> "Supervisor started" <> IO.ANSI.reset)
    children = [
      worker(Queerlink.Shortener, []),
      worker(Queerlink.Repo, []),
    ]
    supervise(children, strategy: :one_for_one)
  end
end
