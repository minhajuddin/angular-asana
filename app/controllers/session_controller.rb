class SessionController < ApplicationController
  include SessionHelper

  respond_to :html, :json

  def new
  end

  def create
    respond_with @user,location: 'nil' if assertion_valid?
  end

  def destroy
  end
end
