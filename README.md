# Datasets

**This library provides several public datasets in an organized and easy-to-handle manner.**

The main idea is to be able to use these datasets interactively using the [livebook](https://livebook.dev)

### How does it work?

Here are stored several dataset addresses, so you can easily choose which dataset table you want to select the data from, and manipulate them quickly and easily.

## Installation

```elixir
def deps do
  [
    {:datasets, "~> 0.1.0", github: "jeantux/datasets", branch: "main"}
  ]
end
```
## Examples

```elixir
Datasets.all(:penguins)

[
  %{
    "Body Mass (g)" => "4600",
    "Clutch Completion" => "Yes",
    "Comments" => "",
    "Culmen Depth (mm)" => "18.8",
    ...
  },
  %{"Body Mass (g)" => "2975", "Clutch Completion" => "Yes", ...},
  %{"Body Mass (g)" => "3450", ...},
  %{...},
  ...
]
```
