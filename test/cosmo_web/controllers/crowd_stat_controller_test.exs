defmodule CosmoWeb.CrowdStatControllerTest do
  use CosmoWeb.ConnCase

  alias Cosmo.Info
  alias Cosmo.Info.CrowdStat

  @create_attrs %{
    applications_called: "some applications_called",
    applications_calling: "some applications_calling",
    applications_waiting: "some applications_waiting",
    consultations_called: "some consultations_called",
    consultations_calling: "some consultations_calling",
    consultations_waiting: "some consultations_waiting",
    others_called: "some others_called",
    others_calling: "some others_calling",
    others_waiting: "some others_waiting",
    permanent_residences_called: "some permanent_residences_called",
    permanent_residences_calling: "some permanent_residences_calling",
    permanent_residences_waiting: "some permanent_residences_waiting",
    permissions_called: "some permissions_called",
    permissions_calling: "some permissions_calling",
    permissions_waiting: "some permissions_waiting",
    residence_cards_called: "some residence_cards_called",
    residence_cards_calling: "some residence_cards_calling",
    residence_cards_waiting: "some residence_cards_waiting"
  }
  @update_attrs %{
    applications_called: "some updated applications_called",
    applications_calling: "some updated applications_calling",
    applications_waiting: "some updated applications_waiting",
    consultations_called: "some updated consultations_called",
    consultations_calling: "some updated consultations_calling",
    consultations_waiting: "some updated consultations_waiting",
    others_called: "some updated others_called",
    others_calling: "some updated others_calling",
    others_waiting: "some updated others_waiting",
    permanent_residences_called: "some updated permanent_residences_called",
    permanent_residences_calling: "some updated permanent_residences_calling",
    permanent_residences_waiting: "some updated permanent_residences_waiting",
    permissions_called: "some updated permissions_called",
    permissions_calling: "some updated permissions_calling",
    permissions_waiting: "some updated permissions_waiting",
    residence_cards_called: "some updated residence_cards_called",
    residence_cards_calling: "some updated residence_cards_calling",
    residence_cards_waiting: "some updated residence_cards_waiting"
  }
  @invalid_attrs %{
    applications_called: nil,
    applications_calling: nil,
    applications_waiting: nil,
    consultations_called: nil,
    consultations_calling: nil,
    consultations_waiting: nil,
    others_called: nil,
    others_calling: nil,
    others_waiting: nil,
    permanent_residences_called: nil,
    permanent_residences_calling: nil,
    permanent_residences_waiting: nil,
    permissions_called: nil,
    permissions_calling: nil,
    permissions_waiting: nil,
    residence_cards_called: nil,
    residence_cards_calling: nil,
    residence_cards_waiting: nil
  }

  def fixture(:crowd_stat) do
    {:ok, crowd_stat} = Info.create_crowd_stat(@create_attrs)
    crowd_stat
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all crowd_stats", %{conn: conn} do
      conn = get(conn, Routes.crowd_stat_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create crowd_stat" do
    test "renders crowd_stat when data is valid", %{conn: conn} do
      conn = post(conn, Routes.crowd_stat_path(conn, :create), crowd_stat: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.crowd_stat_path(conn, :show, id))

      assert %{
               "id" => id,
               "applications_called" => "some applications_called",
               "applications_calling" => "some applications_calling",
               "applications_waiting" => "some applications_waiting",
               "consultations_called" => "some consultations_called",
               "consultations_calling" => "some consultations_calling",
               "consultations_waiting" => "some consultations_waiting",
               "others_called" => "some others_called",
               "others_calling" => "some others_calling",
               "others_waiting" => "some others_waiting",
               "permanent_residences_called" => "some permanent_residences_called",
               "permanent_residences_calling" => "some permanent_residences_calling",
               "permanent_residences_waiting" => "some permanent_residences_waiting",
               "permissions_called" => "some permissions_called",
               "permissions_calling" => "some permissions_calling",
               "permissions_waiting" => "some permissions_waiting",
               "residence_cards_called" => "some residence_cards_called",
               "residence_cards_calling" => "some residence_cards_calling",
               "residence_cards_waiting" => "some residence_cards_waiting"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.crowd_stat_path(conn, :create), crowd_stat: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update crowd_stat" do
    setup [:create_crowd_stat]

    test "renders crowd_stat when data is valid", %{
      conn: conn,
      crowd_stat: %CrowdStat{id: id} = crowd_stat
    } do
      conn =
        put(conn, Routes.crowd_stat_path(conn, :update, crowd_stat), crowd_stat: @update_attrs)

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.crowd_stat_path(conn, :show, id))

      assert %{
               "id" => id,
               "applications_called" => "some updated applications_called",
               "applications_calling" => "some updated applications_calling",
               "applications_waiting" => "some updated applications_waiting",
               "consultations_called" => "some updated consultations_called",
               "consultations_calling" => "some updated consultations_calling",
               "consultations_waiting" => "some updated consultations_waiting",
               "others_called" => "some updated others_called",
               "others_calling" => "some updated others_calling",
               "others_waiting" => "some updated others_waiting",
               "permanent_residences_called" => "some updated permanent_residences_called",
               "permanent_residences_calling" => "some updated permanent_residences_calling",
               "permanent_residences_waiting" => "some updated permanent_residences_waiting",
               "permissions_called" => "some updated permissions_called",
               "permissions_calling" => "some updated permissions_calling",
               "permissions_waiting" => "some updated permissions_waiting",
               "residence_cards_called" => "some updated residence_cards_called",
               "residence_cards_calling" => "some updated residence_cards_calling",
               "residence_cards_waiting" => "some updated residence_cards_waiting"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, crowd_stat: crowd_stat} do
      conn =
        put(conn, Routes.crowd_stat_path(conn, :update, crowd_stat), crowd_stat: @invalid_attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete crowd_stat" do
    setup [:create_crowd_stat]

    test "deletes chosen crowd_stat", %{conn: conn, crowd_stat: crowd_stat} do
      conn = delete(conn, Routes.crowd_stat_path(conn, :delete, crowd_stat))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.crowd_stat_path(conn, :show, crowd_stat))
      end
    end
  end

  defp create_crowd_stat(_) do
    crowd_stat = fixture(:crowd_stat)
    %{crowd_stat: crowd_stat}
  end
end
