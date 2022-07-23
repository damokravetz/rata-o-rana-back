class ProfileBuild
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
      description: google_desc,
      wiki_id: wiki_id,
      image_urls: google_images
    }
  end

  private

    # Wiki image search. Remove is unecessary.

    # def wiki_page_images
    #   @wiki_page_images ||= wiki_api.get_images(wiki_id).dig('query', 'pages', wiki_id, 'images')
    # end

    # def wiki_page_images_titles
    #   @wiki_page_images_titles ||=
    #     wiki_page_images.filter { |image| !image['title'].include?('svg') }.pluck('title')
    # end

    # def wiki_page_images_urls
    #   @wiki_page_images_urls ||= wiki_api.get_images_urls(wiki_page_images_titles)
    #                                      .dig('query', 'pages').values.pluck('imageinfo')
    #                                      .pluck(0).pluck('url')
    # end

    def google_desc
      google_api.search.dig(:knowledge_graph, :type)
    end

    def google_images
      google_api.get_images[:images_results].take(5).pluck(:original)
    end

    def google_api
      @google_api ||= GoogleApi.new(squery)
    end
end
