defmodule Euler.Problem3 do 
    @doc """
    Calculate the prime factors of the given number

    ## Example 
        iex> Euler.Problem3.prime_factors(24)
        [2, 3]
        iex> Euler.Problem3.prime_factors(13195)
        [5, 7, 13, 29]
    """
    def prime_factors(num) do
        num 
        |> do_prime_factors(2, [])
        |> Enum.sort
        |> Enum.uniq
    end 

    defp do_prime_factors(num, di, acc) when di > num, 
        do: acc
    defp do_prime_factors(num, di, acc) when rem(num,di) == 0,
        do: do_prime_factors(div(num,di), di, [di | acc])
    defp do_prime_factors(num, di, acc) when rem(num,di) != 0, 
        do: do_prime_factors(num, di+1, acc)

    @doc """
    Calculate the largest prime factor

    ## Example
        iex> Euler.Problem3.run(13195)
        29
    """
    def run(num) when is_number(num) do
        num
        |> prime_factors
        |> Enum.max
    end 

end
