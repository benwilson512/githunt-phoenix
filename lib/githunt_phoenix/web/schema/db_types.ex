defmodule GitHunt.Web.Schema.DBTypes do
  use Absinthe.Schema.Notation

  @desc "A comment about an entry, submitted by a user"
  object :comment do
    @desc "The SQL ID of this entry"
    field :id, non_null(:integer)

    @desc "The GitHub user who posted the comment"
    field :posted_by, non_null(:user)

    @desc "A timestamp of when the comment was posted"
    field :created_at, non_null(:float) # Actually a date

    @desc "The text of the comment"
    field :content, non_null(:string)

    @desc "The repository which this comment is about"
    field :repo_name, non_null(:string)
  end

  object :vote do
    field :vote_value, non_null(:integer)
  end

  @desc "Information about a GitHub repository submitted to GitHunt"
  object :entry do
    @desc "Information about the repository from GitHub"
    field :repository, non_null(:repository)

    @desc "The GitHub user who submitted this entry"
    field :posted_by, non_null(:user)

    @desc "A timestamp of when the entry was submitted"
    field :created_at, non_null(:float) # Actually a date

    @desc "The score of this repository, upvotes - downvotes"
    field :score, non_null(:integer)

    @desc "The hot score of this repository"
    field :hot_score, non_null(:float)

    @desc "Comments posted about this repository"
    field :comments, list_of(:comment) do
      arg :limit, :integer
      arg :offset, :integer
    end

    @desc "The number of comments posted about this repository"
    field :comment_count, non_null(:integer)

    @desc "The SQL ID of this entry"
    field :id, non_null(:integer)

    @desc "XXX to be changed"
    field :vote, non_null(:vote)
  end
end
