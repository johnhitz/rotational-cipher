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
    |> Enum.reduce([], fn x, acc ->
      [encrypt(x, shift) | acc]
    end)
    |> Enum.reverse()
    |> List.to_string()
  end

  def encrypt(letter, shift) do
    case letter do
      letter when letter in ?a..?z ->
        ?a + Integer.mod(letter + shift - ?a, 26)
      int when int in ?A..?Z ->
        ?A + Integer.mod(letter + shift - ?A, 26)
      _ -> letter
    end

  end
end
