json.extract! request, :id, :requestor_id, :recipient_id, :badge_id, :reason, :strive_category_id, :backer_id, :created_at, :updated_at
json.url request_url(request, format: :json)
