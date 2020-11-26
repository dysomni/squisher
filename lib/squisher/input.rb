module Squisher
  class Input
    attr_accessor :words, :total_max, :word_min, :hard_limit

    def initialize(string, options={})
      set_defaults(options)
      @words = string.split(@delimiter).map{|word| Word.new(word, self)}
    end

    def set_defaults(options)
      @delimiter       = options[:delimiter]      || DEFAULT_DELIMITER
      @join_by         = options[:join_by]        || DEFAULT_JOIN_BY
      @total_max       = options[:total_max]      || DEFAULT_TOTAL_MAX
      @word_min        = options[:word_min]       || DEFAULT_WORD_MIN
      # @hard_limit      = options[:hard_limit]     || DEFAULT_HARD_LIMIT #TODO: hard limit
    end

    def length
      @length ||= @words.map(&:length).reduce(0, :+)
    end

    def assign_degrees
      return unless degrees_necesary?
      return @words.each{|w| w.degree = w.potential} unless delegation_necesary?
      delegate
    end

    def potential_sum
      @words.map(&:potential).reduce(0, :+)
    end

    def to_s
      @to_s ||= @words.map(&:to_s).join(@join_by)
    end

    private

    def degrees_necesary?
      return true if @total_max < length

      @words.each{|w| w.degree = 0}
      false
    end

    def delegation_necesary?
      @total_max > (length - potential_sum)
    end

    def delegate
      assign_delegate_process_variables
      delegate_process_loop
    end

    def assign_delegate_process_variables
      @needed_degrees = length - @total_max
      @unprocessed_potential = potential_sum
      @unprocessed_words = @words.sort{|w1, w2| w1.length <=> w2.length}
    end

    def delegate_process_loop
      while @unprocessed_words.any?
        word = @unprocessed_words.pop
        result = ((word.potential / @unprocessed_potential.to_f) * @needed_degrees.to_f)
        word.degree = result.nan? ? 0 : result.ceil
        @unprocessed_potential -= word.potential
        @needed_degrees -= word.degree
      end
    end
  end
end