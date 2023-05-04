defmodule Sms.StoreManagerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sms.StoreManager` context.
  """

  @doc """
  Generate a store.
  """
  def store_fixture(attrs \\ %{}) do
    {:ok, store} =
      attrs
      |> Enum.into(%{
        location: "some location",
        storeid: 42
      })
      |> Sms.StoreManager.create_store()

    store
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        inventory: 42,
        name: "some name",
        retail: 120.5,
        vendor: "some vendor",
        wholesale: 120.5
      })
      |> Sms.StoreManager.create_product()

    product
  end
end
