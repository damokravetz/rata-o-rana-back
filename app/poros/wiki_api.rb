class WikiApi
  include HTTParty
  base_uri 'https://es.m.wikipedia.org/w/api.php'

  def search(squery)
    self.class.get('/', query: { action: 'query', list: 'search', srsearch: squery, format:'json' })
  end

  def get_images(pageid)
    self.class.get('/', query: { action: 'query', pageids: pageid, prop: 'images', format:'json' })
  end

  def get_image_url(title)
    self.class.get('/', query: { action: 'query', titles: title, prop: 'imageinfo', iiprop: 'url', format:'json' })
  end
end
