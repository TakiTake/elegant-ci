defmodule ElegantCi do
  use GenServer
  use AMQP

  def start_link do
    GenServer.start_link(__MODULE__, [], [])
  end

  def init(_opts) do
    rabbitmq_address = System.get_env("RABBITMQ_NODE_IP_ADDRESS")
    rabbitmq_port = System.get_env("RABBITMQ_NODE_PORT")
    {:ok, _conn} = Connection.open("amqp://guest:guest@#{rabbitmq_address}:#{rabbitmq_port}")
  end
end
