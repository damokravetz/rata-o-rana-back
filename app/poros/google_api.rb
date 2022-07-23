class GoogleApi
  def initialize(squery)
    @squery = squery
  end

  def search
    Rails.logger.info("GoogleApi: search - #{squery}") if @search.blank?
    @search ||= GoogleSearch.new(params).get_hash
  end

  def get_images
    Rails.logger.info("GoogleApi: get_images - #{squery}") if @get_images.blank?
    @get_images ||= GoogleSearch.new(params.merge(tbm: 'isch')).get_hash
  end

  private

    attr_reader :squery

    def params
      {
        api_key: Rails.application.credentials[:google_api_key],
        engine: 'google',
        q: squery,
        location: 'Buenos Aires, Buenos Aires, Argentina',
        google_domain: 'google.com.ar',
        gl: 'ar',
        hl: 'es'
      }
    end
end
