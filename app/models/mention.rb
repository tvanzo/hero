class Mention < ApplicationRecord
     attr_reader :mentionable
  include Rails.application.routes.url_helpers

  def self.all(letters)
    return Mention.none unless letters.present?
    # You should bring this user query into your User model as a scope
    users = User.limit(5).where('first_name like ?',"#{letters}%").compact
    users.map do |user|
      { name: user.first_name, image: user.gravatar_for(size: 30) }
    end
  end

  def self.create_from_text(post)
    potential_matches = post.content.scan(/@\w+/i)
    potential_matches.uniq.map do |match|
      mention = Mention.create_from_match(match)
      next unless mention
      post.update_attributes!(content: mention.markdown_string(post.content))
      # You could fire an email to the user here with ActionMailer
      mention
    end.compact
  end

  def self.create_from_match(match)
    user = User.find_by(first_name: match.delete('@'))
    UserMention.new(user) if user.present?
  end

  def initialize(mentionable)
    @mentionable = mentionable
  end

  class UserMention < Mention
    def markdown_string(text)
      # Don't forget to add your app's host here for production code!
      host = Rails.env.development? ? 'https://a3f67a4f776848ff82f717ad4c29dcfa.vfs.cloud9.us-east-2.amazonaws.com' : '' 
      text.gsub(/@#{mentionable.first_name}/i,
                "[**@#{mentionable.first_name}**](#{user_url(mentionable, host: host)})")
    end
  end
end
