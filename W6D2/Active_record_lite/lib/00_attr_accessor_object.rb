class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...

    names.each do |name|
      self.define_method(name) do
        iv = "@#{name}".to_sym
        self.instance_variable_get(iv)
      end
      
      self.define_method("#{name}=".to_sym) do |val|
        iv = "@#{name}".to_sym
        self.instance_variable_set(iv,val)
      end
    end
  end
end
