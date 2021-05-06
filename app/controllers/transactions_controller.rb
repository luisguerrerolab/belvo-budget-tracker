class TransactionsController < ApplicationController
  before_action :logged_in_user
  def index
    @transactions = '0'
  end
end
