defmodule Datasets do
  @moduledoc """
  Documentation for `Datasets`.
  """

  defp data(dataset_name) do
    file_dir(dataset_name)
    |> File.read!()
    |> String.split("\r")
    |> CSV.decode!(separator: ?,, headers: true)
  end

  defp file_dir(dataset_name, extension \\ "csv") do
    "/datasets/#{dataset_name}/#{dataset_name}.#{extension}"
    |> Path.expand(__DIR__)
  end

  def all(dataset_name) do
    data(dataset_name)
    |> Enum.map(& &1)
  end

end
