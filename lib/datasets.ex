defmodule Datasets do
  @moduledoc """
  Documentation for `Datasets`.
  """

  alias Datasets.Query

  @type dataset_name :: atom()

  @spec all(dataset_name()) :: any()

  def all(name), do: Query.all(name)
end
