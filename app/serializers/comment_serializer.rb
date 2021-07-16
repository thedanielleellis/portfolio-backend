class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :author, :email, :content, :project_id
end
