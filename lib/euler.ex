defmodule Euler do

    def main(argv) do
        IO.puts("Problem 1")
        IO.puts(Euler.Problem1.run(1000))

        IO.puts("\nProblem 2")
        IO.puts(Euler.Problem2.run(4000000))

        IO.puts("\nProblem 3")
        IO.puts(Euler.Problem3.run(600851475143))
    end
end
