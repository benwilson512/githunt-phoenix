defmodule GitHunt.Web.Schema.GithubTypes do
  use Absinthe.Schema.Notation

  @desc """
  A repository object from the GitHub API. This uses the exact field names returned by the
  GitHub API for simplicity, even though the convention for GraphQL is usually to camel case.
  """
  object :repository do
    @desc "Just the name of the repository, e.g. GitHunt-API"
    field :name, non_null(:string)

    @desc "The full name of the repository with the username, e.g. apollostack/GitHunt-API"
    field :full_name, non_null(:string)

    @desc "The description of the repository"
    field :description, :string

    @desc "The link to the repository on GitHub"
    field :html_url, non_null(:string)

    @desc "The number of people who have starred this repository on GitHub"
    field :stargazers_count, non_null(:integer)

    @desc "The number of open issues on this repository on GitHub"
    field :open_issues_count, :integer

    @desc "The owner of this repository on GitHub, e.g. apollostack"
    field :owner, :user
  end

  @desc "A user object from the GitHub API. This uses the exact field names returned from the GitHub API."
  object :user do
    @desc "The name of the user, e.g. apollostack"
    field :login, non_null(:string)

    @desc "The URL to a directly embeddable image for this user's avatar"
    field :avatar_url, non_null(:string)

    @desc "The URL of this user's GitHub page"
    field :html_url, non_null(:string)
  end

end
