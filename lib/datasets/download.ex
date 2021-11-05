defmodule Datasets.Downloads do
  alias Datasets.Helpers
  alias Datasets.DataSetInfo, as: Info

  def donwload(name) do
    if Info.has_dataset?(name) do
      donwload(name, :force_donwload)
    end

    name
  end

  def donwload(name, :force_donwload) do
    [link | _links] = Info.links_download(name)
    execute_request(link, name)
  end

  defp execute_request(url, name) do
    {:ok, resp} = :httpc.request(:get, {url, []}, [], body_format: :binary)
    {{_, 200, 'OK'}, _headers, body} = resp

    Helpers.directory_datasets()
    File.write!(name, body)
  end
end
