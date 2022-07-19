class ProfileWikiSearch
  def initialize(squery)
    @squery = squery
  end

  def self.call(squery)
    self.new(squery).call
  end

  def call
    {
      name: wiki_name,
      wiki_id: wiki_id,
      image_urls: [ wiki_page_first_image_url ]
    }
  end

  # private

    attr_reader :squery

    def wiki_api
      @wiki_api ||= WikiApi.new
    end

    def wiki_page
      @wiki_page ||= wiki_api.search(squery).dig('query', 'search', 0)
    end

    def wiki_id
      @wiki_id ||= wiki_page['pageid'].to_s
    end

    def wiki_name
      @wiki_name ||= wiki_page['title']
    end

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
