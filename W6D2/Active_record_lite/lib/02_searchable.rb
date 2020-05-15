require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    ## Implements searching the DB with 'WHERE'      #######
    ##params is an options hash where keys are columns    ##
    ##and values are desired values                  #######

    ### First, we need to generate a string to interpolate
    ### into the 'WHERE' clause of the sql query

      where_string = params.keys.map {|key| "#{key.to_s} = ?" }
      where_string =  where_string.join(" AND ") 
    
    ##Now, we need values and question marks to interpolate

      values = params.values
      
      question_marks = []

      values.length.times {question_marks << "?"}

      question_marks = question_marks.join(",")

    ##Finally, the SQL query###
    ## self::table_name is defined on the including class.
    ##########################################################
      # debugger
    result = DBConnection.execute(<<-SQL,*values)
        SELECT
          *
        FROM
          #{table_name}
        WHERE
          #{where_string}

      SQL

    ## Last step, convert the resulting hash into instances
      
      result.map {|row| self.new(row)}
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
