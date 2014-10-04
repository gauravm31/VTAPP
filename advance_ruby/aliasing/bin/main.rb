require_relative '../lib/hello'

say = Hello.new
say.greet
say.greet_without_logger
say.greet_with_logger
