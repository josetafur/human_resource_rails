json.skills(@skills) do |skill|
	json.id skill.id
	json.name skill.name
	json.created_at skill.created_at
	
end

json.employee_skills(@employee_skills) do |employee_skill|
	json.id employee_skill.id
	json.created_at employee_skill.created_at
	json.skill do 
		json.id employee_skill.skill.id
		json.name employee_skill.skill.name
	end
end

