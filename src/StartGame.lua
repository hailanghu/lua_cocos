StartGame = class("StartGame", function()
    return cc.Scene:create()
end)

function StartGame.create()
    print("create startGame scene...")
    local scene = StartGame.new()
    scene:startMenu()
    return scene
end

function StartGame:createScene()
    print("create startGame scene...")
    local scene = StartGame.new()
    scene:startMenu()
    return scene
end

function StartGame:startMenu()
	local layer = cc.LayerColor:create(cc.c4b(255,255,255,255))
	self:addChild(layer)
	
	local size = cc.Director:getInstance():getWinSize()
	
	local start = cc.MenuItemFont:create("start")
	start:setColor(cc.c3b(0,0,0))
	start:setPosition(size.width/2, size.height/2)
	start:registerScriptTapHandler(function(sender) 
	--跳到游戏场景  
	   print("start game")
        local scene = require("GameScene")
        local gameScene = scene.create()
        gameScene:playBgMusic()
        cc.Director:getInstance():replaceScene(gameScene)  
end) 
    local exit = cc.MenuItemFont:create("exit")
    exit:setScale(0.5)
    exit:setColor(cc.c3b(0,0,0))
    exit:setPosition(size.width-50, 50)
    exit:registerScriptTapHandler(function(Sender)
        cc.Director:getInstance():endToLua()
        end
    )
    local menu = cc.Menu:create(start, exit)
    menu:setPosition(0,0)
    layer:addChild(menu)
    print("create startGame scene...")
end

return StartGame