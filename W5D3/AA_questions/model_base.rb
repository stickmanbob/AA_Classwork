require_relative "questions_db"
require 'active_support/inflector'
require 'byebug'
class ModelBase

    def self.all
      data =  QuestionsDB.instance.execute(<<-SQL)
            SELECT
                *
            FROM
                #{self.name.tableize}

            SQL
        data.map {|datum| self.new(datum)}
    end

    def self.find_by_id(id)
        find_id = QuestionsDB.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                #{self.name.tableize}
            WHERE
                id = ?

        SQL

        find_id.map {|new_id| self.new(new_id)}
    end

    def save
        id = self.instance_variables[0]

        instance_vars = self.instance_variables[1..-1]
        
        num_question_marks = instance_vars.length

        question_marks = []

        num_question_marks.times { question_marks << "?"}

        question_marks = question_marks.join(",") 

        columns = instance_vars.map {|var| var.to_s[1..-1]}

        instance_vars = instance_vars.join(",")
        
        columns = columns.join(",")
        puts "a, #{instance_vars}"
        debugger


        # if !@id
        #     QuestionsDB.instance.execute(<<-SQL, *instance_vars)

        #     SQL
        # end

        if !@id
            QuestionsDB.instance.execute(<<-SQL, instance_vars)
                INSERT INTO
                    #{self.class.name.tableize}(#{columns})
                VALUES
                    (#{question_marks})
            SQL

            @id = QuestionsDB.instance.last_insert_row_id
        else
            QuestionsDB.instance.execute(<<-SQL, instance_vars, @id)
                UPDATE
                    #{self.class.name.tableize}
                SET
                    (#{columns}) = (#{question_marks})
                WHERE
                    id = ?
            SQL
        end

    end


end