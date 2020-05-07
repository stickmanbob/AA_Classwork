require_relative "questions_db"
require_relative 'users'
require_relative 'Questions'
require_relative 'model_base'
class Replies < ModelBase
    attr_accessor :id, :subject_question, :parent_reply, :author_id, :body

    def initialize(options)
        @id = options['id']
        @subject_question = options['subject_question']
        @parent_reply = options['parent_reply']
        @author_id = options['author_id']
        @body = options['body']
    end


    def self.find_by_user_id(author_id)
        data = QuestionsDB.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                replies
            WHERE
                author_id = ?

        SQL

        data.map {|datum| Replies.new(datum)}
    end  
    
      def self.find_by_question_id(question_id)
        data = QuestionsDB.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                replies
            WHERE
                subject_question = ?

        SQL

        data.map {|datum| Replies.new(datum)}
    end       

    def author
        Users.find_by_id(@author_id)
    end

    def question 
        Questions.find_by_id(@subject_question)
    end

    def parent_reply
        Replies.find_by_id(@parent_reply)
    end

    def child_replies
        data = QuestionsDB.instance.execute(<<-SQL,@id)
            SELECT
                *
            FROM
                replies
            WHERE
                parent_reply = ?

        SQL
        data.map {|datum| Replies.new(datum)}
    end

    def save
        if !@id
            QuestionsDB.instance.execute(<<-SQL, @subject_question, @parent_reply, @author_id, @body)
                INSERT INTO
                    replies(subject_question, parent_reply, author_id, body)
                VALUES
                    (?, ?, ?, ?)
            SQL

            @id = QuestionsDB.instance.last_insert_row_id
        else
            QuestionsDB.instance.execute(<<-SQL,@subject_question, @parent_reply, @author_id, @body, @id)
                UPDATE
                    replies
                SET
                    subject_question = ?, parent_reply = ?, author_id = ?, body = ?
                WHERE
                    id = ?
            SQL
        end

    end


end