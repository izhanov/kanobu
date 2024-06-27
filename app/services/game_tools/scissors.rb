# frozen_string_literal: true

module GameTools
  class Scissors
    def ==(other)
      other.class == self.class
    end

    def >(other)
      other.class == GameTools::Paper
    end

    def <(other)
      other.class == GameTools::Rock
    end

    def to_s
      self.class.name.split('::').last.downcase
    end
  end
end
