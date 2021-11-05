defmodule Datasets do
  @moduledoc """
  Documentation for `Datasets`.
  """

  alias Datasets.Query

  def all(name), do: Query.all(name)
end
