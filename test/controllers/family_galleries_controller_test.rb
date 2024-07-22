require "test_helper"

class FamilyGalleriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @family_gallery = family_galleries(:one)
  end

  test "should get index" do
    get family_galleries_url, as: :json
    assert_response :success
  end

  test "should create family_gallery" do
    assert_difference("FamilyGallery.count") do
      post family_galleries_url, params: { family_gallery: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show family_gallery" do
    get family_gallery_url(@family_gallery), as: :json
    assert_response :success
  end

  test "should update family_gallery" do
    patch family_gallery_url(@family_gallery), params: { family_gallery: {  } }, as: :json
    assert_response :success
  end

  test "should destroy family_gallery" do
    assert_difference("FamilyGallery.count", -1) do
      delete family_gallery_url(@family_gallery), as: :json
    end

    assert_response :no_content
  end
end
