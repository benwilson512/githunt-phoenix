defmodule GitHunt.Repo.Migrations.AddTables do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :posted_by, :string
      add :content, :text
      add :repository_name, :string

      timestamps inserted_at: :created_at
    end

    create table(:entries) do
      add :repository_name, :string
      add :posted_by, :string
      add :hot_score, :float

      timestamps inserted_at: :created_at
    end

    create table(:votes) do
      add :entry_id, :integer
      add :vote_value, :integer
      add :username, :string

      timestamps inserted_at: :created_at
    end

    create index(:votes, [:entry_id, :username], unique: true)
  end
end
