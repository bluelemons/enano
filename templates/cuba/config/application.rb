require 'cuba'

ENV['ENV'] ||= 'development'
require "./config/#{ ENV['ENV'] }"
