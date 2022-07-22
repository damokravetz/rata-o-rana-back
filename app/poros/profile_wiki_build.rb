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
      image_urls: wiki_page_images_urls
    }
  end

  private

    def wiki_page_images
      @wiki_page_images ||= wiki_api.get_images(wiki_id).dig('query', 'pages', wiki_id, 'images')
    end

    def wiki_page_images_titles
      @wiki_page_images_titles ||=
        wiki_page_images.filter { |image| !image['title'].include?('svg') }.pluck('title')
    end

    def wiki_page_images_urls
      @wiki_page_images_urls ||= wiki_api.get_images_urls(wiki_page_images_titles)
                                         .dig('query', 'pages').values.pluck('imageinfo')
                                         .pluck(0).pluck('url')
    end
end
