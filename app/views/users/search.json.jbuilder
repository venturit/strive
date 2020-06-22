json.array!(@users) do |user|
    json.name user.name
    json.link user_path(user)
end