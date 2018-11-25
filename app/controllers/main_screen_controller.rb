# frozen_string_literal: true

class MainScreenController < ApplicationController
  before_action :authenticate_user!

  def index; end
end
