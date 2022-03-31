defmodule Cosmo.CrowdStat do
  use Ecto.Schema

  schema "crowd_stats" do
    field(:applications_calling, :string)
    field(:applications_called, :string)
    field(:applications_waiting, :string)

    field(:permissions_calling, :string)
    field(:permissions_called, :string)
    field(:permissions_waiting, :string)

    field(:residence_cards_calling, :string)
    field(:residence_cards_called, :string)
    field(:residence_cards_waiting, :string)

    field(:consultations_cards_calling, :string)
    field(:consultations_called, :string)
    field(:consultations_waiting, :string)

    field(:permanent_residences_cards_calling, :string)
    field(:permanent_residences_called, :string)
    field(:permanent_residences_waiting, :string)

    field(:others_calling, :string)
    field(:others_called, :string)
    field(:others_waiting, :string)

    timestamps()
  end

end
