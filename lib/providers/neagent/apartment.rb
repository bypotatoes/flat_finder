module Providers
  module Neagent
    class Apartment < Base

      def self.fetch(options = DEFAULT_OPTIONS)
        @doc = Nokogiri::HTML(self.get('/board/minsk', query: options))
        apartments_html = @doc.search('#contentIns .contentIns .ob_section_left .imd')

        apartments_html.map do |apartment_html|
          url = apartment_html.search('a').attr('href').value
          {
            uid: url.match(/\A.*_(?<uid>[\d\w]+)\z/)[:uid],
            url: url,
            price: apartment_html.search('.itm_price').text.
                                  match(/\A(?<price>[\d\s]+).*\z/)[:price].gsub(' ', ''),
            address: apartment_html.search('.imd_mid .imd_street').text
          }

        end
      end

    end
  end
end
