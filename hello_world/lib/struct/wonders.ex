defmodule HelloWorld.Struct.Wonders do

  defstruct name: "", country: ""
  alias HelloWorld.Struct.Wonders

  @type t :: %Wonders{
    name: String.t(),
    country: String.t()
  }

  @spec all() :: [t()]
  def all() do
    [
      %Wonders{name: "Great Wall of China", country: "China"},
      %Wonders{name: "Petra", country: "Jordan"},
      %Wonders{name: "Christ the Redeemer", country: "Brazil"},
      %Wonders{name: "Machu Picchu", country: "Peru"},
      %Wonders{name: "Chichen Itza", country: "Mexico"},
      %Wonders{name: "Colosseum", country: "Italy"}
    ]
  end
@spec print_names([t()]) :: :ok
  def print_names(wonders) do
    Enum.each(wonders, fn %{name: name, country: country} ->
      IO.puts(name)
      IO.puts(" Is in this country: ")
      IO.puts(country)
    end)
  end
end
