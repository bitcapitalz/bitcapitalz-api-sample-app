class HomeController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    if current_user != nil
      config = Devise.omniauth_configs[:doorkeeper]
      strategy = config.strategy_class.new(*config.args)
      client = strategy.client
      token = current_user.doorkeeper_access_token
      @access_token = OAuth2::AccessToken.new(client, token)
      begin
        ret = @access_token.get('/api/v1/accounts/balance').body
        result = JSON.parse(ret)
        if result['success'] == true
	  @monacoin_balance = result['monacoin_balance']
        else
	  @monacoin_balance = result['error']
        end
        ret = @access_token.get('/api/v1/addresses').body
        result = JSON.parse(ret)
        if result['success'] == true
	  @monacoin_address = result['monacoin_address']
        else
	  @monacoin_address = result['error']
        end
      rescue => e
        @monacoin_balance = e
        @monacoin_address = e
      end
    end
  end

  def send_money
    if current_user != nil
      send_to_address = params[:send_to_address]
      send_amount = params[:send_amount]
      send_message = params[:send_message]

      config = Devise.omniauth_configs[:doorkeeper]
      strategy = config.strategy_class.new(*config.args)
      client = strategy.client
      token = current_user.doorkeeper_access_token
      @access_token = OAuth2::AccessToken.new(client, token)
      begin
        result = @monacoin_balance = @access_token.post('/api/v1/transactions/send_money', {body: {to: send_to_address, amount: send_amount, note: send_message, currency_type: 'monacoin'}}).body
      rescue => e
        response = {'success' => false, 'error' => "APIエラー"}
        render :text => e.message
        return
      end
      render :json => result
      return
    else 
      response = {'success' => false, 'error' => 'ログインの必要があります'}
      render :json => response, :status => 401
      return
    end
  end
end
