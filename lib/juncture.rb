class Juncture
  def initialize *states, **kwargs
    @states = states
    @current_state = kwargs[:default]
  end

  def method_missing meth, *args, &block
    if @states.respond_to? meth
      @states.send meth, *args, &block
    else
      super
    end
  end

  def inspect
    "#<Juncture:%s State:%s>" % [(object_id << 1).to_s(16), @current_state]
  end

  def state
    @current_state
  end

  def set(new_state)
    raise "UNKNOWN STATE: %s" % new_state unless @states.include? new_state
    @current_state = new_state
  end

  def next
    if index.nil? || @states[index+1].nil?
      @current_state = @states[0]
    else
      @current_state = @states[index+1]
    end
  end

  def ==(value)
    @current_state == value
  end

  def ===(value)
    @current_state === value
  end

  def <(value)
    @states[index+1..-1].include? value
  end

  def <=(value)
    @states[index..-1].include? value
  end

  def >(value)
    @states[0..index-1].include? value
  end

  def >=(value)
    @states[0..index].include? value
  end

  private

  def index
    @states.index(@current_state)
  end
end