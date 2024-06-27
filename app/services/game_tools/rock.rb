# frozen_string_litearl: true

module GameTools
  class Rock
    def ==(other)
      other.class == self.class
    end

    def >(other)
      other.class == GameTools::Scissors
    end

    def <(other)
      other.class == GameTools::Paper
    end

    def to_s
      self.class.name.split('::').last.downcase
    end
  end
end
