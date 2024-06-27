# frozen_string_literal: true

module GameTools
  class Paper
    def ==(other)
      other.class == self.class
    end

    def >(other)
      other.class == GameTools::Rock
    end

    def <(other)
      other.class == GameTools::Scissors
    end

    def to_s
      self.class.name.split('::').last.downcase
    end
  end
end
