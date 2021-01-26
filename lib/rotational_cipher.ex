defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text =
      text
    |> String.to_charlist()
    |> IO.inspect()
    |> Enum.reduce([], fn x, acc ->
      IO.puts x
      [shift_letter(x, shift) | acc]
    end)
    |> Enum.reverse()
    |> List.to_string()
  end

  def shift_letter(int, shift) when shift == 0 or shift == 26 do
    # IO.puts "Now this is hardly shifty at all!"
    int
  end
  def shift_letter(int, shift) when shift >= 0 and shift < 26 do
    if(RotationalCipher.is_letter(int) == true) do
     case int do
      int when int + shift >= 65 and int + shift <= 90 ->
        int + shift
      int when int >= 65 and int <= 90 and int + shift >= 90 ->
        over_flow = int + shift - 90
        64 + over_flow
      int when int + shift >= 97 and int + shift <= 122 ->
        int + shift
      int when int + shift > 122 ->
        over_flow = int + shift - 122
        96 + over_flow
     end
    else
      int
    end
  end

  def is_letter(int) do
    if((97 <= int and int <= 122) || (65 <= int and int <= 90)) do
      true
    end
  end
end
