require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url, as: :json
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { blog_url: @project.blog_url, demo_vid: @project.demo_vid, description: @project.description, github_url: @project.github_url, image_url: @project.image_url, name: @project.name, site_url: @project.site_url } }, as: :json
    end

    assert_response 201
  end

  test "should show project" do
    get project_url(@project), as: :json
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { blog_url: @project.blog_url, demo_vid: @project.demo_vid, description: @project.description, github_url: @project.github_url, image_url: @project.image_url, name: @project.name, site_url: @project.site_url } }, as: :json
    assert_response 200
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_url(@project), as: :json
    end

    assert_response 204
  end
end
