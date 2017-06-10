defmodule GitHunt.Github do
  alias GitHunt.Repo

  def repo_by_name(_, %{repo_full_name: name}, _) do
    repo = __MODULE__.Entry |> Repo.get_by(repository_name: name)
    {:ok, repo}
  end

  def user_by_login(_, _, _) do
    {:ok, %{}}
  end

  def comments_by_repository(_, _, _) do
    {:ok, []}
  end

  def repository(_, _, _) do
    {:ok, %{}}
  end
end
