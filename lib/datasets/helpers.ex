defmodule Datasets.Helpers do
  def directory_datasets do
    dir_file = __ENV__.file()
    path_list = String.split(dir_file, "/")
    {_, only_dir} = List.pop_at(path_list, -1)

    only_dir
    |> Enum.filter(fn s -> s != "" end)
    |> Enum.reduce("", fn s, acc -> acc <> "/" <> s end)
    |> Path.expand()
    |> concat_datasetdir()
  end

  defp concat_datasetdir(path), do: path <> "/../../datasets"
end
