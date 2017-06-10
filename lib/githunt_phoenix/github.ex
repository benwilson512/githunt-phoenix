defmodule GitHunt.Github do
  alias GitHunt.Repo

  def repo_by_name(_, %{repo_full_name: name}, _) do
    repo = __MODULE__.Entry |> Repo.get_by(repository_name: name)

    repo = Map.merge(repo, %{comments: [
       %{content: "asdf",
         created_at: 1497065675159, id: 5,
         posted_by: %{html_url: "https://github.com/benwilson512", login: "benwilson512"}},
       %{content: "df", created_at: 1497065639866, id: 4,
         posted_by: %{html_url: "https://github.com/benwilson512", login: "benwilson512"}},
       %{content: "asdf", created_at: 1497065632429, id: 3,
         posted_by: %{html_url: "https://github.com/benwilson512", login: "benwilson512"}},
       %{content: "asdf", created_at: 1497065598232, id: 2,
         posted_by: %{html_url: "https://github.com/benwilson512", login: "benwilson512"}},
       %{content: "asdf", created_at: 1497065577273, id: 1,
         posted_by: %{html_url: "https://github.com/benwilson512", login: "benwilson512"}}],
      created_at: 1497065513683, id: 1,
      posted_by: %{html_url: "https://github.com/stubailo", login: "stubailo"},
      repository: %{description: ":rocket: A fully-featured, production ready caching GraphQL client for every server or UI framework",
        full_name: "apollographql/apollo-client",
        html_url: "https://github.com/apollographql/apollo-client",
        open_issues_count: 65, stargazers_count: 2974}}
    )

    repo |> IO.inspect
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
