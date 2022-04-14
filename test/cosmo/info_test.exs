defmodule Cosmo.InfoTest do
  use Cosmo.DataCase

  alias Cosmo.Info

  describe "crowd_stats" do
    alias Cosmo.Info.CrowdStat

    @valid_attrs %{
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

    def crowd_stat_fixture(attrs \\ %{}) do
      {:ok, crowd_stat} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Info.create_crowd_stat()

      crowd_stat
    end

    test "list_crowd_stats/0 returns all crowd_stats" do
      crowd_stat = crowd_stat_fixture()
      assert Info.list_crowd_stats() == [crowd_stat]
    end

    test "get_crowd_stat!/1 returns the crowd_stat with given id" do
      crowd_stat = crowd_stat_fixture()
      assert Info.get_crowd_stat!(crowd_stat.id) == crowd_stat
    end

    test "create_crowd_stat/1 with valid data creates a crowd_stat" do
      assert {:ok, %CrowdStat{} = crowd_stat} = Info.create_crowd_stat(@valid_attrs)
      assert crowd_stat.applications_called == "some applications_called"
      assert crowd_stat.applications_calling == "some applications_calling"
      assert crowd_stat.applications_waiting == "some applications_waiting"
      assert crowd_stat.consultations_called == "some consultations_called"
      assert crowd_stat.consultations_calling == "some consultations_calling"
      assert crowd_stat.consultations_waiting == "some consultations_waiting"
      assert crowd_stat.others_called == "some others_called"
      assert crowd_stat.others_calling == "some others_calling"
      assert crowd_stat.others_waiting == "some others_waiting"
      assert crowd_stat.permanent_residences_called == "some permanent_residences_called"

      assert crowd_stat.permanent_residences_calling ==
               "some permanent_residences_calling"

      assert crowd_stat.permanent_residences_waiting == "some permanent_residences_waiting"
      assert crowd_stat.permissions_called == "some permissions_called"
      assert crowd_stat.permissions_calling == "some permissions_calling"
      assert crowd_stat.permissions_waiting == "some permissions_waiting"
      assert crowd_stat.residence_cards_called == "some residence_cards_called"
      assert crowd_stat.residence_cards_calling == "some residence_cards_calling"
      assert crowd_stat.residence_cards_waiting == "some residence_cards_waiting"
    end

    test "create_crowd_stat/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Info.create_crowd_stat(@invalid_attrs)
    end

    test "update_crowd_stat/2 with valid data updates the crowd_stat" do
      crowd_stat = crowd_stat_fixture()
      assert {:ok, %CrowdStat{} = crowd_stat} = Info.update_crowd_stat(crowd_stat, @update_attrs)
      assert crowd_stat.applications_called == "some updated applications_called"
      assert crowd_stat.applications_calling == "some updated applications_calling"
      assert crowd_stat.applications_waiting == "some updated applications_waiting"
      assert crowd_stat.consultations_called == "some updated consultations_called"
      assert crowd_stat.consultations_calling == "some updated consultations_calling"
      assert crowd_stat.consultations_waiting == "some updated consultations_waiting"
      assert crowd_stat.others_called == "some updated others_called"
      assert crowd_stat.others_calling == "some updated others_calling"
      assert crowd_stat.others_waiting == "some updated others_waiting"
      assert crowd_stat.permanent_residences_called == "some updated permanent_residences_called"

      assert crowd_stat.permanent_residences_calling ==
               "some updated permanent_residences_calling"

      assert crowd_stat.permanent_residences_waiting ==
               "some updated permanent_residences_waiting"

      assert crowd_stat.permissions_called == "some updated permissions_called"
      assert crowd_stat.permissions_calling == "some updated permissions_calling"
      assert crowd_stat.permissions_waiting == "some updated permissions_waiting"
      assert crowd_stat.residence_cards_called == "some updated residence_cards_called"
      assert crowd_stat.residence_cards_calling == "some updated residence_cards_calling"
      assert crowd_stat.residence_cards_waiting == "some updated residence_cards_waiting"
    end

    test "update_crowd_stat/2 with invalid data returns error changeset" do
      crowd_stat = crowd_stat_fixture()
      assert {:error, %Ecto.Changeset{}} = Info.update_crowd_stat(crowd_stat, @invalid_attrs)
      assert crowd_stat == Info.get_crowd_stat!(crowd_stat.id)
    end

    test "delete_crowd_stat/1 deletes the crowd_stat" do
      crowd_stat = crowd_stat_fixture()
      assert {:ok, %CrowdStat{}} = Info.delete_crowd_stat(crowd_stat)
      assert_raise Ecto.NoResultsError, fn -> Info.get_crowd_stat!(crowd_stat.id) end
    end

    test "change_crowd_stat/1 returns a crowd_stat changeset" do
      crowd_stat = crowd_stat_fixture()
      assert %Ecto.Changeset{} = Info.change_crowd_stat(crowd_stat)
    end
  end
end
