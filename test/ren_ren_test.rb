require 'teststrap'

context "ren_ren" do
  setup do
    RenRen::Base.new(RenRen::Config.access_token)
  end

  context "user info" do
    asserts("user info is not null") { !topic.api().empty? }
    asserts("user's sex") { topic.api()[0]['sex'] == 1 }
    asserts("user's uid") { topic.api()[0]['uid'] == 433516336 }
    asserts("user's name") { topic.api()[0]['name'] == "锐思互动" }
  end
  
  context "feed info" do
    asserts("user info is not null") { !topic.api().empty? }
    asserts("feed info is not null") { !topic.api({:method => "feed.get", :uid => topic.api()[0]['uid']}).empty? }
  end  
end
