require 'rubygems'

Gem::Specification.new do |gem|
	gem.name = "hiera-mock"
	gem.version = "0.1.0"
	gem.license = "Apache-2.0"
	gem.summary = "Hiera backend to return data from a single yaml file or random data (meant for testing purposes)"
	gem.email = ["jo.vandeginste@kuleuven.be", "tom.leuse@kuleuven.be"]
	gem.authors = ["Jo Vandeginste", "Tom Leuse"]
	gem.homepage = "https://github.com/jovandeginste/hiera-mock"
	gem.description = <<-DESCR
Hiera backend to return data from a single yaml file or random data (meant for testing purposes)
	DESCR
	gem.require_path = "lib"
	gem.files = Dir["lib/**/*"]
end
