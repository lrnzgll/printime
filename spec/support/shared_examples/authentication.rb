RSpec.shared_examples "authenticated" do |path, *method|
  it 'redirect to a devise page' do
    method = ->(p) do
      if defined?(method.first)
        public_send(method.first, p)
      else
        get p
      end
    end

    obj = obj if defined?(obj)

    method.call(public_send("#{path}_path", obj))
    expect(response).to have_http_status(302)
    expect(response).to redirect_to(new_user_session_path)
  end
end
