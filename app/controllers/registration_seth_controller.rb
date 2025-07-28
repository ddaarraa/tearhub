class RegistrationSethController < ApplicationController
  def seth
    @user = User.new
  end
end