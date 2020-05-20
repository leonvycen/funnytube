# frozen_string_literal: true

# Main Controller
class MainController < ApplicationController
  def home
    @videos = ShareVideo.order(created_at: :desc)
  end
end
