10.times { |i| Task.create title: "Task #{i}", description: "Task #{i}", completed: [true,false].sample}
