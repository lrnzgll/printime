RSpec.shared_examples "authenticated" do |path, *method|
  it 'redirect to a devise page' do
    m = ->(p) do
      if method.first
        public_send(method.first, p)
      else
        get p
      end
    end
    m.call(public_send("#{path}_path", jj))
    expect(response).to have_http_status(302)
    expect(response).to redirect_to(new_user_session_path)
  end
end
