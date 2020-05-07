require_relative "questions_db"
require_relative "users"
require_relative "model_base"
class QuestionLikes < ModelBase
    attr_accessor :id, :user_id, :question_id

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end


    def self.likers_for_question_id(question_id)
        data = QuestionsDB.instance.execute(<<-SQL, question_id)
            SELECT
                users.id, users.fname, users.lname
            FROM
                users
            JOIN
                question_likes ON users.id = question_likes.user_id
            WHERE
                question_likes.question_id = ?

        SQL
        data.map {|datum| Users.new(datum)}
    end

    def self.num_likes_for_question_id(question_id)
        data = QuestionsDB.instance.execute(<<-SQL, question_id)
            SELECT
                COUNT(users.id) AS num_likes
            FROM
                users
            JOIN
                question_likes ON users.id = question_likes.user_id
             
            WHERE
                question_likes.question_id = ?
            GROUP BY
                question_likes.question_id

        SQL
        data[0]["num_likes"]
    end

    def self.liked_questions_for_user_id(user_id)
        data = QuestionsDB.instance.execute(<<-SQL, user_id)
            SELECT
                questions.id, questions.title, questions.body, questions.author_id
            FROM
                questions
            JOIN
                question_likes ON questions.id = question_likes.question_id
            WHERE
                question_likes.user_id = ?

        SQL
        data.map {|datum| Questions.new(datum)}
    end

     def self.most_liked_questions(n)
        data = QuestionsDB.instance.execute(<<-SQL, n)
            SELECT
                questions.id, questions.title, questions.body, questions.author_id
            FROM
                questions
            JOIN
                question_likes ON questions.id = question_likes.question_id
            GROUP BY
                questions.id
            ORDER BY
                COUNT(question_likes.user_id) DESC
            LIMIT
                ?

        SQL
        data.map {|datum| Questions.new(datum)}
    end


end