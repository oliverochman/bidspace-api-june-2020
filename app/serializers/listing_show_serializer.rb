class ListingShowSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :category, :lead, :scene, :description, :address, :price, :images

  def images
    return nil unless object.images.attached?
    if Rails.env.test?
      rails_blob_url(object.image)
    else
      binding.pry
      object.images.service_url(expires_in:1.hour, disposition: 'inline')
    end
  end
end
