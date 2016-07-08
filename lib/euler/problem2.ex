defmodule Euler.Problem2 do 

    @doc """
    Given a limit, take all even fibonacci numbers
    below the limit and return the sum

    ## Example
        iex> Euler.Problem2.run(10)
        10
        iex> Euler.Problem2.run(100)
        44
    """
    def run(limit) when is_number(limit) do
        fibonacci = 
            Stream.unfold {0,1}, fn {f1, f2} -> 
                {f1,{f2, f1+f2}} 
            end

        fibonacci
        |> Stream.filter(&(rem(&1,2)==0))
        |> Stream.take_while(&(&1 <= limit))
        |> Enum.sum
    end
end