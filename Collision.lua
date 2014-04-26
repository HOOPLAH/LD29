function check_collision(a, b)
	if (a.x + a.width > b.x) and (a.x < b.x + b.width) and (a.y + a.height > b.y) and (a.y < b.y + b.height) then
	   return true
	else
	   return false
	end
end

function handle_collision(a, b)
	xOverlap = 0.0
	yOverlap = 0.0
	
	if a.x <= b.x then
		xOverlap = b.x - (a.x + a.width)
	elseif a.x > b.x then
		xOverlap = (b.x + b.width) - a.x
	end
	
	if a.y <= b.y then
		yOverlap = b.y - (a.y + a.height)
	elseif a.y > b.y then
		yOverlap = (b.y + b.height) - a.y
	end
	
	if math.abs(xOverlap) < math.abs(yOverlap) then
		a.x = a.x + xOverlap
	elseif math.abs(xOverlap) > math.abs(yOverlap) then
		a.y = a.y + yOverlap
	end
end