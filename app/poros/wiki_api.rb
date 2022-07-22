class WikiApi
  include HTTParty
  base_uri 'https://es.m.wikipedia.org/w/api.php'

  def search(squery)
    Rails.logger.info("WikiApi: Search - #{squery}")
    self.class.get('/', query: { action: 'query', list: 'search', srsearch: squery, format:'json' })
  end

  def get_images(pageid)
    Rails.logger.info("WikiApi: get_images - #{pageid}")
    self.class.get('/', query: { action: 'query', pageids: pageid, prop: 'images', format:'json' })
  end

  def get_images_urls(titles)
    Rails.logger.info("WikiApi: get_image_url - #{titles}")
    self.class.get('/', query: { action: 'query', titles: titles.join('|'), prop: 'imageinfo', iiprop: 'url', format:'json' })
  end
end
