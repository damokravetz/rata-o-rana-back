class ProfileWikiSearch
  include WikiPageable

  def initialize(squery)
    @squery = squery
  end

  def self.call(squery:)
    self.new(squery).call
  end

  def call
    { wiki_page:, wiki_id:, name: wiki_name }
  end
end
