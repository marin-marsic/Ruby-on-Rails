class MainController < ApplicationController
  def home
    doc = Nokogiri::XML(open("public/info.xml"))

    @naziv = doc.css("naziv").first.text
    @vlasnik = doc.css("vlasnik").first.text
    @email = doc.css("email").first.text
    @tel = doc.css("tel").first.text
    @data = Playlist.trenutno_svira
  end
end
