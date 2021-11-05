defmodule Datasets.Query do
  alias Datasets.Helpers
  alias Datasets.Downloads

  def all(dataset_name) do
    case query(dataset_name) do
      {:ok, data} -> Enum.map(data, & &1)
      :not_found -> {:not_found, "dataset #{dataset_name} not found!"}
      reason -> reason
    end
  end

  defp query(name) do
    ds_dir = Helpers.directory_datasets()
    path_file = "#{ds_dir}/#{name}/dataset_info.json"

    case File.exists?(path_file) do
      true ->
        name
        |> Downloads.donwload()
        |> open_dataset_from_csv

      false ->
        {:not_registered, "sorry, dataset #{name} not registered!"}
    end
  end

  defp open_dataset_from_csv(name) do
    ds_dir = Helpers.directory_datasets()
    path_file = "#{ds_dir}/#{name}/#{name}.csv"

    case File.exists?(path_file) do
      true ->
        data =
          path_file
          |> File.read!()
          |> String.split("\r")
          |> CSV.decode!(separator: ?,, headers: true)

        {:ok, data}

      false ->
        :not_found
    end
  end
end
