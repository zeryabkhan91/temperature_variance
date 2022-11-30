# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
  DataSet.delete_all
  numbers = [*-100..100]
  (DateTime.now.to_i..10.minutes.from_now.to_i).step(1.second).each do |time|
    puts "Creating DataSet at time"
    puts Time.at(time)
    DataSet.create!(temperature: numbers.sample, recorded_at: Time.at(time))
  end

