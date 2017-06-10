defmodule GitHunt.Github.Comment do
  use Ecto.Schema

  schema "comments" do
    field :posted_by, :string
    field :content, :string
    field :repository_name, :string

    timestamps inserted_at: :created_at
  end
end
