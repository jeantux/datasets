defmodule Datasets.DataSetInfo do
  alias Datasets.Helpers

  defstruct description: "", homepage: "", links: [], files: []

  @dataset_file_name "/dataset_info.json"

  defp load_infos(name) do
    dir_dataset = Helpers.directory_datasets()
    path_infos = "#{dir_dataset}/#{name}/#{@dataset_file_name}"

    {:ok, data} = File.read(path_infos)

    data
    |> Poison.decode!()
    |> struct_from_map()
  end

  defp struct_from_map(a_map) do
    keys =
      Map.keys(%__MODULE__{})
      |> Enum.filter(fn x -> x != :__struct__ end)

    processed_map =
      for key <- keys, into: %{} do
        value = Map.get(a_map, key) || Map.get(a_map, to_string(key))
        {key, value}
      end

    Map.merge(%__MODULE__{}, processed_map)
  end

  def has_dataset?(name_dataset) do
    infos = load_infos(name_dataset)
    [file | _files_dataset] = infos.files
    dir_file = Helpers.directory_datasets()
    File.exists?("#{dir_file}/#{name_dataset}/#{file}")
  end

  def links_download(name) do
    infos = load_infos(name)
    infos.links
  end
end
