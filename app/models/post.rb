class Post < ActiveRecord::Base
    #validates :title, presence: true

    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction non-fiction)}

    validate :good_post_title

    def good_post_title
        ["Won't Believe", "Secret", "Top [number]", "Guess"].each do |string|
            if !self.title.include?(string) || !self.title
                errors.add(:title, "not clickbait enough")
            end 
        en 
    end
end
