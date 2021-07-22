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
  {
    name: "Hidden Gems Mentorship",
    description: "A workplace mentoring application that allows users to choose a mentor specifically for their work department. I utilized RESTful APIs and CRUD methodology to build a single page web
    application that allows all interactions between the client and the server to be handled with AJAX and use JSON as the communication format. <br>
    Languages/Frameworks: Ruby on Rails, PostgreSQL, JavaScript, HTML/CSS, Bootstrap, ActiveRecord",
    image_url: "mentorship.png",
    github_url: "https://github.com/thedanielleellis/HiddenGemsMentorship",
    blog_url: "https://dev.to/thedanielleellis/my-first-javascript-rails-project-99h"
  },

  {
    name: "Virtual Dance Machine",
    description: "An application that allows virtual dance class registration and tracking. This is a Content Management System that allows tracking features through the
    backend utilization of Ruby on Rails and self-generated RESTful API’s. A sleek and clean frontend to allow users to access classes. <br>
    Languages/Framweorks: Ruby on Rails, JavaScript, HTML/CSS",
    image_url: "dance.png",
    github_url: "https://github.com/thedanielleellis/Virtual-Dance-Machine",
    blog_url: "https://dev.to/thedanielleellis/my-first-javascript-rails-project-99h",
    comments: {
      author: "John Doe",
      email: "john@gmail.com",
      content: "Great Project!"
    }
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