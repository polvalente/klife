defmodule Klife.DefaultPartitioner do
  @behaviour Klife.Partitioner
  alias Klife.Record

  @impl Klife.Partitioner
  def get_partition(%Record{key: nil}, max_partition),
    do: Enum.random(0..max_partition)

  def get_partition(%Record{key: key}, max_partition),
    do: :erlang.phash2(key, max_partition + 1)
end
