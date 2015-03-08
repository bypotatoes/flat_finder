class NeagentFetchJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    apartments = Providers::Neagent::Apartment.fetch
    apartments.each do |params|
      unless Apartment.exists?(params)
        model = Apartment.where(eid: params[:eid]).first_or_initialize
        model.update_attributes(params)

        ApartmentMailer.delay.new_apartment_notification(model)
      end
    end
  end
end
