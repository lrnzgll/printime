RSpec.shared_examples "authenticated" do |path|
  it 'redirect to a devise page' do
    obj = obj if defined?(obj)
    get public_send("#{path}_path", obj)

    expect(response).to have_http_status(302)
    expect(response).to redirect_to(new_user_session_path)
  end
end