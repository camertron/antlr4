require '../../antlr4/runtime/Ruby/antlr4/ATNState'


class BlockEndState < ATNState
  attr_accessor :startState
  @startState


  def getStateType()
    return BLOCK_END
  end
end
