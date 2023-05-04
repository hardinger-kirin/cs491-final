defmodule Sms.StoreManager.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias Sms.StoreManager.Store

  schema "products" do
    field :inventory, :integer
    field :name, :string
    field :retail, :float
    field :vendor, :string
    field :wholesale, :float
    belongs_to :store, Store
    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :vendor, :wholesale, :retail, :inventory, :store_id])
    |> validate_required([:name, :vendor, :wholesale, :retail, :inventory, :store_id])
  end
end
