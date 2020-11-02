require 'squisher'
require 'squisher/input'
require 'squisher/word'

describe Squisher do
  it "shortens a word 1" do
    expect(Squisher.squish('hello', threshold: 3, limit: 0)).to eql("hlo")
  end

  it "shortens a word 2" do
    expect(Squisher.squish('hello', threshold: 4, limit: 0)).to eql("helo")
  end

  it "shortens a word 3" do
    expect(Squisher.squish('hello', threshold: 0, limit: 0)).to eql("hl")
  end

  it "shortens a word 4" do
    expect(Squisher.squish('hello', threshold: 0, limit: 4)).to eql("helo")
  end

  it "shortens a word 5" do
    expect(Squisher.squish('hello', threshold: 0, limit: 5)).to eql("hello")
  end
end