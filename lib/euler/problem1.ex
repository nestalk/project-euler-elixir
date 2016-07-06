defmodule Euler.Problem1 do 

    @doc """
    Takes a number and returns `true` if the number 
    is a multiple of `3` or `5`.

    ## Example
        iex> Euler.Problem1.multipleOf3Or5(2)
        false
        iex> Euler.Problem1.multipleOf3Or5(3)
        true
        iex> Euler.Problem1.multipleOf3Or5(5)
        true
    """
    def multipleOf3Or5(num) when is_number(num) do
       (rem(num,3) == 0) || (rem(num,5) == 0)
    end

    @doc """
    Given a limit, find all numbers below that are
    multiples of 3 and 5, and sum them

    ## Example
        iex> Euler.Problem1.run(10)
        23
    """
    def run(limit) when is_number(limit) do
        (1 .. (limit-1))
        |> Enum.filter(&(multipleOf3Or5(&1)))
        |> Enum.sum
    end

end
