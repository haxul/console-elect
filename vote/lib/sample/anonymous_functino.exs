logo_file = fn
  (:democrat) -> "donkey"
  (:repobulican) -> "elephant"
  _ -> "default"
end


file = logo_file.(:democrat)

IO.puts(file)
