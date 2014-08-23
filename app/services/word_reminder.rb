class WordReminder
  include Sidekiq::Worker

  def perform(word_id, user_id)
    word = Word.find(word_id)
    user = User.find(user_id)
    @beanstalk = Beaneater::Pool.new(['localhost:11300'])
    tube = @beanstalk.tubes[user.email.gsub(/[^0-9A-Za-z]/, '_')]
    tube.put({word_id: word.id}.to_json)
  end
end