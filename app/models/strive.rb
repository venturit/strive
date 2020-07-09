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

    validates_uniqueness_of :request_id, message: "Oh Snap! You can only award one strive per request.",  if: -> { request_id.present? }

    after_validation {StrivePolicy::Scope.new(nil, self).resolve_period}

# { scope: :year,
# message: "should happen once per year" }


    #award rules if silver is selected award three bronze4
    def award
       
       if self.valid?
        if self.badge_id == ENV['SILVER_ID'].to_i
            # award three bronzes
            b_to_s = ENV['BRONZE_TO_SILVER'].to_i
            self.badge_id = ENV['BRONZE_ID']
            saved = self.save
            if saved
                parent = self
                (b_to_s-1).times do 
                    strive = parent.dup
                    strive.parent_id = parent.id
                    strive.request_id = nil
                    saved = strive.save
                    if saved == false
                        return saved
                    end
                end
            end
            return saved
        else
            return self.save
        end

       else
        return false
       end
    end





end
