require 'single_sign_on'

class DiscourseSsoController < ApplicationController
  def sso
    secret = "MY_SECRET_STRING"
    sso = SingleSignOn.parse(request.query_string, secret)
    sso.email = current_user.email # from devise
    # sso.name = current_user.full_name # from devise
    sso.username = current_user.email # from devise
    sso.external_id = current_user.id # from devise
    sso.sso_secret = secret

    redirect_to sso.to_url("http://discourse.emedia.com/session/sso_login")
  end
end
