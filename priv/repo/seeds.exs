alias GitHunt.{Github, Repo}

for schema <- [Github.Comment, Github.Entry, Github.Vote], do: Repo.delete_all(schema)

repos = [
  %{
    repository_name: "apollographql/apollo-client",
    posted_by: "stubailo",
    votes: [
      %Github.Vote{username: "stubailo", vote_value: 1},
      %Github.Vote{username: "helfer", vote_value: 1},
    ],
  },
  %{
    repository_name: "apollographql/graphql-server",
    posted_by: "helfer",
    votes: [
      %Github.Vote{username: "helfer", vote_value: 1},
    ]
  },
  %{
    repository_name: "meteor/meteor",
    posted_by: "tmeasday",
  },
  %{
    repository_name: "twbs/bootstrap",
    posted_by: "Slava",
  },
  %{
    repository_name: "d3/d3",
    posted_by: "Slava",
  },
  %{
    repository_name: "angular/angular.js",
    posted_by: "Slava",
  },
  %{
    repository_name: "facebook/react",
    posted_by: "Slava",
  },
  %{
    repository_name: "jquery/jquery",
    posted_by: "Slava",
  },
  %{
    repository_name: "airbnb/javascript",
    posted_by: "Slava",
  },
  %{
    repository_name: "facebook/react-native",
    posted_by: "Slava",
  },
  %{
    repository_name: "torvalds/linux",
    posted_by: "Slava",
  },
  %{
    repository_name: "daneden/animate.css",
    posted_by: "Slava",
  },
  %{
    repository_name: "electron/electron",
    posted_by: "Slava",
  },
  %{
    repository_name: "docker/docker",
    posted_by: "Slava",
  },
]

entries = for repo <- repos do
  Github.Entry
  |> struct(repo)
  |> Map.put(:hot_score, :rand.uniform)
  |> Repo.insert!
end
