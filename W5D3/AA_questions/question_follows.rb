require_relative "questions_db"
require_relative "users.rb"
require_relative "Questions.rb"
require_relative 'model_base'

class QuestionFollows < ModelBase
    attr_accessor :id, :user_id, :question_id

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end

    def self.followers_for_question_id(question_id)
        data = QuestionsDB.instance.execute(<<-SQL, question_id)
            SELECT
                users.id, users.fname, users.lname
            FROM
                users
            JOIN
                question_follows ON users.id = question_follows.user_id
            WHERE
                question_follows.question_id = ?

        SQL
        data.map {|datum| Users.new(datum)}
    end

    def self.followers_for_user_id(user_id)
        data = QuestionsDB.instance.execute(<<-SQL, user_id)
            SELECT
                questions.id, questions.title, questions.body, questions.author_id
            FROM
                questions
            JOIN
                question_follows ON questions.id = question_follows.question_id
            WHERE
                question_follows.user_id = ?

        SQL
        data.map {|datum| Questions.new(datum)}
    end

    def self.most_followed_questions(n)
        data = QuestionsDB.instance.execute(<<-SQL, n)
            SELECT
                questions.id, questions.title, questions.body, questions.author_id
            FROM
                questions
            JOIN
                question_follows ON questions.id = question_follows.question_id
            GROUP BY
                questions.id
            ORDER BY
                COUNT(question_follows.user_id) DESC
            LIMIT
                ?

        SQL
        data.map {|datum| Questions.new(datum)}
    end

   
end