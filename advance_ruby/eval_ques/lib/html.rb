class Html

  def form(attr, &block)
    attributes = []
    attr.each do |key, value|
      attributes << key.to_s + ' = ' + "'#{ value }'"
    end
    @result = "<form #{ attributes.join(' ') }>"
    instance_eval &block
    p @result += "</form>"
  end

  def para value
    @result += "<p>#{ value }</p>"
  end

  def text_field name
    @result += "<input type = 'text' name = '#{ name.to_s }'>"
  end
  
end