require "squisher/version"
require "squisher/input"
require "squisher/word"

module Squisher
  DUPLICATE_REGEX = /(\w)\1+/
  VOWEL_REGEX = /(?<!^)[aeiou]/

  DEFAULT_DELIMITER  = /\s+/
  DEFAULT_JOIN_BY    = ' '
  DEFAULT_TOTAL_MAX  = 0
  # DEFAULT_HARD_LIMIT = false
  DEFAULT_WORD_MIN   = 3

  def self.squish(string, options={})
    Input.new(string, options).to_s
  end
end
