class User < ActiveRecord::Base
  devise :omniauthable
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password. 
      User.create!(:email => data["email"], :token => access_token['credentials']['token']) 
    end
  end
  
  def facebook
    @facebook ||= begin
      FBGraph::Client.new(:client_id => '219461168071118',
                          :secret_id => '40f66e3a471361da450c10d7c271773f' , 
                          :token => token)
    end
  end
  
end
