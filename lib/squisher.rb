require "squisher/version"
require "squisher/input"
require "squisher/word"

module Squisher
  DUPLICATE_REGEX = /(\w)\1+/
  VOWEL_REGEX = /(?<!^)[aeiou]/

  DEFAULT_DELIMITER  = /\s+/
  DEFAULT_JOIN_BY    = ' '
  DEFAULT_LIMIT      = 0
  # DEFAULT_HARD_LIMIT = false
  DEFAULT_THRESHOLD  = 3

  def self.squish(string, options={})
    Input.new(string, options).to_s
  end
end
