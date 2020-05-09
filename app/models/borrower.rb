class Borrower < ApplicationRecord
    belongs_to :relationship_mgr
    has_one :application
end
