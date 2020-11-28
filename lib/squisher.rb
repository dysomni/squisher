require "squisher/version"
require "squisher/input"
require "squisher/word"

module Squisher
  DUPLICATE_REGEX = /(\w)\1+/
  VOWEL_REGEX = /(?<!^)[aeiou]/

  DEFAULT_DELIMITER  = /[\W]+/
  DEFAULT_TOTAL_MAX  = 0
  DEFAULT_WORD_MIN   = 3
  # DEFAULT_HARD_LIMIT = false

  def self.squish(string, options={})
    Input.new(string, options).to_s
  end
end
