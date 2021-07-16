class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :image_url, :github_url, :demo_vid, :site_url, :blog_url
end
