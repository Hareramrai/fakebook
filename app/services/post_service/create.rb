module PostService
  class Create
    PERMITTED_FIELDS = %i[
      title 
      latitude
      longitude
    ].freeze

    def call(params, current_user)
      images = params[:images]

      fields = params.slice(*PERMITTED_FIELDS)

      fields[:photos_attributes] = images.map { |image| { image: image } } if images.present?

      post = current_user.posts.build(fields)

      post.save
      post
    end
  end
end