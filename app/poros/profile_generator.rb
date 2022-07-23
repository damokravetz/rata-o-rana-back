class ProfileGenerator
  def initialize(squery)
    @squery = squery
  end

  def self.call(squery:)
    self.new(squery).call
  end

  def call
     profile 
  end

  private

    attr_reader :squery

    def profile
      Profile.find_by!(wiki_id:)
    rescue ActiveRecord::RecordNotFound
      Profile.create!(wiki_profile)
    end

    def wiki_search
      @wiki_search ||= ProfileWikiSearch.call(squery:)
    end

    def wiki_profile
      @wiki_profile ||= ProfileBuild.call(squery:, wiki_page:)
    end

    def wiki_page
      wiki_search[:wiki_page]
    end

    def wiki_id
      wiki_search[:wiki_id]
    end
end
