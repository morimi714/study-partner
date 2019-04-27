class HomeController < ApplicationController
  before_action :forbid_login_teacher, {only: [:top]}
  def top
  end
end
