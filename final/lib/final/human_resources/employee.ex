defmodule Final.HumanResources.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :department, :string
    field :first_name, :string
    field :hire_date, :date
    field :id_number, :integer
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:id_number, :last_name, :first_name, :hire_date, :department])
    |> validate_required([:id_number, :last_name, :first_name, :hire_date, :department])
  end
end
