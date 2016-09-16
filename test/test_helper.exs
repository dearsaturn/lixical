ExUnit.configure(exclude: [skip: true])
ExUnit.start()
"./test/support/helpers"
  |> Path.join("**/*.exs")
  |> Path.wildcard()
  |> Enum.map(&Code.require_file/1)
