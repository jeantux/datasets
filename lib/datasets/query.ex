defmodule Datasets.Query do
  alias Datasets.Helpers
  alias Datasets.Downloads

  def all(dataset_name) do
    query(dataset_name)
    |> Enum.map(& &1)
  end

  defp query(name) do
    name
    |> Downloads.donwload()
    |> open_dataset_from_csv
  end

  defp open_dataset_from_csv(name) do
    ds_dir = Helpers.directory_datasets()

    "#{ds_dir}/#{name}/#{name}.csv"
    |> File.read!()
    |> String.split("\r")
    |> CSV.decode!(separator: ?,, headers: true)
  end
end
