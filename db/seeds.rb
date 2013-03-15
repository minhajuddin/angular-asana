#delete data from all tables
(ActiveRecord::Base.connection.tables - ['schema_migrations']).each do |table|
  ActiveRecord::Base.connection.execute("DELETE FROM #{table};")
end

(1..10).each do |i| 
  t = Task.create title: "Task #{i}", description: "Awesome description for Task #{i}", completed: [true,false].sample 
  (2..5).to_a.sample.times do |j|
    t.comments.create text: "Comment for #{i}#{j}"
  end
end
