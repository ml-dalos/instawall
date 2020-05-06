class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @account = Account.from_omniauth(request.env['omniauth.auth'])
    binding.pry

    sign_in_and_redirect @account
  end
end