class InquiryMailerController < ApplicationController
  def send_mail(inquiry)
    @teacher = Teacher.find(id: params[:teacher_id])
    @inquiry = inquiry
    mail(from: @current_user.email,
        to: @teacher.email,
        subject:  'お問い合わせ内容')
  end
end
