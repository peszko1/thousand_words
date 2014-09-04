class WordsService
  def initialize(user)
    @user = user
    @beanstalk = Beaneater::Pool.new(["#{ENV['BEANSTALKD_HOST']}:#{ENV['BEANSTALKD_PORT']}"])
  end

  def next_word
    word = get_reminder_if_exists
    word ||= generate_new_word
  end

  def get_reminder_if_exists
    raise 'user cannot be nil' unless @user
    tube = @beanstalk.tubes[@user.email.gsub(/[^0-9A-Za-z]/, '_')]
    if tube.peek(:ready) && reminder = tube.reserve
      word = Word.find(JSON.parse(reminder.body)['word_id'])
      reminder.delete
      word
    end  	
  end

  def generate_new_word
    Word. \
      joins('left outer join trained_words on words.id = trained_words.word_id').where('trained_words.id is null').\
      order('random()').first
  end
end
