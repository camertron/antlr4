class DFAState
  attr_accessor :stateNumber
  @stateNumber = -1


  attr_accessor :configs
  @configs = ATNConfigSet.new()


  attr_accessor :edges
  @edges = []

  attr_accessor :isAcceptState
  @isAcceptState = false


  attr_accessor :prediction

  attr_accessor :lexerActionExecutor


  attr_accessor :requiresFullContext


  attr_accessor :predicates


  class PredPrediction

    attr_accessor :pred # never null at least SemanticContext.NONE
    attr_accessor :alt

    def initiailize(pred, alt)
      @alt = alt
      @pred = pred
    end

    def to_s()
      return "(" + pred + ", " + alt + ")"
    end
  end

  def initializeStateNumber(stateNumber)
    @stateNumber = stateNumber
  end

  def initializeConfigs(configs)
    @configs = configs
  end


  def getAltSet()
    alts = Set.new
    if (@configs != nil)
      @configs.each do |c|
        alts.add(c.alt)
      end
    end
    if (alts.empty?())
      return nil
    end
    return alts
  end


  def hash()
    hash = MurmurHash.initialize(7)
    hash = MurmurHash.update(hash, configs.hashCode())
    hash = MurmurHash.finish(hash, 1)
    return hash
  end


  def equals?(o)
# compare set of ATN configurations in this set with other
    if (this == o)
      return true
    end
    if (!(o.is_a? DFAState))
      return false
    end

    other = o
    sameSet = @configs.equals(other.configs)
    return sameSet
  end


  def to_s()
    buf = String.new
    buf << @stateNumber << ":" << @configs
    if (@isAcceptState)
      buf << "=>"
      if (@predicates != nil)
        buf << @predicates.to_s
      else
        buf << prediction
      end
    end

    return buf.to_s()
  end
end
