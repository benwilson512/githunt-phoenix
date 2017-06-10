defmodule GitHunt.Github.Vote do
  use Ecto.Schema

  schema "votes" do
    belongs_to :entry, GitHunt.Github.Entry

    field :vote_value, :integer
    field :username, :string

    timestamps inserted_at: :created_at
  end
end
