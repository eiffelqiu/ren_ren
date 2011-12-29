require 'teststrap'
require 'json'

context "ren_ren" do
  setup do
    RenRen::Base.new(RenRen::Config.access_token).api()
  end

  context "user info" do
    asserts("user info is not null") { !topic.empty? }
    asserts("user's sex") { topic[0]['sex'] == 1 }
    asserts("user's uid") { topic[0]['uid'] == 433516336 }
    asserts("user's name") { topic[0]['name'] == "锐思互动" }
  end
end
