class InquiryController < ApplicationController
  def new
    # 入力画面を表示
    @inquiry = Inquiry.new
    render :action => 'new'
  end
 
  def confirm
    # 入力値のチェック
    @inquiry = Inquiry.new(inquiry_params)
    # if @inquiry.valid?
    #   # OK。確認画面を表示
    #   render :action => 'confirm'
    # else
    #   # NG。入力画面を再表示
    #   render :action => 'new'
    # end
  end
 
  def thanks
    # メール送信
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.send_email(@inquiry).deliver
 
    # 完了画面を表示
    render :action => 'thanks'
  end
  
  private
  def inquiry_params
    params.require(:inquiry).permit(:body, :teacher_id, :user_id)
  end
end
