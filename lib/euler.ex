defmodule Euler do

    def main(argv) do
        IO.puts("Problem 1")
        IO.puts(Euler.Problem1.run(1000))

        IO.puts("\nProblem 2")
        IO.puts(Euler.Problem2.run(4000000))
    end
end
