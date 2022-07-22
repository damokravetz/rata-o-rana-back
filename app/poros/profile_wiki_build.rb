class ProfileWikiBuild
  include WikiPageable

  def initialize(squery, wiki_page)
    @squery = squery
    @wiki_page = wiki_page
  end

  def self.call(squery: nil, wiki_page: nil)
    self.new(squery, wiki_page).call
  end

  def call
    {
      name: wiki_name,
      wiki_id: wiki_id,
      image_urls: [ wiki_page_first_image_url ]
    }
  end

  private

    def wiki_page_images
      @wiki_page_images ||= wiki_api.get_images(wiki_id).dig('query', 'pages', wiki_id, 'images')
    end

    def wiki_page_first_image_title
      @wiki_page_first_image_title ||=
        wiki_page_images.find { |image| !image['title'].include?('svg') }['title']
    end

    def wiki_page_first_image_url
      @wiki_page_first_image_url ||= wiki_api.get_image_url(wiki_page_first_image_title)
                                             .dig('query', 'pages', '-1', 'imageinfo', 0, 'url')
    end
end
