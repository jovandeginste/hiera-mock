class Hiera
	module Backend
		class Mock_backend
			attr_reader :data

			def initialize(cache = nil)
				require 'yaml'

				datafile = Config[:mock][:datafile]

				@data = File.exists?(datafile) ? YAML.load(File.read(datafile)) : {}

				Hiera.debug("hiera mock initialized")
			end

			def lookup(key, scope, order_override, resolution_type)
				Hiera.debug("Looking up #{key} in yaml file")
				return @data[key] if @data.include?(key)

				Hiera.debug("Couldn't find '#{key}' -- making up random data...")

				case resolution_type
				when :array
					return random_array
				when :hash
					return random_hash
				else
					return random_string
				end
			end

			def random_array
				result = []
				size = rand(3..8)

				size.times do
					result << random_string
				end

				return result
			end

			def random_hash
				result = {}
				size = rand(3..8)

				size.times do
					result[random_string] = random_string
				end

				return result
			end

			def random_string
				chars = ['a'..'z', 'A'..'Z', '0'..'9'].flat_map(&:to_a)
				size = rand(6..16)
				return chars.sample(size).join
			end
		end
	end
end