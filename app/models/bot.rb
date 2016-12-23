class Bot < ActiveRecord::Base
  validates_presence_of :body, :title

  def self.search_words(words)
    CLIENT.search(words, lang: "en").first.text
  end
end
