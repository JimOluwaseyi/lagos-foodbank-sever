require "test_helper"

class AgricGalleriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agric_gallery = agric_galleries(:one)
  end

  test "should get index" do
    get agric_galleries_url, as: :json
    assert_response :success
  end

  test "should create agric_gallery" do
    assert_difference("AgricGallery.count") do
      post agric_galleries_url, params: { agric_gallery: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show agric_gallery" do
    get agric_gallery_url(@agric_gallery), as: :json
    assert_response :success
  end

  test "should update agric_gallery" do
    patch agric_gallery_url(@agric_gallery), params: { agric_gallery: {  } }, as: :json
    assert_response :success
  end

  test "should destroy agric_gallery" do
    assert_difference("AgricGallery.count", -1) do
      delete agric_gallery_url(@agric_gallery), as: :json
    end

    assert_response :no_content
  end
end
