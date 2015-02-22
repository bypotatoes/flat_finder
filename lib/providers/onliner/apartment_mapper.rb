module Providers
  module Onliner
    class ApartmentMapper

      def initialize(onliner_params)
        @onliner_params = onliner_params
      end

      def map_to_model_params
        location = @onliner_params.delete('location')
        price = @onliner_params.delete('price')

        {
          eid: @onliner_params.delete('id'),
          price: price['usd'],
          rent_type: @onliner_params['rent_type'],
          url: @onliner_params['url'],
          address: location['address'],
          latitude: location['latitude'],
          longitude: location['longitude']
        }
      end

    end
  end
end
