require 'rubygems'
require 'rufus/scheduler'

## to start scheduler
scheduler = Rufus::Scheduler.start_new

## It will print message every i minute
scheduler.every("5s") do

	eve_ = Evento.find(:all, :limit =>10, :conditions => ["estado = 'P' AND fechai = ?", Date.today])
	
	eve_.each do |eventox|
		puts("El dia de hoy se realizara el evento: " + eventox.titulo)
		eventox.estado = "E"
		eventox.save
	end


  #puts("HELLO #{Time.now}")
  #a = Evento.new
  #a.titulo = "Noticia"
  #a.categoria = "noticia"
  #a.fechai = "2012-12-12"
  #a.save
  #puts("Evento: " + a.titulo)
end

## Prints the message every day at noon
#scheduler.cron("0,2 * * * *") do
#  puts("HI #{Time.now}")
#end

#scheduler.in '20m' do
#  puts "order butter"
#end

#scheduler.at 'Thu Mar 26 07:31:43 +0900 2009' do
#  puts 'order pizza'
#end

#scheduler.cron '0 22 * * 1-5' do
  # every day of the week at 22:00 (10pm)
#  puts 'activate security system'
#end

#scheduler.every '5m' do
#  puts 'check status report'
#end