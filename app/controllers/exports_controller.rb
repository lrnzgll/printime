class ExportsController < ApplicationController
  before_action :skip_authorization, only: [:home]
  def home
  end
end
