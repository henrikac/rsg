require "option_parser"
require "random/secure"

alpha_numerics = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
digits = "1234567890"

str_len = 32
include_alpha_numerics = false
include_digits = false

parser = OptionParser.parse do |parser|
  parser.banner = <<-USAGE
  #{PROGRAM_NAME} - a tool to generate random strings.

  Usage: #{PROGRAM_NAME} [arguments]

  USAGE

  parser.on("-l LENGTH", "--length=LENGTH", "specify the length of the random string (DEFAULT 32)") do |length|
    begin
      str_len = length.to_i

      if str_len < 1
        STDERR.puts "The length of the generated string must be at least 1"
        exit(1)
      end
    rescue ArgumentError
      STDERR.puts "\"#{length}\” is not a valid length"
      STDERR.puts "\n"
      STDERR.puts parser
      exit(1)
    end
  end
  parser.on("-c", "--characters", "include characters") { include_alpha_numerics = true }
  parser.on("-d", "--digits", "include digits") { include_digits = true }
  parser.on("-h", "--help", "show help") do
    puts parser
    exit
  end
  parser.invalid_option do |flag|
    STDERR.puts "ERROR: #{flag} is not a valid option."
    STDERR.puts parser
    exit(1)
  end
end

parser.parse

if !include_alpha_numerics && !include_digits
  puts parser
  exit
end

allowed_chars = ""

if include_alpha_numerics
  allowed_chars += alpha_numerics
end

if include_digits
  allowed_chars += digits
end

counter = 0
random_str = ""

until counter == str_len
  idx = Random::Secure.rand(allowed_chars.size)
  random_str += allowed_chars[idx]
  counter += 1
end

puts random_str
