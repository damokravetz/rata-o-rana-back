module WikiPageable
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
end