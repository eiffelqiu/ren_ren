require 'teststrap'

context "RenRen API Tests: " do
  setup do
    RenRen::Base.new(RenRen::Config.access_token)
  end

  context "[user info]" do
    asserts("user info is not null") { !topic.api().empty? }
    asserts("user's sex") { topic.api()[0]['sex'] == 1 }
    asserts("user's uid") { topic.api()[0]['uid'] == 433516336 }
    asserts("user's name") { topic.api()[0]['name'] == "锐思互动" }
  end
  
  context "[feed info]" do
    setup do
      topic.api({:method => "feed.get", 
                      :uid => topic.api()[0]['uid'], 
                      :type => "10,11,20,21,22,23,30,31,32,33,34,35,36,40,41,50,51,52,53,54,55" })
    end
    asserts("feed info is not null") { !topic.empty? }
    asserts("feed size") {  topic.size == 10 }
  end  
end
