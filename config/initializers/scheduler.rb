require 'rufus-scheduler'

scheduler = Rufus::Scheduler::singleton
t = Time.now
@first = t - t.min*60 - t.sec + 1.hour

# jobs go below here.

# generiranje liste na svaki puni sat
scheduler.every '1h', :first_at => @first do
  now = Time.now + 1.hour
  puts @first
  File.open("public/playlist.m3u8", "w+") do |f|
    @p = Playlist.where('datum_izvrsenja >= :todayA and datum_izvrsenja <= :todayB', :todayA  => now - 5*60, :todayB => now + 5*60).order(:datum_izvrsenja).first

      if @p.blank? then
        #ne postoji playlista
        #pusti neku drugu

        puts "NEMA"
        @p = Playlist.all.first
        @t = @p.sadrzi_zapis.order(:mjesto)
        @t.each do |t|
          f.puts Track.find(t.id_zapis).path.current_path
        end
      else
        puts "IMA"
        @t = @p.sadrzi_zapis.order(:mjesto)
        @t.each do |t|
          f.puts Track.find(t.id_zapis).path.current_path
        end
      end
  end
  @p.update_attribute(:izvrsen, @p.izvrsen + 1)
  system('start winamp "public\playlist.m3u8"')
end

# obvijest adminu da urednik nije napravio playlistu
scheduler.every '1h', :first_at => Time.now + 1.day do
  puts @first
  timeA = Time.now + 1.day - 60*60
  timeB = Time.now + 1.day
  @p = Playlist.where('datum_izvrsenja >= :tomorrowA and datum_izvrsenja <= :tomorrowB', :tomorrowA  => timeA, :tomorrowB => timeB).order(:datum_izvrsenja).first

  if @p.blank? then
    @urednici = User.urednici
    @urednici.each do |u|
      a = u.termin_urednika.hour
      if a >= timeA.hour && a<= timeB.hour then
        UserMailer.lazy_editor(u).deliver
        return
      end
    end
  end
end