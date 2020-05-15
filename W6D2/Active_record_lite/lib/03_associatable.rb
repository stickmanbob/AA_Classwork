require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    #Returns class of associated object
    eval(@class_name)
  end

  def table_name
    #Returns associated table name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    ## Sets instance varaibles for primary key, foreign key, and  class name##
    ## defaults to most likely values based on name parameter ##
     ## Can also override defaults based on options hash

      primary_key = options[:primary_key] || :id 

      foreign_key = options[:foreign_key] || (name.to_s.downcase + "_id").to_sym  
      #Default: (based on name parameter) "Name => :name_id"

      class_name = options[:class_name] || name.to_s.camelcase 
      # Default: :name => 'Name'
      
      @primary_key = primary_key
      @foreign_key = foreign_key
      @class_name = class_name
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    ## Sets instance varaibles for primary key, foreign key, and  class name##
    ## defaults to most likely values based on name parameter ##
     ## Can also override defaults based on options hash

      primary_key = options[:primary_key] || :id 
      # debugger
      foreign_key = options[:foreign_key] || (self_class_name.to_s.downcase + "_id").to_sym  
      #Default: (based on self_class_name parameter) "ClassName => :class_name_id"

      class_name = options[:class_name] || name.to_s.camelcase.singularize
      # Default: (based on name parameter) :names => 'Name'

      @primary_key = primary_key
      @foreign_key = foreign_key
      @class_name = class_name
  end
end

module Associatable

  def belongs_to(name, options = {})
    # Creates a one:one relationship
   
    options =  BelongsToOptions.new(name, options)
    
    
    fk = options.foreign_key
    primary_key = options.primary_key
    
    define_method(name) do 
      
      foreign_key = self.send(fk)
        
        
       result = options.model_class.where(primary_key => foreign_key)
       
      
       result[0]

    end

  end

  def has_many(name, options = {})
    # Creates a one:many relationship
    
    options = HasManyOptions.new(name, self.to_s, options)
    
    foreign_key = options.foreign_key
    pk = options.primary_key
    
    define_method(name) do 
      
      primary_key = self.send(pk)
        
        
       result = options.model_class.where(foreign_key => primary_key)
       
      
       result
    end

  end

  def assoc_options
    
  end
end

class SQLObject

  extend Associatable
  
end
