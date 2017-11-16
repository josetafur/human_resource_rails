json.array! @employees do |employee|
	json.id employee.id
	json.name employee.name
	json.last_name employee.last_name
	json.state employee.state
	json.phone employee.phone
	json.job_position employee.job_position
	json.team employee.team
	json.created_at employee.created_at
end
