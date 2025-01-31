require 'watir'
require 'webdrivers'

class Updater
  def initialize
    @browser = Watir::Browser.new :firefox
    @browser.goto 'http://www.bandmix.com' 
  end

  def sign_in
    cred = Rails.application.credentials.bandmix
    br = @browser
    br.link(:id =>"sign-in").click

    email = br.text_field id: 'login-email'
    email.set cred[:email]
    pw = br.text_field id: 'login-password'
    pw.set cred[:pw]
    br.button(type: 'submit').click 
  end

  def update_profiles
    br = @browser
    Profile.all.each do |prof|
      br.goto prof.url
      txt = br.element(:tag_name => 'strong').text
      puts 'text: ' + txt.to_s
      sleep 3
    end
  end

end

namespace :watir do
  desc "TODO"
  task update_data: :environment do    

    upd = Updater.new    
    sleep 2
    upd.sign_in
    upd.update_profiles   
    puts 'click'
   
    sleep 10
  end

end
