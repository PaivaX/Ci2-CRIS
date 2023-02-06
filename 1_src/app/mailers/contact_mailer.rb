class ContactMailer < ApplicationMailer
    def new_order_email
      @order = params[:order]
  
      mail(to: "rui.paiva88@gmail.com", subject: "Contact form!")
    end
  end