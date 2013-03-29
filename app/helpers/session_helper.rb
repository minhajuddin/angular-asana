module SessionHelper
  VERIFY_URL="https://verifier.login.persona.org/verify"

  def assertion_valid?
    assertion = params[:session][:assertion]
    audience = request.host_with_port

    return false unless assertion

    uri = URI(VERIFY_URL)
    req = Net::HTTP::Post.new(VERIFY_URL)
    req.set_form_data({assertion: assertion, audience: audience})

    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(req)
    end

    json = JSON.parse res.body
    @user = json
    json["status"] == "okay" && json["audience"] == audience
  end
end
