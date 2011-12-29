require 'teststrap'

context "ren_ren" do
  setup do
    RenRen::Base.new(RenRen::Config.access_token)
  end

  context "get user info" do
    asserts("user info is not null") { !topic.api().empty? }
  end
end
