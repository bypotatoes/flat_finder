class ROnlinerFetchJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    appartments = Providers::Onliner::Appartment.fetch(onliner_params)
  end

  def onliner_params
    {
      rent_type: ['1_room'],
      only_owner: true,
      price: {
        min: 3000000,
        max: 4500000
      }
    }
  end
end
