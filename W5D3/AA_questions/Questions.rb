require_relative "questions_db"
require_relative 'users'
require_relative 'replies'
require_relative 'question_follows'
require_relative 'question_likes'
require_relative 'model_base'

class Questions < ModelBase
    attr_accessor :id, :title, :body, :author_id 

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end


    def self.find_by_author_id(author_id)
        find_id = QuestionsDB.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                author_id = ?

        SQL

        find_id.map {|question| Questions.new(question)}
    end    

    def author
        Users.find_by_id(@author_id)
    end

    def replies
        Replies.find_by_question_id(@id)
    end

    def followers
        QuestionFollows.followers_for_question_id(@id)
    end

    def self.most_followed(n) 
        QuestionFollows.most_followed_questions(n)
    end

    def likers
        QuestionLikes.likers_for_question_id(@id)
    end

    def num_likes
        QuestionLikes.num_likes_for_question_id(@id)
    end

    def self.most_liked(n)
        QuestionLikes.most_liked_questions(n)
    end
    
    # def save
    #     if !@id
    #         QuestionsDB.instance.execute(<<-SQL, @title, @body, @author_id)
    #             INSERT INTO
    #                 questions(title, body, author_id)
    #             VALUES
    #                 (?, ?, ?)
    #         SQL

    #         @id = QuestionsDB.instance.last_insert_row_id
    #     else
    #         QuestionsDB.instance.execute(<<-SQL,@title, @body, @author_id, @id)
    #             UPDATE
    #                 questions
    #             SET
    #                 title = ?, body = ?, author_id = ?
    #             WHERE
    #                 id = ?
    #         SQL
    #     end

    # end



end