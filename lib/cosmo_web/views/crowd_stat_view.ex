defmodule CosmoWeb.CrowdStatView do
  use CosmoWeb, :view
  alias CosmoWeb.CrowdStatView

  def render("index.json", %{crowd_stats: crowd_stats}) do
    %{data: render_many(crowd_stats, CrowdStatView, "crowd_stat.json")}
  end

  def render("show.json", %{crowd_stat: crowd_stat}) do
    %{data: render_one(crowd_stat, CrowdStatView, "crowd_stat.json")}
  end

  def render("crowd_stat.json", %{crowd_stat: crowd_stat}) do
    %{
      id: crowd_stat.id,
      applications_calling: crowd_stat.applications_calling,
      applications_called: crowd_stat.applications_called,
      applications_waiting: crowd_stat.applications_waiting,
      permissions_calling: crowd_stat.permissions_calling,
      permissions_called: crowd_stat.permissions_called,
      permissions_waiting: crowd_stat.permissions_waiting,
      residence_cards_calling: crowd_stat.residence_cards_calling,
      residence_cards_called: crowd_stat.residence_cards_called,
      residence_cards_waiting: crowd_stat.residence_cards_waiting,
      consultations_calling: crowd_stat.consultations_calling,
      consultations_called: crowd_stat.consultations_called,
      consultations_waiting: crowd_stat.consultations_waiting,
      permanent_residences_calling: crowd_stat.permanent_residences_calling,
      permanent_residences_called: crowd_stat.permanent_residences_called,
      permanent_residences_waiting: crowd_stat.permanent_residences_waiting,
      others_calling: crowd_stat.others_calling,
      others_called: crowd_stat.others_called,
      others_waiting: crowd_stat.others_waiting,
      inserted_at: crowd_stat.inserted_at,
      updated_at: crowd_stat.updated_at
    }
  end
end
