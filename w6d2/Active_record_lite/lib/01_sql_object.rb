require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    cols = DBConnection.execute2 <<-SQL
      SELECT
        *
      FROM
        #{self.table_name}
      

    SQL
    cols[0].map{|col| col.to_sym}
  end

  def self.finalize!
    columns.each do |col|
      self.define_method(col) do
        attributes[col]
      end

    


        setter  = "#{col}=".to_sym
      self.define_method(setter) do |value|
        attributes[col] = value 
      end
    end
  end

  def self.table_name=(table_name)
    # ...
    @name = table_name 
  end

  def self.table_name
    # ...
    @name ||= self.name.tableize
    @name 
  end

  def self.all
    # ...

  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
    params.each do |col,val|
      col_name = col.to_sym 
      raise "unknown attribute '#{col_name}'" if !self.class.columns.include?(col_name)
      self.send("#{col}=".to_sym, val)  
    end
      
  end

  def attributes
    # ...
    @attributes ||= {}

  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
