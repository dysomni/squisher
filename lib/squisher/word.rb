class Word
  attr_accessor :parent, :word, :degree

  def initialize(string, parent)
    @word = string
    @parent = parent
  end

  def shorten
    @shorten ||= begin
      parent.assign_degrees unless @degree
      assign_shorten_process_variables && shorten_process_loop
      @processed_word
    end
  end

  def potential
    @potential ||= begin
      total_count = duplicates_count + vowels_count
      left = length - total_count
      total_count -= (parent.threshold - left) if left < parent.threshold
      total_count >= 0 ? total_count : 0
    end
  end

  def duplicates
    @duplicates ||= begin
      matches = []
      @word.gsub(DUPLICATE_REGEX){|m| matches << m}
      matches.sort{|m1, m2| m2.length <=> m1.length}
    end
  end

  def duplicates_count
    duplicates.map{|d| d.length - 1}.reduce(0, :+)
  end

  def vowels_count
    @word.scan(VOWEL_REGEX).size
  end

  def length
    @length ||= @word.length
  end

  def shorten?
    @parent.assign_degrees unless @degree
    @degree > 0
  end

  def to_s
    shorten
  end

  private

  def assign_shorten_process_variables
    @processed_word = @word
    @unprocessed_degree = @degree
    @unprocessed_duplicates = duplicates
  end

  def shorten_process_loop
    while @unprocessed_degree.positive?
      shorten_processed_word
      @unprocessed_degree -= 1
    end
  end

  def shorten_processed_word
    if @unprocessed_duplicates.any?
      next_duplicate = @unprocessed_duplicates.shift
      @unprocessed_duplicates.prepend(next_duplicate[0..-2]) if next_duplicate.length > 2
      return @processed_word.sub!(next_duplicate[0..1], next_duplicate[0])
    end

    @processed_word.sub!(VOWEL_REGEX, '')
  end
end