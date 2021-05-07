class DashboardController < ApplicationController
  include ApplicationHelper, SessionsHelper
  
  before_action :logged_in_user
  @requested_owner = false;
  @requested_accounts = false;
  
  def index
    get_owner
    get_accounts
    get_balance
end

def expenses
    get_expenses
    render 'expenses'
end

private

  def get_owner
    if (!@requested_owner)
      response = belvo_client.owners.retrieve(link: current_session['link'])
      @owner_name = response[0]['display_name']
      @owner_email = response[0]['email']
      @institution = current_session['institution']

      @requested_owner = true;
    end
  end

  def get_balance
    response = belvo_client.balances.retrieve(
        link: current_session['link'],
        date_from: (Date.today - 30),
        options: { "date_to": Date.today }
    )
    
    @balance_data = response.collect{|balance| [balance['account']['name'], balance['current_balance']]}
  end

  def get_accounts
    if (!@requested_accounts)
      response = belvo_client.accounts.retrieve(link: current_session['link'])
      @accounts = response
      
      total_spent = @accounts.inject(0){|sum, hash| sum + hash['balance']['available'] }

      # simulate a budgeted amount using the total balance of the accounts as the max value
      @accounts.each do |account|
        account['budgeted_amount'] = rand(1000...total_spent)
      end
    
      @total_budget = @accounts.inject(0){|sum, hash| sum + hash['budgeted_amount'] }
      @percentage_spent = (total_spent/@total_budget)*100

      @requested_accounts = true
    end
  end

  def get_expenses
    response = belvo_client.transactions.retrieve(
      link: current_session['link'],
      date_from: (Date.today - 30),
      options: {"date_to": Date.today}
    )

    @expenses = response
  end
end