class Evento < ActiveRecord::Base
	validates :titulo, :presence => true
	validates :descripcion, :presence => true
	validates :tipo, :presence => true
	validates :categoria, :presence => true
	validates :fechai, :presence => true
	validates :estado, :presence => true
end