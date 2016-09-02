class Template < ActiveRecord::Base
	has_many :compatibles
	has_many :secondlists
	has_many :tablas
end
