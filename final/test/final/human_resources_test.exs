defmodule Final.HumanResourcesTest do
  use Final.DataCase

  alias Final.HumanResources

  describe "employees" do
    alias Final.HumanResources.Employee

    import Final.HumanResourcesFixtures

    @invalid_attrs %{department: nil, first_name: nil, hire_date: nil, id_number: nil, last_name: nil}

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert HumanResources.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert HumanResources.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      valid_attrs = %{department: "some department", first_name: "some first_name", hire_date: ~D[2023-04-24], id_number: 42, last_name: "some last_name"}

      assert {:ok, %Employee{} = employee} = HumanResources.create_employee(valid_attrs)
      assert employee.department == "some department"
      assert employee.first_name == "some first_name"
      assert employee.hire_date == ~D[2023-04-24]
      assert employee.id_number == 42
      assert employee.last_name == "some last_name"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = HumanResources.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      update_attrs = %{department: "some updated department", first_name: "some updated first_name", hire_date: ~D[2023-04-25], id_number: 43, last_name: "some updated last_name"}

      assert {:ok, %Employee{} = employee} = HumanResources.update_employee(employee, update_attrs)
      assert employee.department == "some updated department"
      assert employee.first_name == "some updated first_name"
      assert employee.hire_date == ~D[2023-04-25]
      assert employee.id_number == 43
      assert employee.last_name == "some updated last_name"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = HumanResources.update_employee(employee, @invalid_attrs)
      assert employee == HumanResources.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = HumanResources.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> HumanResources.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = HumanResources.change_employee(employee)
    end
  end
end
