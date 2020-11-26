require 'squisher'
require 'squisher/input'
require 'squisher/word'

describe Squisher do
  it "shortens a word 1" do
    expect(Squisher.squish('hello', word_min: 3, total_max: 0)).to eql("hlo")
  end

  it "shortens a word 2" do
    expect(Squisher.squish('hello', word_min: 4, total_max: 0)).to eql("helo")
  end

  it "shortens a word 3" do
    expect(Squisher.squish('hello', word_min: 0, total_max: 0)).to eql("hl")
  end

  it "shortens a word 4" do
    expect(Squisher.squish('hello', word_min: 0, total_max: 4)).to eql("helo")
  end

  it "shortens a word 5" do
    expect(Squisher.squish('hello', word_min: 0, total_max: 5)).to eql("hello")
  end
end