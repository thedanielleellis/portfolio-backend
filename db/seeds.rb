# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Running DB seed..."

puts "Dropping DB..."
Project.destroy_all
Comment.destroy_all



project_data = [
  # Project #1
  {
    name: "Test 1",
    description: "This is a test",
    image_url: "test.png",
    site_url: "https://test.com",
  },
  # Project #2
  {
    name: "Test 2",
    description: "Test again",
    image_url: "test.jpg",
    github_url: "http://github.com/thedanielleellis",
    site_url: "http://test.com",
    blog_url: "http://dev.to",
    demo_vid: "https://www.youtube.com/",
    comments: {
      author: "John Doe",
      email: "john@gmail.com",
      content: "Great Project!"
    }
  },

  # Project 3
  {
    name: "Test 3",
    description: "Test 3 description",
    image_url: "test3.png",
    github_url: "http://github.com/thedanielleellis",
    blog_url: "http://dev.to/",
    demo_vid: "https://www.youtube.com/",
  }
]

puts "Creating projects..."

project_data.each do |data|
  project = Project.create(
    name: data[:name],
    description: data[:description],
    image_url: data[:image_url],
    github_url: data[:github_url],
    site_url: data[:site_url],
    blog_url: data[:blog_url],
    demo_vid: data[:demo_vid]
  )


  # Create Comment
  puts "Adding comments for project - #{project.name}..."
  comment_data = data[:comments]
  unless comment_data.nil?
    c = Comment.new
    c.project_id = project.id
    comment_data.each do |key, value|
      c[key] = value
      # c.email = comment[:email]
      # c.content = comment[:content]
    end
    c.save!
  end
end