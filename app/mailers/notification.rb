class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.order_confirmation.subject
  #
  def order_confirmation(ord)
    @order = ord
    mail to: "#{ord.user.email}",  subject: "Your order has been confirmed - #{ord.order_number}"
  end
end
