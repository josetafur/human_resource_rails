json.array! @skills do |skill|
	json.id skill.id
	json.name skill.name
	json.created_at skill.created_at
end
