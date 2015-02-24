class ROnlinerFetchJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    apartments = Providers::Onliner::Apartment.fetch(onliner_params)
    apartments.each do |onliner_params|
      params = Providers::Onliner::ApartmentMapper.new(onliner_params).map_to_model_params

      unless Apartment.exists?(params)
        model = Apartment.where(eid: params[:eid]).first_or_initialize
        model.update_attributes(params)

        ApartmentMailer.delay.new_apartment_notification(model)
      end
    end
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
