class ApartmentMailer < ActionMailer::Base

  TO_EMAIL = 'bypotatoes@gmail.com'
  FROM_EMAIL = 'noreply@flatfinder.com'

  def new_apartment_notification(apartment)
    mail to: TO_EMAIL,
       from: FROM_EMAIL,
    subject: 'New apartment is available',
       body: "link: #{apartment.url}"
  end

end
