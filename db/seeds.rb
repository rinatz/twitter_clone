# ユーザー作成
users = []
["Alice", "Bob", "Charlie", "David", "Eve"].each do |name|
  users << User.create!(name: name)
end

# ダミーツイート作成（Aliceは最初ツイートなし）
users.each do |user|
  next if user.name == "Alice"  # Aliceは自分でツイートするので最初はなし

  10.times do
    Tweet.create!(content: "This is a dummy tweet from #{user.name}", user: user)
  end
end

puts "Seed data created!"
