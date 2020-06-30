class Request < ApplicationRecord
    belongs_to :requestor, class_name: "User", foreign_key: "requestor_id"
    belongs_to :backer, class_name: "User", foreign_key: "backer_id"
    belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
    belongs_to :requestee, class_name: "User", foreign_key: "requestee_id"
    belongs_to :badge, class_name: "Badge", foreign_key: "badge_id"
    belongs_to :strive_category, class_name: "StriveCategory", foreign_key: "strive_category_id"
    validates :reason, presence: true

    has_one :strive
end
