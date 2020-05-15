require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # displays all the column names from the associated table (self.table_name)
    # comes in an array of symbols 
    if !@cols 
      cols = DBConnection.execute2 <<-SQL
        SELECT
          *
        FROM
          #{self.table_name}
        

      SQL
      @cols = cols[0].map{|col| col.to_sym}
    else
      @cols
    end
  end

  def self.finalize!
    ## This method is called at the end of the subclass definition and 
    ## sets up reader and writer methods for column values

    columns.each do |col|

      #define a getter for the column######
      self.define_method(col) do
        attributes[col]
      end
      ######################################

      ##define a setter for a column#########
      setter  = "#{col}=".to_sym
      self.define_method(setter) do |value|
        attributes[col] = value 
      end
      ########################################

    end
  end

  def self.table_name=(table_name)
    # setter for the table name 
    @name = table_name 
  end

  def self.table_name
    # returns the underlying table name for the model

    @name ||= self.name.tableize
    @name 
  end

  def self.all
  ##### Returns an array of model objects for every row in the table####

  ##start by querying the database for all records in table##
  ###will return array of hashes###
   data =  DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL
  
  ##then, iterate through resulting array and create new instance for each
  ##option hash
  self.parse_all(data)

  end

  def self.parse_all(results)
    #parses an array of hashes and returns an array of model objects
    results.map {|datum| self.new(datum)}
  end

  def self.find(id)
    # finds the record in the associated table with an id matching the id parameter
    #returns a model instance
    result = DBConnection.execute(<<-SQL,id)
      Select
        *
      from
       #{table_name}
      where
        id = ?

    SQL
    return nil if result.empty?
    self.new(result[0])
  end

  def initialize(params = {})
    # initiallizes a new instance(row) based on an options hash

    params.each do |col,val|
      col_name = col.to_sym

      #We want to raise an error if the user passes in a value for an unknown column 
        raise "unknown attribute '#{col_name}'" if !self.class.columns.include?(col_name)
      
      #Set each column value equal to the specified value in the options hash

        self.send("#{col}=".to_sym, val)  
    end
      
  end

  def attributes
    # ...
    @attributes ||= {}

  end

  def attribute_values
    # returns values for each attribute
    self.class.columns.map{|val| self.send(val)}
  end

  def insert
    # Inserts the current model instance into the db. 
    # Assumes there is no @id value, assigned on saving
    
    #First, lets get a string with all the column names to 
    #interpolate into the query, as well as a matching string of 
    #?'s
    
    columns = self.class.columns[1..-1]
    col_names = columns.join(",")

    question_marks = []
    columns.length.times {question_marks << "?"}
    question_marks = question_marks.join(",")

    ##Now, we need values to match each column####
    vals = attribute_values[1..-1]
    
    #Finally, run a SQL command to update the database
    DBConnection.execute(<<-SQL,*vals)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
      
    SQL

    #update the id value for self
    self.id = DBConnection.last_insert_row_id 
    
  end

  def update
    # Updates record in DB based on current instance attributes##

    #First, lets get a string with all the column names to         ###
    #interpolate into the query, as well as a matching string of ?'s #
    
    columns = self.class.columns[1..-1]
    col_names = columns.join(",")

    #Following code snippet generates a string of "?"'s, one per column ##
    question_marks = []
    columns.length.times {question_marks << "?"}
    question_marks = question_marks.join(",")

    ##Now, we need values to match each column##
    id = self.id 
    vals = attribute_values[1..-1]

    table_name = self.class.table_name
    

    ####Finally, update the database#####
    DBConnection.execute(<<-SQL,*vals)
      UPDATE
        #{table_name}
      SET
        (#{col_names}) = (#{question_marks})
      WHERE
        id = #{id}
    SQL
  end

  def save
    # calls insert or update depending on whether id is present or not

    if !self.id 
      insert 
    else  
      update 
    end

  end

  
end
