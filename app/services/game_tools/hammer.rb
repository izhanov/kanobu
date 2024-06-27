# frozen_string_literal: true

module GameTools
  class Hammer
    def to_s
      "hammer"
    end

    def ==(other)
      other.class == self.class
    end

    def >(other)
      other.class == GameTools::Rock || other.class == GameTools::Scissors
    end

    def <(other)
      other.class == GameTools::Paper
    end
  end
end
