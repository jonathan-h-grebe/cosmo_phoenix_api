defmodule Cosmo.Info do
  @moduledoc """
  The Info context.
  """

  import Ecto.Query, warn: false
  alias Cosmo.Repo

  alias Cosmo.Info.CrowdStat

  @doc """
  Returns the list of crowd_stats.

  ## Examples

      iex> list_crowd_stats()
      [%CrowdStat{}, ...]

  """
  def list_crowd_stats do
    CrowdStat |> Repo.all()
  end

  def crowd_stats(start_dt, end_dt) do
    query =
      from c in CrowdStat,
        where: c.inserted_at >= ^start_dt.to_naive(),
        where: c.inserted_at <= ^end_dt.to_naive()

    Repo.all(query)
  end

  # maintain a cache of number of records?
  # if ids are incremental,

  @doc """
  Gets a single crowd_stat.

  Raises if the Crowd stat does not exist.

  ## Examples

      iex> get_crowd_stat!(123)
      %CrowdStat{}

  """
  def get_crowd_stat!(id), do: raise("TODO")

  @doc """
  Creates a crowd_stat.

  ## Examples

      iex> create_crowd_stat(%{field: value})
      {:ok, %CrowdStat{}}

      iex> create_crowd_stat(%{field: bad_value})
      {:error, ...}

  """
  def create_crowd_stat(attrs \\ %{}) do
    raise "TODO"
  end

  @doc """
  Updates a crowd_stat.

  ## Examples

      iex> update_crowd_stat(crowd_stat, %{field: new_value})
      {:ok, %CrowdStat{}}

      iex> update_crowd_stat(crowd_stat, %{field: bad_value})
      {:error, ...}

  """
  def update_crowd_stat(%CrowdStat{} = crowd_stat, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a CrowdStat.

  ## Examples

      iex> delete_crowd_stat(crowd_stat)
      {:ok, %CrowdStat{}}

      iex> delete_crowd_stat(crowd_stat)
      {:error, ...}

  """
  def delete_crowd_stat(%CrowdStat{} = crowd_stat) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking crowd_stat changes.

  ## Examples

      iex> change_crowd_stat(crowd_stat)
      %Todo{...}

  """
  def change_crowd_stat(%CrowdStat{} = crowd_stat, _attrs \\ %{}) do
    raise "TODO"
  end
end
