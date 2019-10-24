EnemyCard = {}
EnemyCard.__index = EnemyCard

function EnemyCard:new(id)
	local o = {}
	o.id = id or 1



	o.nameLabel 	   = Label:new(80, 0, "placeholder", VerySmallFont, "left", "down", 110, 10, {0, 0, 0, 1})
	o.nameLabelShadow  = Label:new(81, 1, "placeholder", VerySmallFont, "left", "down", 110, 10, {0, 0, 0, 1})
	o.healthLabel	   = Label:new(2, 0, "placeholder", VerySmallFont, "left", "down", 150, 10, {1, 1, 1, 1})
	o.healthLabelShadow= Label:new(3, 1, "placeholder", VerySmallFont, "left", "down", 150, 10, {0, 0, 0, 1})


	return setmetatable(o, self)
end

function EnemyCard:draw(x, y)
	love.graphics.push()
	love.graphics.translate(x, y)

	local sb = love.graphics.newSpriteBatch(UIAtlas.tex)
	local enemy = Enemies[self.id]

	--sb:setColor(1, 1, 1, 0.5)
	--UIAtlas:addSB(sb, "health mask", 0, -3,0,1,1);
	
	love.graphics.setColor( 1, 1, 1, 1 )
	love.graphics.rectangle('line',2,-3,75,11,0,0,1)
	love.graphics.setColor(GetConditionColor2(GetConditionName2(Enemies[self.id].HP, Enemies[self.id].maxHP)))
	love.graphics.rectangle('fill',2,-3,(GetHealthbar(Enemies[self.id].HP, Enemies[self.id].maxHP))*75,11,0,0,1)
	sb:setColor(GetConditionColor2(GetConditionName2(Enemies[self.id].HP, Enemies[self.id].maxHP)))
	--UIAtlas:addSB(sb, "health mask", 0, -3,0,(GetHealthbar(Enemies[self.id].HP, Enemies[self.id].maxHP)),1);

	love.graphics.draw(sb)
	--self.nameLabel.color=(GetConditionColor2(GetConditionName2(Enemies[self.id].HP, Enemies[self.id].maxHP)))

	self.nameLabel.text = Enemies[self.id].name
	self.nameLabelShadow.text = Enemies[self.id].name
	self.nameLabelShadow:draw()
	self.nameLabel:draw()

	self.nameLabel.color = GetEnemyColor(self.id)
	self.healthLabel.text = GetEnemyHealthString(self.id)
	self.healthLabelShadow.text = GetEnemyHealthString(self.id)
	self.healthLabelShadow:draw()
	self.healthLabel:draw()

	love.graphics.pop()
	love.graphics.setColor( 1, 1, 1, 1 )
end
