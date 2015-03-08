module Providers
  module Neagent
    class Base
      include HTTParty
      base_uri 'http://neagent.by/'

      DEFAULT_OPTIONS = {catid: 1, roomCount: 1, priceMax: 4500000}
    end
  end
end
