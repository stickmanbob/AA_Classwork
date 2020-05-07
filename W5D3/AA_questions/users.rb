require_relative "questions_db"
require_relative 'Questions'
require_relative 'replies'
require_relative 'question_follows'
require_relative 'question_likes'
require_relative 'model_base'

class Users < ModelBase

    attr_accessor :id, :fname, :lname

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end



    def self.find_by_name(fname, lname)
        data = QuestionsDB.instance.execute(<<-SQL, fname, lname)
            SELECT
                *
            FROM
                users
            WHERE
                fname = ? AND lname = ?

        SQL

        data.map {|datum| Users.new(datum)}
    end
    
    def authored_questions
        Questions.find_by_author_id(@id)
    end

    def authored_replies
        Replies.find_by_user_id(@id)
    end

    def followed_questions
        QuestionFollows.followers_for_user_id(@id)
    end

    def liked_questions
        QuestionLikes.liked_questions_for_user_id(@id)
    end

    def average_karma
        data = QuestionsDB.instance.execute(<<-SQL, @id)

            SELECT 
                CAST (COUNT(question_likes.id) AS FLOAT) / COUNT(DISTINCT questions.id)   AS avg_karma
            FROM 
                questions
            LEFT JOIN
                question_likes ON questions.id = question_likes.question_id
            WHERE
                questions.author_id = ?


        SQL
        data[0]['avg_karma']
    end

    def save
        if !@id
            QuestionsDB.instance.execute(<<-SQL, @fname, @lname)
                INSERT INTO
                    users(fname, lname)
                VALUES
                    (?, ?)
            SQL

            @id = QuestionsDB.instance.last_insert_row_id
        else
            QuestionsDB.instance.execute(<<-SQL,@fname, @lname, @id)
                UPDATE
                    users
                SET
                    fname = ?, lname = ?
                WHERE
                    id = ?
            SQL
        end

    end


end