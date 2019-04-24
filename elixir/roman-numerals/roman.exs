defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  num_to_roman = %{}

  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    number
    |> parse_int
  end

  def parse_int(num) do
    _parse_int(div(num, 10), rem(num, 10), [])
    |> Enum.map(&round/1)
  end

  defp _parse_int(rest, ones, lst) when ones != 0 do
    _parse_int(div(rest, 10), rem(rest, 10), [ones * :math.pow(10, length(lst)) | lst])
  end

  defp _parse_int(_rest, 0, lst) do
    lst
  end
end

IO.inspect(Roman.numerals(123))
