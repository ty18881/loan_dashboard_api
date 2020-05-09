class Application < ApplicationRecord
    belongs_to :borrower
    has_many :loan
end
