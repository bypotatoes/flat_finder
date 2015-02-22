module Providers
  module Onliner
    class Appartment < Base

      def self.fetch(options = {})
        resp = self.get('/search/apartments', query: options)
        resp.fetch('appartments')
      end

    end
  end
end
