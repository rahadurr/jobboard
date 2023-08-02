class Job < ApplicationRecord

    validates :title, presence: true
    validates :description, presence: true
    validates :status, presence: true


    enum status: %i[draft published completed]
    
    has_many :resumes
    belongs_to :user
end
