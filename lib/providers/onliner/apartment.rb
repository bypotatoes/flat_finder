module Providers
  module Onliner
    class Apartment < Base

      def self.fetch(options = {})
        resp = self.get('/search/apartments', query: options)
        resp.fetch('apartments')
      end

    end
  end
end
