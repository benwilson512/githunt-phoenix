defmodule GitHunt.Web.Schema do
  use Absinthe.Schema

  import_types __MODULE__.DBTypes
  import_types __MODULE__.GithubTypes

  @desc "A list of options for the sort order of the feed"
  enum :feed_type, values: [:hot, :new, :top]

  @desc "The type of vote to record, when submitting a vote"
  enum :vote_type, values: [:up, :down, :cancel]

  query do
    @desc "A feed of repository submissions"
    field :feed, list_of(:entry) do
      @desc "The sort order for the feed"
      arg :type, non_null(:feed_type)
      @desc "The number of items to skip, for pagination"
      arg :offset, :integer
      @desc "The number of items to fetch starting from the offset, for pagination"
      arg :limit, :integer
    end

    @desc "A single entry"
    field :entry, :entry do
      arg :repo_full_name, non_null(:string)
      @desc ~s(The full repository name from GitHub, e.g. "apollostack/GitHunt-API")
    end

    @desc "Return the currently logged in user, or null if nobody is logged in"
    field :current_user, :user do

    end
  end

  mutation do
    @desc ~s(Submit a new repository, returns the new submission)
    field :submit_repository, :entry do
      @desc ~s(The full repository name from GitHub, e.g. "apollostack/GitHunt-API")
      arg :repo_full_name, non_null(:string)
    end

    @desc "Vote on a repository submission, returns the submission that was voted on"
    field :vote, :entry do
      @desc ~s(The full repository name from GitHub, e.g. "apollostack/GitHunt-API")
      arg :repo_full_name, non_null(:string)
      @desc ~s(The type of vote - UP, DOWN, or CANCEL)
      arg :type, non_null(:vote_type)
    end

    field :submit_comment, :comment do
      @desc ~s(The full repository name from GitHub, e.g. "apollostack/GitHunt-API")
      arg :repo_full_name, non_null(:string)
      @desc "The text content for the new comment"
      arg :comment_content, non_null(:string)
    end
  end

  subscription do
    @desc "Subscription fires on every comment added"
    field :comment_added, :comment do
      @desc ~s(The full repository name from GitHub, e.g. "apollostack/GitHunt-API")
      arg :repo_full_name, non_null(:string)
    end
  end
end
