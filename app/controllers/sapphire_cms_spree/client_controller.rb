class SapphireCmsSpree::ClientController < Spree::BaseController
  helper 'sapphire_cms/client'
  layout 'sapphire_cms/client'

  protect_from_forgery

  after_filter :set_csrf_cookie

  def index

  end

  protected

  def set_csrf_cookie
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end

end