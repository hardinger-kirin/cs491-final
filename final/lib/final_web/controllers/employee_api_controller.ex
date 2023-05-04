defmodule FinalWeb.EmployeeApiController do
  use FinalWeb, :controller
  alias Final.HumanResources

  def index(conn, _params) do
    employees = HumanResources.list_employees()
    render(conn, :index, employees: employees)
  end
end
