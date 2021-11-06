# Datasets

**This library provides several public datasets in an organized and easy-to-handle manner.**

The main idea is to be able to use these datasets interactively using the [livebook](https://livebook.dev)

### How does it work?

Here are stored several dataset addresses, so you can easily choose which dataset table you want to select the data from, and manipulate them quickly and easily.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `datasets` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:datasets, "~> 0.1.0"}
  ]
end
```
## Examples

```elixir
Datasets.all(:cherry_blossoms)
[
  %{
    "doy" => "NA",
    "temp" => "NA",
    "temp_lower" => "NA",
    "temp_upper" => "NA",
    "year" => "801"
  },
  %{
    "doy" => "NA",
    "temp" => "NA",
    "temp_lower" => "NA",
    "temp_upper" => "NA",
    "year" => "802"
  },
  ...
]
```
