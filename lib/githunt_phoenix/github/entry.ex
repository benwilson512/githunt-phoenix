defmodule GitHunt.Github.Entry do
  use Ecto.Schema

  schema "entries" do
    field :repository_name, :string
    field :posted_by, :string
    field :hot_score, :float

    has_many :votes, GitHunt.Github.Vote

    timestamps inserted_at: :created_at
  end
end
