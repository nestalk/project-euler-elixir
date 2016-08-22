defmodule Euler.Problem4 do

  @doc """
  Tests whether the number is a palindrome

  ## Example
    iex> Euler.Problem4.palindrome?(9009)
    true
    iex> Euler.Problem4.palindrome?(9090)
    false
  """
  def palindrome?(num) when is_number(num) do
    str = Integer.to_string(num)
    str == String.reverse(str)
  end

  @doc """
  Find all palindromes created from the products of all
  numbers up to the limit givin

  ## Example
    iex> Euler.Problem4.find_palindromes(12)
    [11, 22, 33, 44, 55, 66, 77, 88, 99]
  """
  def find_palindromes(num) when is_number(num) do
    do_find_palindromes(num, num, palindrome?(num*num), [])
  end

  defp do_find_palindromes(left,right,true, acc) do
    do_find_palindromes(left, right-1, palindrome?(left*(right-1)),[left*right| acc])
  end
  defp do_find_palindromes(left, right, false, acc) when right>0 do
    do_find_palindromes(left, right-1, palindrome?(left*(right-1)), acc)
  end
  defp do_find_palindromes(left, right, false, acc) when right == 0  do
    do_find_palindromes(left-1, left, palindrome?(left*(left-1)), acc)
  end
  defp do_find_palindromes(_, _, _, acc)  do
    acc
  end

  @doc """
  find the largest palindrome created from the products of all
  numbers up to the limit given

  ## Example
    iex> Euler.Problem4.run(99)
    9009
  """
  def run(num) when is_number(num) do
    find_palindromes(num)
    |> Enum.max
  end

end
