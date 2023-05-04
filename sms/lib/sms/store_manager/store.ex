defmodule Sms.StoreManager.Store do
  use Ecto.Schema
  import Ecto.Changeset

  alias Sms.StoreManager.Product

  schema "stores" do
    field :location, :string
    field :storeid, :integer
    has_many :products, Product
    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:location, :storeid])
    |> validate_required([:location, :storeid])
  end
end
