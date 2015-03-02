require 'lita'
require 'nokogiri'

module Lita
  module Handlers
    class CorporateBsGenerator < Handler
      route(/\bcorporate bs( please)?/i, :bs, :command => true, :help => { "corporate bs (please)" => "Spew some corporate garbage" })

      BASE_URL = "http://cbsg.sourceforge.net/cgi-bin/live"

      def bs(response)
        if (some_bs = redis.lpop("corporate-bs-generator"))
          response.reply some_bs
        else
          data = Nokogiri::HTML.parse(http.post("http://cbsg.sourceforge.net/cgi-bin/live").body)
          bs_list = data.xpath("//li").map(&:children).map { |x| x.text.strip }
          redis.lpush("corporate-bs-generator", bs_list)
          response.reply redis.lpop("corporate-bs-generator")
        end
      end
    end

    Lita.register_handler(CorporateBsGenerator)
  end
end
