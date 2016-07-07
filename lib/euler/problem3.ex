defmodule Euler.Problem3 do 

    @doc """
    Check whether or not a number is a prime number

    ## Example 
        iex> Euler.Problem3.isprime(4)
        false
        iex> Euler.Problem3.isprime(11)
        true
        iex> Enum.filter((1 .. 100), &(Euler.Problem3.isprime(&1)))
        [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
    """
    def isprime(num) when is_number(num) do
        cond do
            num <= 1 -> 
                false
            num <= 3 -> 
                true
            rem(num, 2) == 0 or rem(num,3) == 0 ->
                false
            true -> 
                _isprime(num)
        end
    end

    defp _isprime(num) do
        max = :math.sqrt num
        Stream.iterate(5, &(&1+6))
        |> Stream.take_while(&(&1 <= max))
        |> Enum.any?(&(rem(num,&1) == 0 or rem(num, (&1+2)) == 0))
        |> Kernel.not
    end
    
    @doc """
    Lists the factors of the given number

    ## Example
        iex> Euler.Problem3.factors(25)
        [1, 5, 25]
        iex> Euler.Problem3.factors(24)
        [1,2,3,4,6,8,12,24]
    """
    def factors(num) when is_number(num) do
        max = round(div(num, 2))
        (1 .. max)
        |> Enum.filter(&(rem(num,&1) == 0))
        |> Enum.concat([num])
    end

    def prime_factors(num) do 
        _prime_factors(num, 2, num, [])
        |> Enum.sort
        |> Enum.uniq
    end 

    def _prime_factors(num, di, _, acc) when di > num, do: acc
    def _prime_factors(num, di, orig, acc) when rem(num,di) == 0 do
        _prime_factors(div(num,di), di, orig, [di | acc])
    end
    def _prime_factors(num, di, orig, acc) when rem(num,di) != 0 do
        _prime_factors(num, di+1, orig, acc)
    end

    def run(num) when is_number(num) do
        prime_factors(num)
        |> Enum.max
    end 

end
