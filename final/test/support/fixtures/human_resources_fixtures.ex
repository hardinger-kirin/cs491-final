defmodule Final.HumanResourcesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Final.HumanResources` context.
  """

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        department: "some department",
        first_name: "some first_name",
        hire_date: ~D[2023-04-24],
        id_number: 42,
        last_name: "some last_name"
      })
      |> Final.HumanResources.create_employee()

    employee
  end
end
