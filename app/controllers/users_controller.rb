# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @user = User.all
  end
end
