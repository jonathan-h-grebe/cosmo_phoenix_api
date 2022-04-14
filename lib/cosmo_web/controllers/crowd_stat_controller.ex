defmodule CosmoWeb.CrowdStatController do
  use CosmoWeb, :controller

  alias Cosmo.Info
  alias Cosmo.Info.CrowdStat

  action_fallback CosmoWeb.FallbackController

  def index(conn, _params) do
    crowd_stats =
      Info.list_crowd_stats()
      |> Enum.map(fn stat ->
        Map.update!(stat, :inserted_at, fn utc_d ->
          DateTime.from_naive!(utc_d, "UTC", Tzdata.TimeZoneDatabase)
          |> DateTime.shift_zone!("Japan", Tzdata.TimeZoneDatabase)
        end)
        |> Map.update!(:applications_waiting, fn waiting_str ->
          String.slice(waiting_str, 0..-2)
          |> String.to_integer()
        end)
      end)

    render(conn, "index.json", crowd_stats: crowd_stats)
  end

  def within_period(conn, %{"start_datetime" => start_dt, "end_datetime" => end_dt}) do
  end

  def create(conn, %{"crowd_stat" => crowd_stat_params}) do
    with {:ok, %CrowdStat{} = crowd_stat} <- Info.create_crowd_stat(crowd_stat_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.crowd_stat_path(conn, :show, crowd_stat))
      |> render("show.json", crowd_stat: crowd_stat)
    end
  end

  def show(conn, %{"id" => id}) do
    crowd_stat = Info.get_crowd_stat!(id)
    render(conn, "show.json", crowd_stat: crowd_stat)
  end

  def update(conn, %{"id" => id, "crowd_stat" => crowd_stat_params}) do
    crowd_stat = Info.get_crowd_stat!(id)

    with {:ok, %CrowdStat{} = crowd_stat} <- Info.update_crowd_stat(crowd_stat, crowd_stat_params) do
      render(conn, "show.json", crowd_stat: crowd_stat)
    end
  end

  def delete(conn, %{"id" => id}) do
    crowd_stat = Info.get_crowd_stat!(id)

    with {:ok, %CrowdStat{}} <- Info.delete_crowd_stat(crowd_stat) do
      send_resp(conn, :no_content, "")
    end
  end
end
