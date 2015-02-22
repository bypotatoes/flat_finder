module Providers
  module Onliner
    class Base
      include HTTParty
      base_uri 'https://ak.api.onliner.by/'
    end
  end
end
