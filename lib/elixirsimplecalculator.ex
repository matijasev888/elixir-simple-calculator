defmodule SimpleCalculator do
  def start do
    IO.puts("Welcome to the Simple Calculator")
    IO.puts("Enter the first number:")
    first_number = get_number()

    IO.puts("Enter the operator (+, -, *, /):")
    operator = IO.gets("") |> String.trim()

    IO.puts("Enter the second number:")
    second_number = get_number()

    result = calculate(first_number, operator, second_number)
    IO.puts("The result is: #{result}")
  end

  defp get_number do
    input = IO.gets("") |> String.trim()

    case Float.parse(input) do
      {number, ""} -> number
      _ ->
        case Integer.parse(input) do
          {number, ""} -> number * 1.0
          _ ->
            IO.puts("Invalid number format. Please enter a valid number.")
            get_number() # Retry until valid input is provided
        end
    end
  end

  defp calculate(a, "+", b), do: a + b
  defp calculate(a, "-", b), do: a - b
  defp calculate(a, "*", b), do: a * b
  defp calculate(a, "/", b), do: a / b
  defp calculate(_, _, _), do: "Invalid operator"
end
