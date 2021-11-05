defmodule Datasets.Downloads do
  alias Datasets.Helpers
  alias Datasets.DataSetInfo, as: Info

  def donwload(name) do

    if !Info.has_dataset?(name) do
      donwload(name, :force_donwload)
    end

    name
  end

  def donwload(name, :force_donwload) do
    [link | _links] = Info.links_download(name)
    execute_request(link, name)
  end

  defp execute_request(%{"url" => url, "extension" => extension}, name) do
    {:ok, resp} = :httpc.request(:get, {url, []}, [], body_format: :binary)
    {{_, 200, 'OK'}, _headers, body} = resp

    dataset_dir = "#{Helpers.directory_datasets()}/#{name}"
    file_dir = "#{dataset_dir}/#{name}.#{extension}"
    File.write!(file_dir, body)
    unzip_file(extension, file_dir, dataset_dir)
  end

  defp unzip_file(:zip, file_dir, dataset_dir) do
    case :zip.unzip(to_charlist(file_dir), [{:cwd, to_charlist(dataset_dir)}]) do
     {:ok, files} ->
        move_files(files, dataset_dir)
    end
  end

  defp unzip_file(_format, _file_dir, _dataset_dir), do: nil

  defp move_files([], _dest_dir), do: nil

  defp move_files(files, dest_dir) do
    [file_dir | files] = files

    file_dir_list = String.split(to_string(file_dir), "/")
    file_name = List.last(file_dir_list)
    File.copy!(file_dir, dest_dir <> "/" <> file_name, :infinity)

    move_files(files, dest_dir)
  end
end
