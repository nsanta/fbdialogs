module FBDialogs
  
  BASE_URL = {:mobile => "http://m.facebook.com/dialog" , 
              :desktop => "http://www.facebook.com/dialog" }.freeze
  
  def self.feed(app_id, redirect_uri, options = {} , device = :desktop)
    build_dialog_url(app_id, redirect_uri,device,'feed',options)
  end
  
  def self.friends(app_id, redirect_uri, options = {} , device = :desktop)
    build_dialog_url(app_id, redirect_uri,device,'friends',options)
  end
  
  
  def self.oauth(app_id, redirect_uri, options = {} , device = :desktop)
    build_dialog_url(app_id, redirect_uri,device,'oauth',options)
  end
  
  def self.pay(app_id, redirect_uri, options = {} , device = :desktop)
    build_dialog_url(app_id, redirect_uri,device,'pay',options)
  end
  
  
  def self.build_dialog_url(app_id, redirect_uri,device,dialog,options)
    options.merge!(:app_id => app_id , :redirect_uri => redirect_uri)
    [[BASE_URL[device],dialog].join('/') , options.to_a.map{|p| p.join('=')}.join('&')].join('?')
  end
  
end
