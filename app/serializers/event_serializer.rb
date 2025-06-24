class EventSerializer < ActiveModel::Serializer
  attributes :id, :title,  :desc, :date, :time, :location, :image_url 

  def image_url
    Rails.application.routes.url_helpers.url_for(object.image) if object.image.attached?
  end
end
