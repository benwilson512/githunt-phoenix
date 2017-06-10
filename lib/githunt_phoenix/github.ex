defmodule GitHunt.Github do
  alias GitHunt.Repo

  import Ecto.Query

  def repo_by_name(_, %{repo_full_name: name}, _) do
    repo = __MODULE__.Entry
      |> Repo.get_by(repository_name: name)

    comments = __MODULE__.Comment |> where(repository_name: ^name) |> Repo.all

    repo = Map.merge(repo, %{
      comments: comments,
      posted_by: %{html_url: "https://github.com/stubailo", login: "stubailo"},
      repository: %{
        description: ":rocket: A fully-featured, production ready caching GraphQL client for every server or UI framework",
        full_name: "apollographql/apollo-client",
        html_url: "https://github.com/apollographql/apollo-client",
        open_issues_count: 65, stargazers_count: 2974,
      }
    })

    {:ok, repo}
  end

  def submit_comment(_, %{repo_full_name: repo, comment_content: content}, _) do
    comment = %__MODULE__.Comment{
      repository_name: repo,
      content: content,
      posted_by: "benwilson512"
    } |> Repo.insert!

    {:ok, comment}
  end

  def user_by_login(_, _, _) do
    {:ok, %{html_url: "https://github.com/benwilson512", login: "benwilson512"}}
  end

  def comments_by_repository(_, _, _) do
    {:ok, []}
  end

  def repository(_, _, _) do
    {:ok, %{}}
  end

  def created_at(parent, _, _) do
    case Map.fetch(parent, :created_at) do
      {:ok, value} ->
        {:ok, value} = value |> DateTime.from_naive("Etc/UTC")
        {:ok, DateTime.to_unix(value) * 1000}
      _ ->
        {:ok, nil}
    end
  end
end
