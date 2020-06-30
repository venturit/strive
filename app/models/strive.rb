class Strive < ApplicationRecord
    belongs_to :awarder, class_name: "User", foreign_key: "awarder_id"
    belongs_to :awardee, class_name: "User", foreign_key: "awardee_id"
    belongs_to :badge, class_name: "Badge", foreign_key: "badge_id"
    belongs_to :strive_category, class_name: "StriveCategory", foreign_key: "strive_category_id"
    validates :reason, presence: true
    validates :awarder_id, presence: true
    validates :awardee_id, presence: true
    validates :badge_id, presence: true

    belongs_to :awardee, class_name: "User"
    belongs_to :awarder, class_name: "User"

    # belongs_to :request

    validates_uniqueness_of :request_id, message: "can award only one strive",  if: -> { request_id.present? }


# { scope: :year,
# message: "should happen once per year" }


    #award rules if silver is selected award three bronze



end
