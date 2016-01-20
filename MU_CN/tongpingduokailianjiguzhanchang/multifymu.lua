#320,646屏幕中心

-- 点击函数封装
function click(x, y)--随机小幅度点击
    touchDown(0, x + math.random(-2, 2), y + math.random(-2, 2))
    mSleep(math.random(15,50))
    touchUp(0)
    mSleep(math.random(300,500))
end

-- 点击函数封装
function clickone(x, y)--随机小幅度点击
    touchDown(0, x + math.random(-2, 2), y + math.random(-2, 2))
    mSleep(math.random(15,50))
    touchUp(0)
    mSleep(math.random(50,100))
end

PIC_PATH = '/var/touchelf/scripts/qmqj/'

--垂直方向移动
function vertical()
	mSleep(1000)
	touchDown(1,320,140)
	touchDown(2,320,1135)
	mSleep(50)
	for i = 1,183 do
		touchMove(1,320,140+i)
		touchMove(2,320,1135-i)
		mSleep(20)
	end
	touchUp(1)
	touchUp(2)
	mSleep(500)
end

--水平方向移动
function horizon()
	mSleep(1000)
	touchDown(2,320,645)--多开游戏窗口圆心
	mSleep(500)
	touchDown(1,320,475)
	mSleep(50)
	for i = 1,182 do  --[[183/184/185满屏--]]
		touchMove(1,320-i,475)
		mSleep(20)
	end
	for j = 1,182 do
		touchMove(1,138,475+j)
		mSleep(20)
	end
	touchUp(1)
	touchUp(2)
	mSleep(500)	
end

--滑动编辑好的窗口
function move_y(y1,y2)
	local speed = 0
	mSleep(500)
	touchDown(2,320,645)
	mSleep(50)
	distance = math.abs(y1-y2)
	if y1 > y2 then speed = -1 end
	if y1 < y2 then speed = 1 end
	for i = 1,distance do
		touchMove(2,320,645+(speed*i))
		mSleep(20)
	end
	touchUp(2)
	mSleep(500)
end

--开启multify编辑模式
function edit()
	touchDown(2,1,1135)
	mSleep(20)
	touchMove(2,100,1135)
	touchUp(2)
	mSleep(1000)
end
--应用程序包名
packagename = {'com.tianmashikong.qmqj.apps','X00.tianmashikong.qmqj.apps'}
--计算器包名 com.apple.calculator 
--cal9 478,495,490,511
--cal6 477,654,491,671
--2窗口y坐标差为362

--[[	vertical()
	horizon()
	move_y(825,942)
	vertical()
	horizon()
	move_y(825,581)--]]
	
--精魄的颜色
color_jp={0x1D6C29,--431,644;
2,0,0x1A6A06,4,0,0x186F03,
6,-1,0x296413,10,-1,0x286412,
13,-1,0x2B6514,23,15,0x071C02,
24,15,0x2DB601,24,17,0x2FB708,
24,18,0x32B108,24,20,0x32AD07,
24,22,0x32AB0A,}

--血灵之骨的颜色
color_xlzg={0xEADDD5,--438,705;
2,0,0xB57D69,4,0,0xAC877D,
6,0,0xEDDCD3,8,0,0xEDE1D9,
10,0,0xD7C7BF,10,2,0xB89D94,
10,4,0xA37D74,8,4,0xF3E5DD,
8,6,0xCFAFA2,-4,15,0xB45D40,
-2,15,0xCE916F,-4,17,0xBB5D3F,
-8,19,0xCF5817,}

--血色之书的颜色
color_xszs={0xFEF4BB,--434,341;
2,0,0xFCF5B8,2,1,0xCDC1B3,
2,2,0x5554B5,4,2,0x7675E1,
6,2,0xFBE6A2,2,8,0xC5A776,
3,8,0xD4BB8A,5,8,0xDFC791,
1,13,0xB17130,4,13,0xD6A455,
7,13,0xD7AB5D,}

--恶魔秘史的颜色
color_emms={0x613A05,--531,345;
0,2,0x3E2E05,2,2,0x88630A,
2,4,0xBFAA0F,0,4,0x754B06,
0,6,0x885104,2,6,0x64210C,
4,6,0xA1790A,10,6,0x755F09,
20,7,0x845609,25,7,0x7E520B,
}

--恶魔之眼
color_emzy={0x6A180D,--378,757;
-4,6,0x541C12,-4,7,0xC73009,
9,6,0x603F08,19,6,0xCB3406,
20,9,0x6B1B07,17,14,0x7B1D05,
13,15,0x550E03,6,16,0x46150F,
1,16,0x5E1307,12,7,0xFCC91F,
}

--金币的颜色
color_jin={0xCDBE50,--491,289;
2,0,0xE0D674,4,0,0xDDD16A,
1,4,0x713D1C,1,10,0x865120,
-11,12,0xE1D35A,-8,12,0xDDCA4E,
-4,16,0xF5DD4E,-2,16,0xE8BB41,
-1,19,0xEAA930,}

--智力果实
color_zlgs={0x2386C0,--429,401;
2,0,0x1379B0,8,0,0x0E4468,
12,0,0x3990CC,16,-3,0x6EB7DE,
16,5,0x0667AE,13,5,0x1D79B7,
7,5,0x1274B6,3,5,0x0464A7,
3,11,0x1C78A2,7,11,0x05649F,
13,11,0x0D7AAC,}

--体力果实
color_tlgs={0xB7C72C,--376,401;
4,0,0xA1B413,13,0,0xACC724,
16,-4,0xCCDA3A,16,4,0xB5C212,
12,4,0x9DB30D,7,4,0xA0B20C,
7,8,0x98AD05,12,8,0x92AA0D,
17,8,0x819E0C,10,11,0x6D9103,
14,12,0xA1A70D,}

--力量果实
color_llgs={0xCA4155,--532,401;
5,0,0xA00811,13,0,0xCB3948,
15,-6,0xD05468,16,-2,0xDC5D6D,
16,4,0xCF3954,16,10,0xAD1534,
16,11,0xC44154,12,11,0xAF102C,
8,11,0xA20617,5,11,0x950512,
2,10,0x9D071C,}

--敏捷果实
color_mjgs={0x59B832,--532,761;
4,0,0x1C8D03,9,0,0x437508,
14,0,0x95E069,16,0,0x28AC06,
16,-5,0x87DA55,4,5,0x3EB90F,
10,5,0x52C324,16,5,0x69CE30,
20,5,0x37AB08,8,12,0x2D9F04,
15,12,0x2E970E,}

--成就徽章
color_cjhz={0xB78E55,--587,398;
3,0,0x997345,9,0,0xA98953,
12,0,0x917044,12,7,0x451A15,
8,7,0x835433,2,7,0x673922,
1,11,0xAF7E47,4,11,0x9E6B40,
10,11,0xB8834B,7,14,0x82533C,
7,16,0x875E4F,}

--复活石颜色
color_fhs={0x41344E,--384,446;
7,0,0x382F46,0,7,0x300076,
3,7,0x9D3642,10,7,0x20025C,
10,11,0x47016F,4,11,0x3E134A,
-1,11,0x300071,-1,17,0xB377C4,
3,17,0x9B81A6,8,17,0x9A3BAD,
4,22,0x646468,}	

--背包总的范围 366,276,624,485
color_sell = {color_jp,color_xlzg,color_xszs,color_emms,color_emzy,color_fhs}

color_use = {color_jin,color_zlgs,color_tlgs,color_llgs,color_mjgs,color_cjhz,color_fhs}

--游戏优化部分
function io.list8(App)
	for l in io.popen("ls ".."var/mobile/Containers/Bundle/Application/"):lines() do
		file=io.open("var/mobile/Containers/Bundle/Application/" ..l .."/apps.app/Info.plist")
		if file~=nil then
			path="var/mobile/Containers/Bundle/Application/" ..l .."/apps.app"
			youxiyouhua()
		end
	end
end

function os.remove(path)
    return os.execute("rm -rf "..path);
end	

function youxiyouhua()
	os.remove(path.."/Data/Raw/Audio")
	os.remove(path.."/Data/Raw/Equip/FS_wing_01.unity3d")
	os.remove(path.."/Data/Raw/Equip/FS_wing_02.unity3d")
	os.remove(path.."/Data/Raw/Equip/FS_wing_03.unity3d")
	os.remove(path.."/Data/Raw/Equip/FS_wing_04.unity3d")
	os.remove(path.."/Data/Raw/Equip/ZS_wing_01.unity3d")
	os.remove(path.."/Data/Raw/Equip/ZS_wing_02.unity3d")
	os.remove(path.."/Data/Raw/Equip/ZS_wing_03.unity3d")
	os.remove(path.."/Data/Raw/Equip/ZS_wing_04.unity3d")
	os.remove(path.."/Data/Raw/Equip/MJS_wing_01.unity3d")
	os.remove(path.."/Data/Raw/Equip/MJS_wing_02.unity3d")
	os.remove(path.."/Data/Raw/Equip/MJS_wing_03.unity3d")
	os.remove(path.."/Data/Raw/Equip/MJS_wing_04.unity3d")
	os.remove(path.."/Data/Raw/Monster")	
	os.remove(path.."/Data/Raw/Decoration")
--[[	os.remove(path.."/Data/Raw/Decoration/HLB.unity3d")	
	os.remove(path.."/Data/Raw/Decoration/JG_lianji_01.unity3d")	
	os.remove(path.."/Data/Raw/Decoration/DYH_lianji_01.unity3d")	
	os.remove(path.."/Data/Raw/Decoration/ZZZH_FZZR_01.unity3d")	
	os.remove(path.."/Data/Raw/Decoration/ZZZH_ZZCJ_01.unity3d")	--]]

end	

function io.list8()
	for l in io.popen("ls ".."var/mobile/Containers/Bundle/Application/"):lines() do
		file=io.open("var/mobile/Containers/Bundle/Application/" ..l .."/apps.app/Info.plist")
		if file~=nil then
			path="var/mobile/Containers/Bundle/Application/" ..l .."/apps.app"
			youxiyouhua()
		end
	end
end


--UI界面
UI = {
	{'InputBox{}', 'id',    '宽带编号:' },
	{'InputBox{}', 'area',    '区:' },
};

nowifi = 0

function main()
	unlock()
	rotateScreen(0)
	mSleep(2000)
	io.list8()
	time_start = os.date('*t',t)
	start = time_start.hour
	while true do
		multify()
		load()
		levelup()
		if allow() == 1 then
			bag(1)
			bag(2)
			using(1)
			using(2)
			award()
			battle()	
		end	
		bag(1)        
		bag(2)				
		buypre(1)
		buypre(2)	
		using(1)
		using(2)				
		rebirth()
		awardall()		
		deal()
		exit()
		--[[router()--]]
	end
end

--转生相关
function rebirth()
	for j =1,2 do
		if level(j) then
			birth(j)
		end
	end		
end

--控制是否交易
function deal()
	if isDeal() then
		bingfenggu()
		dealbysay()
	end	
end

--是否收钱
function isDeal()
	local isdeal
	file = io.open("/var/touchelf/scripts/deal.txt","r")
	if file ~= nil then
		isdeal = tonumber(file:read())	
		if isdeal == 1 then
			return true
		else
			return false
		end
	else
		return false
	end
end

--buy(1)
--buy(2)		
--exchange()

function other()
	upskill()	
	wing()
	uparc()	
	upprestige()
	weapon()
	necklace()
	elves()	
end

function awardall()
	awardlevel()
	awardonline()
	awardlx()
	awardholiday()
end

--解除锁屏
function unlock()
	local dd = 0
	if DmFindPic('black.bmp',95,318,514,339,534) then
		keyDown('HOME')
		mSleep(500)
		keyUp('HOME')
		while true do	
			if dd == 0 then myMove_RL(87,800,540,814,50) end
			if DmFindPic('deng.bmp',90,483,980,644,1005) then
				--notifyMessage('解锁完成')
				logDebug('解锁完成')
				break
			--安全模式
			elseif DmFindPic('de.bmp',85,383,14,411,36,1) or DmFindPic('de1.bmp',85,382,16,410,35) then
				os.execute('reboot')
			--sim卡
			elseif DmFindPic('simcard.bmp',80,320,612,347,645) then
				click(x,y)				
				dd = 1
			else
				appRun('com.apple.calculator')
				mSleep(200)
			end
		end
	end
	
end
--分屏
function multify()
	while true do
		if DmFindPic('deng.bmp',90,483,980,644,1005) and DmFindPic('nine.bmp',90,485,503,641,578) == false and DmFindPic('six.bmp',90,485,663,641,819) == false then
			--notifyMessage('双开启动完毕')
			mSleep(2000)
			logDebug('双开启动完毕')
			break	
		--安全模式
		elseif DmFindPic('de.bmp',85,383,14,411,36,1) or DmFindPic('de1.bmp',85,382,16,410,35) then	
			os.execute('reboot')			
		elseif DmFindPic('deng.bmp',90,483,980,644,1005) and DmFindPic('nine.bmp',90,485,503,641,578) then
			--[[appRun(packagename[1])mSleep(8000)--]]
			multifyone()
		elseif DmFindPic('deng.bmp',90,483,980,644,1005) and DmFindPic('six.bmp',90,485,663,641,819)then
			--[[appRun(packagename[2])mSleep(8000)--]]
			multifytwo()
		--sim卡
		elseif DmFindPic('simcard.bmp',80,320,612,347,645) then
			click(x,y)
		else
--[[			appRun(packagename[1])mSleep(8000)
			appRun(packagename[2])mSleep(8000)--]]
			appRun('com.apple.calculator')mSleep(1000)
			unlock()
			mSleep(200)
		end
	end
end

--第一个窗口消失
 function failed(i)
	if i == 1 and DmFindPic('deng.bmp',90,483,980,644,1005) and DmFindPic('nine.bmp',90,485,503,641,578) then
			--[[appKill(packagename[i])mSleep(1000)--]]
--[[			notifyMessage('启动'..packagename[i])mSleep(2000)
			appRun(packagename[i])mSleep(8000)--]]
			appRun('com.apple.calculator')
			logDebug('failed'..'multifyone')
			logDebug('failed'..i)
			multifyone()
	elseif i == 2 and DmFindPic('deng.bmp',90,483,980,644,1005) and DmFindPic('six.bmp',90,485,663,641,819)then
			--[[appKill(packagename[i])mSleep(1000)--]]
--[[			appRun(packagename[i])mSleep(8000)		
			notifyMessage('启动'..packagename[i])mSleep(2000)--]]
			appRun('com.apple.calculator')	
			logDebug('failed'..'multifytwo')
			logDebug('failed'..i)
			multifytwo()	
	--sim卡
	elseif DmFindPic('simcard.bmp',80,320,612,347,645) then
			click(x,y)	
	elseif DmFindPic('deng.bmp',90,483,980,644,1005) == false then
			appRun('com.apple.calculator')				
	else
		mSleep(200)
	end		
	con(i)
end

--第一个窗口消失
 function fail(i)
	if i == 1 and DmFindPic('deng.bmp',90,483,980,644,1005) and DmFindPic('nine.bmp',90,485,503,641,578) then
			--[[appKill(packagename[i])mSleep(1000)--]]
--[[			notifyMessage('启动'..packagename[i])mSleep(2000)
			appRun(packagename[i])mSleep(8000)--]]
			appRun('com.apple.calculator')
			logDebug('failed'..'multifyone')
			logDebug('failed'..i)
			multifyone()
	elseif i == 2 and DmFindPic('deng.bmp',90,483,980,644,1005) and DmFindPic('six.bmp',90,485,663,641,819)then
			--[[appKill(packagename[i])mSleep(1000)--]]
--[[			appRun(packagename[i])mSleep(8000)		
			notifyMessage('启动'..packagename[i])mSleep(2000)--]]
			appRun('com.apple.calculator')	
			logDebug('failed'..'multifytwo')
			logDebug('failed'..i)
			multifytwo()	
	--sim卡
	elseif DmFindPic('simcard.bmp',80,320,612,347,645) then
			click(x,y)			
	elseif DmFindPic('deng.bmp',90,483,980,644,1005) == false then
			appRun('com.apple.calculator')				
	else
			mSleep(200)
	end		
end

color_gonggao={0x634034,--555,1028;
1,0,0x634035,2,0,0x5F3D32,
0,2,0x634034,1,2,0x5F3D32,
3,4,0xCBB2A7,2,5,0xC7AB9F,
}


--编辑第一个窗口
function multifyone()
	local tt = os.time()
	logDebug('multify_one')
	while true do
		if os.difftime(os.time(),tt) > 100 then
--[[			for j=1,5 do
				notifyMessage('multifyone超时')
			end	--]]		
			appKill(packagename[1])mSleep(2000)
			appRun(packagename[1])mSleep(10000)
			appRun('com.apple.calculator')mSleep(1000)			
			if DmFindPic('mu3.bmp',90,267,78,284,90) then
				click(x,y)
				logDebug('multifyone.mu3')
			end
			logDebug('multifyone超时')
			tt=os.time()				
		--封号确定
		elseif DmFindPic('fenghaoqueding.bmp',90,177,617,188,626) then
			click(x,y)
		--公告的叉子
		elseif MulcolorNoOffset(color_gonggao,90,555,1028,558,1033) then
			click(x,y)
		elseif DmFindPic('multify.bmp',90,42,91,55,103) or DmFindPic('multify1.bmp',90,605,77,616,96) then
			appKill(packagename[1])mSleep(2000)
			appRun(packagename[1])mSleep(10000)
			appRun('com.apple.calculator')mSleep(1000)
			click(x,y)
		elseif DmFindPic('mu1.bmp',90,102,221,118,235) then
			click(x,y)mSleep(500)
		--游戏完全开启	
		elseif DmFindPic('qie.bmp',90,153,331,165,345) or DmFindPic('x_acc.bmp',90,573,1077, 588,1092) then	
			edit()		
			vertical()
			horizon()
			move_y(825,581)	
			edit()
			--notifyMessage('第一个窗口滑动完成')
			logDebug('第一个窗口滑动完成')
			break			
--[[		elseif DmFindPic('x_acc.bmp',90,573,1077, 588,1092) then	
			click(x,y) mSleep(500)--]]
		--sim卡
		elseif DmFindPic('simcard.bmp',80,320,612,347,645) then
			click(x,y)		
		--wifi没了
		elseif DmFindPic('nowifi.bmp',90,225,697,237,712) then
			os.execute('reboot')
		else
			mSleep(200)
		end
	end
end
--编辑第二个窗口
function multifytwo()
	local tt =os.time()
	logDebug('multify_two')
	while true do
		if os.difftime(os.time(),tt) > 100 then
--[[			for j=1,5 do
				notifyMessage('multifytwo超时')
			end--]]
			mSleep(2000)
			appKill(packagename[2])mSleep(2000)
			appRun(packagename[2])mSleep(10000)
			appRun('com.apple.calculator')mSleep(1000)			
			if DmFindPic('mu3.bmp',90,267,78,284,90) then
				click(x,y)
				logDebug('multifytwo.mu3')
			end
			logDebug('multifytwo超时')
			tt=os.time()
		--封号确定
		elseif DmFindPic('fenghaoqueding.bmp',90,177,617,188,626) then
			click(x,y)		
		--公告的叉子
		elseif MulcolorNoOffset(color_gonggao,90,555,1028,558,1033) then
			click(x,y)
		elseif DmFindPic('multify.bmp',90,42,91,55,103) or DmFindPic('multify1.bmp',90,605,77,616,96) then
			appKill(packagename[2])mSleep(2000)
			appRun(packagename[2])mSleep(10000)
			appRun('com.apple.calculator')mSleep(1000)			
			click(x,y)
		elseif DmFindPic('mu2.bmp',90,311,220,326,231) then
			click(x,y)mSleep(500)
		--游戏完全开启	
		elseif DmFindPic('qie.bmp',90,153,331,165,345) or DmFindPic('x_acc.bmp',90,573,1077, 588,1092) then	
			edit()		
			vertical()
			horizon()
			move_y(825,942)	
			edit()
			--notifyMessage('第二个窗口滑动完成')
			logDebug('第二个窗口滑动完成')
			break			
--[[		elseif DmFindPic('x_acc.bmp',90,573,1077, 588,1092) then	
			click(x,y)--]]
		--sim卡 
		elseif DmFindPic('simcard.bmp',80,320,612,347,645) then
			click(x,y)			
		--wifi没了
		elseif DmFindPic('nowifi.bmp',90,225,697,237,712) then
			os.execute('reboot')			
		else
			mSleep(200)
		end				
	end
end

function load()
	local i = 1
	local isok = {0,0}
	local account = 0
	local pwd = 0
	local isname ={0,0}
	local ismofa={0,0}
	local isclear={0,0}
	local isarea={0,0}
	local tt={os.time(),os.time()}
	logDebug('load')
	nowifi = 0
	while (i < 3) do
		if nowifi > 9 then
			logDebug('无wifi重启机器')
			nowifi = 0
			os.execute('reboot')		
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1	
		elseif os.difftime(os.time(),tt[i]) > 180 then
			appKill(packagename[i])
			tt[i]=os.time()
			logDebug('load'..i..'超时')
			logDebug('kill'..':'..packagename[i])		
			isok[i] = 0
			account = 0
			pwd = 0
		elseif DmFindPic('bag.bmp',90,471,567,479,578) and DmFindPicTwo('bag.bmp',90,471,567,479,578) then
			logDebug('登录完成'..i)
			break	
			--[[os.execute('reboot')--]]
		--排队超时问题
		elseif DmFindPic('paidui.bmp',85,309,466,318,476,i) or DmFindPic('bag.bmp',90,471,567,479,578,i) then
			tt[i]=os.time()
		elseif DmFindPic('x_dialog.bmp',90,563,350,572,359,i) then
			click(x,y)  
		--关闭福利窗口
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			closewin(i)
		--兑换魔晶
		elseif DmFindPic('x_mojing.bmp',90,611,249,624,257,i) then
			closewin(i)
		--公告
		elseif DmFindPic('x_gonggao.bmp',85,577,254,585,262,i) then	
			click(x,y)
		elseif DmFindPicTwo('x_gonggao.bmp',85,577,254,585,262) then	
			appKill(packagename[2])
			tt[2]=os.time()
		--服务器验证999
		elseif DmFindPic('999.bmp',85,400,328,407,340,i) and DmFindPic('999queding.bmp',85,306,499,316,506,i) then
			click(x,y)
		--账号封停
		elseif DmFindPic('jiu.bmp',85,309,328,323,341,i) and DmFindPic('jiuqueding.bmp',85,304,497,314,504,i) and isok[i]==1 then
			click(x,y)
			notifyMessage('永久封停')mSleep(1000)
			local file,l,f,jiy,peny,ourline
			file = io.open("/var/touchelf/scripts/avf"..i..".txt","r")
			ourline = tonumber(file:read())		
			local acc = dedaozhanghao(i)
			logDebug('zhanghaofengting'..acc)					
			delete(ourline,i)		
			isok[i]=0
		elseif DmFindPic('jiu.bmp',85,309,328,323,341,i) and DmFindPic('jiuqueding.bmp',85,304,497,314,504,i) then
			click(x,y)
		--服务器连接失败
		elseif DmFindPic('cuowu.bmp',90,310,350,320,358,i) and  DmFindPic('qhzh.bmp',90,125,503,134,515,i) and DmFindPic('ljsb.bmp',90,358,465,369,473,i)  then
			click(x,y)
			isok[i] = 0
--[[			local file,l,f,jiy,peny,ourline
			file = io.open("/var/touchelf/scripts/avf"..i..".txt","r")
			ourline = tonumber(file:read())		
			delete(ourline,i)		
			local acc = dedaozhanghao(ourline)
			logDebug('ljsbshanchuzhanghao'..acc)--]]
		elseif DmFindPic('mofa.bmp',90,88,390,97,398,i) then	
			click(x,y) 
			ismofa[i]=1
		elseif --[[DmFindPic('tishi.bmp',85,310,351,320,361,i) and--]] DmFindPic('rename_sure.bmp',90,360,466,369,472,i) then
			click(x+5,y)mSleep(1000)   logDebug('rename')
			if DmFindPic('saizi.bmp',90,423,545,433,553,i) then--377,545
				click(x-50,y)mSleep(1000)inputText('\b\b\b\b\b\b\b\b\b')mSleep(500)
				local tail=randomnum(3)
				local head = randomstring(4)
				local name =head..tail
				inputText(name)
				click(x+160,y-270)--587,278
			end		
			isarea[i]=0
		elseif DmFindPic('jin.bmp',90,473,509,483,519,i) and isarea[i] == 1 then
			click(x,y) 	
		elseif DmFindPic('ru.bmp',85,984,583,1003,598,i) and isarea[i] == 1 then
			click(x,y)
		elseif DmFindPic('num.bmp',85,546,269,571,293,i) and DmFindPic('numsure.bmp',85,637,426,654,440,i) then
			click(x,y)
			isarea[i]=0
		elseif DmFindPic('huan.bmp',85,424,444,437,457,i) and isok[i]==1 then	
			click(x,y)
		elseif DmFindPic('suoyou.bmp',85,68,549,81,558,i) and isok[i]==1 then
			click(x,y)
		elseif DmFindPic('tuijie.bmp',85,67,549,79,557,i) and isok[i]==1 then--496,559
			click(x+430,y+10)mSleep(500)
			keyborad(area,i)
			isarea[i]=1
		elseif DmFindPic('do.bmp',85,912,269,927,291,i) then
			click(x,y)
		--暂时与服务器断开连接
		elseif DmFindPic('yhzx.bmp',90,360,463,368,472,i) then
			click(x,y) logDebug('yhzx')
		elseif DmFindPic('mofahong.bmp',90,88,386,100,394,i) and DmFindPic('create.bmp',90,498,542,507,550,i) then			
			click(x,y) 
		elseif DmFindPic('jinru.bmp',90,284,540,294,550,i) and ismofa[i]==1 --[[and ismofa[i] == 1 --]]then
			click(x,y)  
		elseif DmFindPic('start.bmp',90,454,480,462,488,i) then
			click(x,y)  
		--选择服务器
		elseif DmFindPic('x_xzfwq.bmp',90,615,247,624,255,i)  and isok[i]==0 then
			click(x,y) 
		--登录异常
		elseif DmFindPic('dlyc.bmp',90,305,498,313,506,i) then
			click(x,y) 
			isname[i]=0
		--切换账号
		elseif DmFindPic('qhzh.bmp',90,125,503,134,515,i) then
			click(x,y)
		--登录按钮
		elseif DmFindPic('denglu.bmp',90,473,387,484,398,i) and isclear[i]==1 then --335,401
			click(x-135,y+10) mSleep(800)
		elseif DmFindPic('denglu.bmp',90,473,387,484,398,i) then
			history(i)
			isclear[i]=1
		elseif DmFindPic('denglu1.bmp',90,474,282,484,292,i) then
			account = dedaozhanghao(i)
			local j=0
			for j=0,20 do
				inputText('\b')
				mSleep(10)
			end
			inputText(account)mSleep(1000)
			if DmFindPic('denglu1.bmp',90,474,282,484,292,i) then--345,332
				click(x-130,y+50)mSleep(1200)
				inputText('\b\b\b\b\b\b\b\b\b\b\b\b\b')mSleep(1000)
				inputText('qwer1876')mSleep(1000)
				click(x,y)
				isok[i] = 1
			end
			
			--账号不存在
			local tt = os.time()
			local iswuxiao = 0
			while os.difftime(os.time(),tt) < 4 do
				if DmFindPic('zhbcz1.bmp',85,216,420,232,435,i) and iswuxiao == 0 then
					
					local file,l,f,jiy,peny,ourline
					file = io.open("/var/touchelf/scripts/avf"..i..".txt","r")
					ourline = tonumber(file:read())		
					local acc = dedaozhanghao(i)
					logDebug('ljsbshanchuzhanghao'..acc)					
					delete(ourline,i)			
					iswuxiao = 1
				else      
					mSleep(50)
				end
			end
		--换行
		elseif DmFindPic('huanhang.bmp',90,563,556,575,569,i) or DmFindPic('return.bmp',80,555,558,570,567,i) then
			click(x,y)			
		--账号不能为空
		elseif DmFindPic('zhwk.bmp',90,309,428,342,459,i) then
			click(x,y)
		else
			mSleep(200)
			failed(i)
		end
		i = i + 1
		if i > 2 then
			i = 1
		end
	end	
end

function keyborad(key,i)
	local length=string.len(key)
	for a =1,10 do--541,563
		click(541,563+(i-1)*361)
	end	
	
	for j=1,length do
		local index = string.sub(key,j,j)
		if index=='1' then
			click(113,428+(i-1)*361)
		elseif index=='2' then
			click(324,426+(i-1)*361)
		elseif index=='3' then
			click(542,421+(i-1)*361)
		elseif index=='4' then
			click(115,469+(i-1)*361)
		elseif index=='5' then
			click(324,470+(i-1)*361)
		elseif index=='6' then
			click(542,470+(i-1)*361)
		elseif index=='7' then
			click(112,515+(i-1)*361)
		elseif index=='8' then
			click(323,514+(i-1)*361)
		elseif index=='9' then
			click(542,516+(i-1)*361)
		elseif index=='0' then
			click(324,565+(i-1)*361)
		end
	end
end

--账号长度错误
color_zhcw={0x1685FE,--311,448;
1,0,0x3695FD,2,0,0x1D88FE,
3,1,0x087EFF,3,2,0x0D80FF,
3,3,0x077DFF,}

--请输入密码
color_srmm={0x3092FD,--310,423;
1,0,0x1C88FE,2,0,0x449DFD,
2,0,0x449DFD,3,0,0x258DFE,
4,0,0x047CFF,4,1,0x0D80FF,
4,2,0x0B7FFF,4,3,0x007AFF,
}

--注册账号
function register(i)
	logDebug('register')
	local account = 0
	local pwd = 0
	local isacc = 0
	local ispwd = 0
	local isreg = 0
	local tt = os.time()
	nowifi = 0
	while true do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		--一秒注册
		elseif os.difftime(os.time(),tt) > 120 then
			appKill(packagename[i])
			tt=os.time()
			logDebug('register'..i..'超时')
			logDebug('kill'..':'..packagename[i])		
			isacc = 0
			ispwd = 0	
		elseif DmFindPic('ymzc.bmp',90,474,322,485,330,i) or DmFindPic('ymzc1.bmp',90,473,432,483,442,i) then
			click(x,y)
		elseif DmFindPic('zhanghao.bmp',90,130,291,137,299,i) and isacc == 0 then--322,302
			click(x+90,y+10)mSleep(1000)
			local tail=randomnum(8)
			account = 'qmqj'..tail
			inputText('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')mSleep(500)
			inputText(account)
			isacc=1
		elseif DmFindPic('mima.bmp',90,128,347,135,356,i) and ispwd == 0 then--297,357
			click(x+170,y+10)mSleep(1000)
			inputText('\b\b\b\bb\b\b\b\b\b\b\b\b')mSleep(500)
			inputText('qwer1876')
			ispwd = 1
		--提交账号
		elseif DmFindPic('tjzc.bmp',90,458,346,467,354,i) and isreg == 0 then
			click(x,y)
			isreg = 0
		--登录异常
		elseif DmFindPic('dlyc.bmp',90,305,498,313,506,i) then
			click(x,y) 
		--请输入密码
		elseif DmFindPic('srmm.bmp',80,307,433,326,450,i) then
			click(x,y)
			isacc = 0
			pwd = 0
		elseif MulcolorNoOffset(color_srmm,85,310,423,214,426,i) then
			click(x,y)
		elseif DmFindPicFuzzy('mimaqueding.bmp',85,305,421,326,440,0xffffff,i) then
			click(x,y)
			isacc = 0
			pwd = 0
		--账号长度错误
		elseif MulcolorNoOffset(color_zhcw,85,311,448,314,451,i) then
			click(x,y)
			isacc = 0
			pwd = 0
		elseif DmFindPicFuzzy('changducuowu.bmp',85,330,456,347,474,0xffffff,i) then
			click(x,y)
			isacc = 0
			pwd = 0			
		--注册失败
		elseif DmFindPic('zcsb.bmp',90,309,443,321,454,i) then
			click(x,y)		
			isacc = 0
			ispwd = 0
			isreg = 0
		--切换账号
		elseif DmFindPic('qhzh.bmp',90,125,503,134,515,i) and isacc==1 and ispwd == 1 then
			local file = io.open('/var/touchelf/scripts/abc'..i..'.txt','a+')
			logDebug('abc'..i..':'..account)
			file:write(account..'\n')
			file:close()
			--notifyMessage('写入完成')
			break
		elseif DmFindPic('qhzh.bmp',90,125,503,134,515,i) then
			click(x,y)
		else
			mSleep(300)
			fail(i)
		end
--[[		i = i + 1
		if i > 2 then
			i = 1
		end--]]
	end			
end

--清除历史记录
function history(i)
	logDebug('history'..i)
	local wf=1
	local tt = os.time()
	while wf<=2 do
		if os.difftime(os.time(),tt) > 120 then
			notifyMessage('删除不了历史记录')
			appKill(packagename[i])
			break
		elseif DmFindPic('x_lsjl1.bmp',85,388,475,396,485,i) then
			clickone(392,480+(i-1)*361)mSleep(500)
		elseif DmFindPic('x_lsjl1.bmp',85,388,475,396,485,i)==false and DmFindPic('x_lsjl.bmp',85,388,432,397,442,i)then
			clickone(x,y)
			logDebug('history'..i..'ok')
			break
		elseif DmFindPic("xiala.bmp", 90,382,393,393,401,i) --[[and wf==1--]] then
		   clickone(387,397+(i-1)*361)mSleep(1500)
		   wf=2			
		end       
		mSleep(200)
	end 	
end

--读取帐号
function getAccount(i)
	local file,l,f
	file = io.open("var/touchelf/scripts/avf"..i..".txt","r")
	ourline = tonumber(file:read())
	file:close()
	file = io.open("var/touchelf/scripts/abc"..i..".txt","r")
	mSleep   (500)
	f=0
	for l in file:lines() do  
		f=f+1
		if ourline==f then
			account=l			
			break
		end 
	end
	mSleep (500)
	file:close()
	if tonumber(ourline)>f then
		local file,hello
		file = io.open("var/touchelf/scripts/avf"..i..".txt","r")
		ourline = tonumber(file:read())
		file:close()
		file = io.open("var/touchelf/scripts/avf"..i..".txt","w")
		file:write(1)
		file:close()
		--[[finish()--]]
		file = io.open("var/touchelf/scripts/avf"..i..".txt","r")
		ourline = tonumber(file:read())
		file:close()
		file = io.open("var/touchelf/scripts/abc"..i..".txt","r")
		 mSleep   (500)
		f=1
		for l in file:lines() do  	
			if ourline==f then
				account=l
				break
			end 
			f=f+1
		end
		mSleep   (500)
		file:close()
	end
     account=string.match(account,"%s*(.-)%s*$")	
	return account
end

--读取帐号
function dedaozhanghao(bao)
	local file,l,f,jiy,peny,ourline
	file = io.open("/var/touchelf/scripts/avf"..bao..".txt","r")
	ourline = tonumber(file:read())
	file:close()
	file = io.open("/var/touchelf/scripts/abc"..bao..".txt","r")
	 mSleep   (500)
	f=0
	peny=1
	for l in file:lines() do  
		f=f+1
		if ourline==f then
			zhaohao=l
			peny=2
			break
		end    
	end	
	mSleep   (500)
	file:close()
	if f>30 then
		jiy=30
	else
	    jiy=f
	end 
	
	if tonumber(ourline)>jiy then
		local file,hello
		if tonumber(ourline)<=30 and peny==1 then 
			register(bao)
		elseif tonumber(ourline) > 30 then 
			file = io.open("/var/touchelf/scripts/avf"..bao..".txt","r")
			ourline = tonumber(file:read())
			file:close()
			file = io.open("/var/touchelf/scripts/avf"..bao..".txt","w")
			file:write(1)
			file:close()
			file = io.open("/var/touchelf/scripts/avf"..bao..".txt","r")
			ourline = tonumber(file:read())
			file:close()
--[[			while true do
				notifyMessage('练完了')mSleep(2000)
			end--]]
		end
		file = io.open("/var/touchelf/scripts/abc"..bao..".txt","r")
		mSleep   (500)
		f=1
		for l in file:lines() do  
			if ourline==f then
				zhaohao=l
				break
			end 
			f=f+1
		end
		mSleep   (500)
		file:close()
	end
    zhaohao=string.match(zhaohao,"%s*(.-)%s*$")
	return zhaohao
end

function restoreAvf()
	local file,hello
	local t = os.time()
	file = io.open ("/var/touchelf/scripts/flag.txt","r")
	local ourline = tonumber(file:read())
	local tt = os.date('*t',t)
	if tt.hour ==0 and ourline == 1 then
		file = io.open("/var/touchelf/scripts/avf1.txt","w")
		file:write(1)
		file:close()
		file = io.open("/var/touchelf/scripts/avf2.txt","w")
		file:write(1)
		file:close()		
		file = io.open("/var/touchelf/scripts/flag.txt","w")
		file:write(2)
		file:close()
		logDebug('还原avf')
	elseif tt.hour == 23 then
		file = io.open("/var/touchelf/scripts/flag.txt","w")
		file:write(1)	
		file:close()	
	else
		mSleep(200)
	end
	if tt.hour  - start > 8 then
		os.execute("reboot")
	end
end

function restore()
	local t = getNetTime()
	local tt =os.date('*t',t)
	if tt.hour == 22 then
		file = io.open("/var/touchelf/scripts/flag.txt","w")
		file:write(1)		
	else
		mSleep(200)
	end
end

--随机字符串
--参数n为想要得到字符串的长度
function randomnum(n)
		local chars = '0123456789'
		local strs = ''
		math.randomseed(tostring(os.time()):reverse():sub(1,n))
		for i = 1,n do
			local index = math.random(string.len(chars))
			strs = strs..string.sub(chars,index,index)
		end
		return strs
end

--随机字符串
function randomstring(n)
		local chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
		local strs = ''
		math.randomseed(tostring(os.time()):reverse():sub(1,n))
		for i = 1,n do
			local index = math.random(string.len(chars))
			strs = strs..string.sub(chars,index,index)
		end
		return strs
end

--修改文本
function modifyTxt(i)
	local file,hello,ourline
	file = io.open("var/touchelf/scripts/avf"..i..".txt","r")
	ourline = tonumber(file:read())
	file:close()
    file = io.open("var/touchelf/scripts/avf"..i..".txt","w")
	file:write(ourline+1)
	file:close()
end


--升二转
function birth(i)
	local time_table=os.time()
	logDebug('birth'..i)	
	while true do
		if os.difftime(os.time(),time_table) > 180 then
			appKill(packagename[i]) 
			logDebug('birth:'..i..'超时')
			notifyMessage('干掉'..packagename[i]) mSleep(2000)
			time_table= os.time()	
			break
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)			
		elseif DmFindPic('xunlu.bmp',90,295,312,302,321,i) then	
		
		elseif DmFindPic('3zhuan.bmp',85,545,292,553,308,i) and DmFindPic('x_zs.bmp',85,614,249,623,256,i) then
			click(x,y)
			notifyMessage('转生成功')
			break				
		elseif DmFindPic('3zhuan.bmp',85,545,292,553,308,i) and DmFindPic('x_zs.bmp',85,614,249,623,256,i)==false then
			notifyMessage('转生成功')
			appKill(packagename[i])
			break
		--黄字转生
		elseif DmFindPic('huangzs.bmp',85,234,468,242,475,i) then
			click(x+10,y+10) 
		--绿色转生
		elseif DmFindPic('lvzs.bmp',85,483,548,493,555,i) then
			click(x,y)  
		--转生成功
		elseif DmFindPic('zscg.bmp',85,307,509,316,519,i) then
			click(x,y)   
		--立即转生
		elseif DmFindPic('lijizhuansheng.bmp',85,249,443,257,452,i) then
			click(x,y)  	
		elseif DmFindPic('bag.bmp',90,471,567,479,578,i) and DmFindPicFuzzy('1zhuan100.bmp',90,63,229,87,240,0xffffff,i) and DmFindPic('zhuansheng.bmp',70,533,379,541,387,i) then
			click(x,y)			
		elseif DmFindPic('x_fuli.bmp',85,613,249,623,258,i) then
			click(x,y)  mSleep(100)			
		else
			failed(i)
			con(i)
		end
	end
end

function level(i)
	local tt = os.time()
	while os.difftime(os.time(),tt) < 4 do
		if DmFindPic('bag.bmp',90,471,567,479,578,i) and DmFindPicFuzzy('1zhuan100.bmp',90,63,229,87,240,0xffffff,i) and DmFindPic('zhuansheng.bmp',70,533,379,541,387,i) then
			click(x,y)
			return true
		else
			closewin(i)
		end
	end
	return false
end

function levelup()
	nowifi = 0
	local b1 =os.time()
	local b2 =os.time()
	local t1=os.time()
	local t2=os.time()
	local time_table={os.time(),os.time()}
	local bag_table = {b1,b2}
	local click_time={os.time(),os.time()}
	local i = 1
	local count={0,0}
	logDebug('levelup')
	local isover={0,0}
	while (i<3) do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		--关闭窗口之后将另外的窗口超时的起始时间置为0		
		elseif os.difftime(os.time(),time_table[i]) > 300 and isMoving(i) then
			appKill(packagename[i]) 
			logDebug('levelup:'..i..'超时')
			--[[notifyMessage('干掉'..packagename[i]) mSleep(2000)--]]
			time_table[i] = os.time()
		--排队超时问题
		elseif DmFindPic('paidui.bmp',85,309,466,318,476,i) then
			time_table[i]=os.time()			
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y) 
		--领取补偿
		elseif DmFindPic('huoqu.bmp',90,483,486,491,494,i) then
			clickone(x+20,y+10)	 
		elseif DmFindPic('buchang.bmp',90,518,389,527,398,i) then
			clickone(x,y)  
		--装备坏了
		elseif DmFindPic('bag.bmp',90,471,567,479,578,i) and DmFindPic('huaile.bmp',85,523,367,529,374,i)then
			click(x,y)
		elseif DmFindPic('lijixiuli.bmp',85,248,444,259,452,i) then
			click(x,y)
		-- 被打死了
		elseif DmFindPic('tiaoguo.bmp',90,534,906-361,539,916-361,i) then
			clickone(x,y)
		elseif DmFindPic('tiaoguo1.bmp',85,575,895-361,580,906-361,i) then
			clickone(x,y) 
		elseif DmFindPic('jump.bmp',90,554,556,560,566,i) then
			clickone(x,y) 	
		elseif DmFindPic('hcfh.bmp',90,286,431,295,440,i) then
			clickone(x,y)
		elseif DmFindPic('eye.bmp',90,582,347,589,356,i) then
			clickone(x,y) 
		elseif DmFindPic('ya.bmp',85,560,233,571,242,i)==false and (DmFindPic('peidai.bmp',90,402,505,410,513,i) or DmFindPic('peidai1.bmp',85,401,484,410,493,i)) then
			clickone(x,y) 
		elseif DmFindPic('use.bmp',90,401,505,410,512,i) then
			clickone(x,y) 
		--巴洛克卡点
		elseif DmFindPic('lvblk.bmp',85,49,527,62,542,i) and DmFindPic('shouzhi.bmp',90,319,519,331,529,i) then--581,546
			click(x+261,y+26)
		elseif DmFindPic('shouzhi.bmp',90,319,519,331,529,i) and DmFindPic('skill.bmp',90,501,555,508,569,i) then--578,543
			click(x+80,y-10)
		elseif DmFindPic('shouzhi.bmp',90,319,519,331,529,i) then
			clickone(x,y)			
		--整理背包
		elseif os.difftime(os.time(),bag_table[i]) >480 and DmFindPic('bag.bmp',90,471,567,479,578,i) then
			click(x,y) 
			if DmFindPic('renwu.bmp',90,331,236,343,246,i) then	
				bag(i)
				bag_table[i] = os.time()
			end			
		--防止寒冰皇后卡住
		elseif DmFindPic('liangbai.bmp',85,191,252,203,259,i)  then		 	
			if DmFindPic('ksgj.bmp',90,534,485,542,495,i) then
				click(x,y)
			end
		--恶魔广场剧情开始挂机
		elseif DmFindPic('em.bmp',80,587,232,596,243,i) and DmFindPic('ksgj.bmp',90,534,485,542,495,i) then
			click(x,y)
		--boss打完了
		elseif DmFindPic('em.bmp',80,587,232,596,243,i) and DmFindPic('fbqd.bmp',85,387,493,397,502,i) then
			click(513,242+(i-1)*361)
		elseif DmFindPic('lkqd.bmp',85,258,443,268,453,i) then
			click(x,y)
		elseif DmFindPic('ling.bmp',85,486,487,494,496,i) then
			clickone(x,y)
			time_table[i] = os.time()		
		--前往副本
		elseif DmFindPic('qianwang.bmp',85,486,487,493,494,i) then
			clickone(x,y) 
			time_table[i] = os.time() 
		--章节
		elseif DmFindPic('zhangjie.bmp',90,305,494,315,502,i) or DmFindPic('zhangjie1.bmp',80,306,496,317,507,i) then
			clickone(x,y)
			time_table[i] = os.time() 
		elseif DmFindPic('hei.bmp',85,8,251,17,260,i) then
			clickone(x+10,y+10) 
		elseif DmFindPic('peidaicb.bmp',90,304,404,313,414,i) then
			clickone(x,y) 
		--关闭翅膀窗口
		elseif DmFindPic('x_cb.bmp',90,615,246,624,256,i) then
			clickone(x,y) 
		--1转1级之后
		elseif DmFindPicFuzzy('1zhuan1.bmp',90,49,354,81,365,0xffffff,i) and DmFindPic('bag.bmp',90,471,567,479,578,i) then--528,389
			click(x+58,y-178)
		--要转生了
		elseif isover[1]==1 and isover[2]==1 then
			if allow() > 0 then
				break
			end			
		elseif DmFindPicFuzzy('1zhuan80.bmp',85,49,354,76,365,0xffffff,i) and DmFindPic('bag.bmp',90,471,567,479,578,i) then
			time_table[i]=os.time()    
			isover[i]=1			
			if DmFindPic('ksgj.bmp',90,534,485,542,495,i) then click(x,y) end 
		elseif DmFindPicFuzzy('1zhuan90.bmp',85,49,354,76,365,0xffffff,i)	and DmFindPic('bag.bmp',90,471,567,479,578,i) then
			time_table[i]=os.time()    
			isover[i]=1
			if DmFindPic('ksgj.bmp',90,534,485,542,495,i) then click(x,y) end 
		elseif DmFindPicFuzzy('2zhuan1.bmp',85,48,354,70,366,0xffffff,i) == false and DmFindPicFuzzy('2zhuan.bmp',85,39,354,65,365,0xffffff,i) and DmFindPic('bag.bmp',90,471,567,479,578,i) then
			time_table[i]=os.time()        
			isover[i]=1		
			if DmFindPic('ksgj.bmp',90,534,485,542,495,i) then click(x,y) end 
		elseif DmFindPicFuzzy('2zhuan1.bmp',85,48,354,70,366,0xffffff,i) and DmFindPic('bag.bmp',90,471,567,479,578,i) then
			time_table[i]=os.time()        
			isover[i]=1 
		elseif DmFindPicFuzzy('1zhuan95.bmp',85,49,354,76,365,0xffffff,i) and DmFindPic('bag.bmp',90,471,567,479,578,i) then
			time_table[i]=os.time()        
			isover[i]=1
			if DmFindPic('ksgj.bmp',90,534,485,542,495,i) then click(x,y) end 
		elseif count[i] > 8 --[[and DmFindPic('xunlu.bmp',90,295,312,302,321,i) == false--]] and DmFindPic('bag.bmp',90,471,567,479,578,i) then
			--[[click(42,557+(i-1)*361)--]]
			touchDown(0,42,557+(i-1)*361)
			mSleep(1000)
			touchUp(0)
			count[i] = 0
			if DmFindPic('heilongbo.bmp',85,535,536,546,548,i) then
				click(x,y)mSleep(500)
			end			
		elseif (DmFindPic('zhandou.bmp',85,295,313,302,322,i) or DmFindPic('xunlu.bmp',90,295,312,302,321,i)) and DmFindPic('bag.bmp',90,471,567,479,578,i) and os.difftime(os.time(),click_time[i]) < 25  then
			--[[if isMoving(i) then
				click(24,371+(i-1)*361)
			end--]]
		elseif isMoving(i) and DmFindPic('bag.bmp',90,471,567,479,578,i)  and DmFindPicFuzzy('ren.bmp',85,8,337,23,352,0xffffff,i) then --24,371		
			click(24,371+(i-1)*361)
			count[i]=count[i]+1
			click_time[i]=os.time()
		--任务小黄字
		elseif DmFindPic('x_dialog.bmp',85,563,350,572,359,i) and DmFindPicFuzzy('huangzi.bmp',85,280,768,347,810,i) then
			click(x,y)
		elseif DmFindPic('x_dialog.bmp',85,563,350,572,359,i) and DmFindPicFuzzy('huangzi1.bmp',85,338,431,347,449,i) then
			click(x-20,y+10)		
		elseif DmFindPic('x_dialog.bmp',85,563,350,572,359,i) and DmFindPicFuzzy('huangzi1.bmp',85,338,791-361,349,811-361,i) then
			click(x,y)		
		--pk	
		elseif DmFindPic('x_dialog.bmp',85,563,350,572,359,i) and DmFindPicFuzzy('huangzi2.bmp',85,307,428,318,447,i) then
			click(x-20,y+10)			
		--巴洛克之死
		elseif DmFindPic('x_dialog.bmp',85,563,350,572,359,i) and DmFindPicFuzzy('huangzi3.bmp',85,349,431,360,446,i) then
			click(x-20,y+10)		
		--恶魔广场		
		elseif DmFindPic('x_dialog.bmp',85,563,350,572,359,i) and DmFindPicFuzzy('huangzi4.bmp',85,337,431,348,446,i) then
			click(x-20,y+10)						
		--黄字转生
		elseif DmFindPic('huangzs.bmp',85,234,468,242,475,i) then
			click(x+10,y+10)
		--不够转生
		elseif DmFindPic('xuqiudengji.bmp',85,463,471,469,482,i) and DmFindPic('x_zs.bmp',85,614,249,623,256,i) then
			--关闭转生窗口
			click(x,y)		
		--关闭窗口之后将另外的窗口超时的起始时间置为0	
		elseif DmFindPic('lvzs.bmp',85,483,548,493,555,i) and DmFindPic('xuqiudengji.bmp',85,463,471,469,482,i) and DmFindPic('x_zs.bmp',90,614,249,623,256,i)then		
			click(x,y)
		elseif DmFindPic('lvzs.bmp',85,483,548,493,555,i) and DmFindPic('xuqiudengji.bmp',85,463,471,469,482,i) and DmFindPic('x_zs.bmp',90,614,249,623,256,i)== false then
			appKill(packagename[i])
			time_table[1]=os.time()
			time_table[2]=os.time()
			logDebug('转生关闭窗口消失')
		--绿色转生
		elseif DmFindPic('lvzs.bmp',85,483,548,493,555,i) then
			click(x,y)  
		--转生成功
		elseif DmFindPic('zscg.bmp',85,307,509,316,519,i) then
			click(x,y)   
		--任务对话框
		elseif DmFindPic('ling.bmp',85,486,487,494,496,i)==false and DmFindPic('x_dialog.bmp',85,563,350,572,359,i) then
			clickone(x,y)  
		--立即转生
		elseif DmFindPic('lijizhuansheng.bmp',85,249,443,257,452,i) then
			click(x,y)  
		elseif DmFindPic('x_fuli.bmp',85,613,249,623,258,i) then
			click(x,y)  mSleep(100)	
		--兑换魔晶 /地图
		elseif DmFindPic('x_mojing.bmp',85,611,249,624,257,i) then
			click(x,y)		
		--古战场xx
		elseif DmFindPic('x_gzc.bmp',85,615,249,623,257,i) then
			click(x,y)			
		else		
			mSleep(200)	
			failed(i)		
		end
		i = i + 1
		if i > 2 then
			i = 1
		end		
	end
end

--双窗口是否做完主线任务
function isfinish()
	if DmFindPicFuzzy('1zhuan90.bmp',90,49,354,76,365,0xffffff) and DmFindPicFuzzyTwo('1zhuan90.bmp',90,49,354,76,365,0xffffff) and DmFindPic('bag.bmp',90,471,567,479,578) and DmFindPicTwo('bag.bmp',90,471,567,479,578) then
		return true
	elseif DmFindPicFuzzy('1zhuan90.bmp',90,49,354,76,365,0xffffff) and DmFindPicFuzzyTwo('1zhuan95.bmp',90,49,354,76,365,0xffffff) and DmFindPic('bag.bmp',90,471,567,479,578) and DmFindPicTwo('bag.bmp',90,471,567,479,578) then
		return true
	elseif DmFindPicFuzzy('1zhuan90.bmp',90,49,354,76,365,0xffffff) and DmFindPicFuzzyTwo('2zhuan1.bmp',90,48,354,70,366,0xffffff) and DmFindPic('bag.bmp',90,471,567,479,578) and DmFindPicTwo('bag.bmp',90,471,567,479,578) then
		return true
	end
end

--整理背包
function bag(i)
		local count = 0
		nowifi = 0
		local t1=os.time()
		local t2=os.time()
		local time_table={t1,t2}		
		local iszl={0,0}
		--回收
		logDebug('bag'..i)
		while true do			
			if nowifi > 9 then
				logDebug('无wifi自动重启')	
				nowifi = 0	
				os.execute('reboot') 
			elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
				notifyMessage('屏幕左上角wifi不见了')
				logDebug('屏幕左上角wifi不见了')
				nowifi = nowifi + 1
				mSleep(2000)			
			elseif os.difftime(os.time(),time_table[i]) > 120 then
				appKill(packagename[i])				
				time_table[i]=os.time()
				logDebug('kill'..':'..packagename[i])				
				logDebug('bag'..i..'超时')
			elseif DmFindPic('paidui.bmp',85,309,466,318,476,i) then
				time_table[i]=os.time()				
			--连接断开立即重连与立即刷新
			elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
				clickone(x,y)
			elseif DmFindPic('bag.bmp',90,471,567,479,578,i) then
				click(x,y)  mSleep(1500) pack(i) 
--[[			elseif DmFindPic('peidai.bmp',90,402,505,410,513,i) or DmFindPic('peidai1.bmp',85,401,484,410,493,i) then
				click(x,y) 		--]]		
			elseif DmFindPic('x_dialog.bmp',90,563,350,572,359,i) then
				click(x,y) 	
			elseif DmFindPic('x_zhuoyue.bmp',90,446,315,456,325,i) then
				click(x,y)
			elseif DmFindPic('huishou.bmp',85,375,553,383,561,i) or DmFindPic('zbhuishou.bmp',90,377,549,387,559,i) then
				click(x,y) 
			--勾选			
			elseif DmFindPic('renwu.bmp',90,331,236,343,246,i) and DmFindPic('lvzhuang.bmp',85,163,507,172,519,i) then
				click(x,y)  
			elseif DmFindPic('renwu.bmp',90,331,236,343,246,i) and DmFindPic('lanzhuang.bmp',85,229,507,239,518,i) then
				click(x,y) 
			elseif DmFindPic('renwu.bmp',90,331,236,343,246,i) and DmFindPic('zizhuang.bmp',85,300,508,308,518,i) then
				click(x,y) 
			--回收确定	
			elseif DmFindPic('hsqueding.bmp',90,260,462,269,470,i) then
				click(x,y) 	
			elseif count > 2 then
				local tt = os.time()
				while os.difftime(os.time(),tt) < 2 do
					if DmFindPic('zhengli.bmp',80,568,551,576,560,i) and iszl[i] == 0 then
						click(x,y)
						iszl[i]=1
					end
				end				
				closewin(i)
				logDebug('回收魔晶点击超过3次')
				break		
			--贵重物品是否回收
			elseif DmFindPic('gzwp.bmp',85,260,467,269,473,i) then
				click(x,y)
			--立即回收
			elseif DmFindPic('ljhuishou.bmp',85,122,544,130,554,i) then
				click(x,y) 
				count = count + 1	
			--误点其他地方导致卡住了
			elseif DmFindPic('x_all.bmp',90,620,243,631,252,i) then
				click(x,y)			
			elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
				click(x,y)  mSleep(300)		
			--兑换魔晶 /地图
			elseif DmFindPic('x_mojing.bmp',90,611,249,624,257,i) then
				click(x,y)			
			--古战场xx
			elseif DmFindPic('x_gzc.bmp',90,615,249,623,257,i) then
				click(x,y)				
			else
				mSleep(200)
				failed(i)
			end	
		end		
end


--背包完全打开
function pack(i)
	logDebug('pack'..i)
	nowifi = 0
	local tt =os.time()
	while os.difftime(os.time(),tt) < 4 do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	
		elseif DmFindPic('renwu.bmp',90,331,236,343,246,i) then
			logDebug('背包完全打开'..i)
			break
		elseif DmFindPic('bag.bmp',90,471,567,479,578,i) then
			click(x,y)
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			closewin(i)
		elseif DmFindPic('x_dialog.bmp',90,563,350,572,359,i) then
			click(x,y)  
		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)			
		else
			mSleep(200)
			failed(i)
		end
	end
end

--使用背包的物品
function using(i)
	nowifi = 0
	local clear = 0
	local a = 0
	local b = 0
	local wz = 1
	local zz={0,0}
	local t1=os.time()
	local t2=os.time()
	local time_table={t1,t2}	
	logDebug('using')	
	while true do		
		if wz <= 5 then
			a = wz-1
			b = 0
		elseif wz > 5 and wz <= 10 then
			a = wz - 6
			b = 1
		elseif wz > 10 and wz <= 15 then
			a = wz - 11
			b = 2
		elseif wz > 15 and wz <= 20 then
			a = wz - 16
			b = 3
		elseif wz > 20 and wz <= 25 then
			a = wz - 21
			b = 4
		end
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		elseif os.difftime(os.time(),time_table[i]) > 180 then
			time_table[i]=os.time()
			appKill(packagename[i])
			logDebug('kill'..':'..packagename[i])
			logDebug('using'..i..'超时')
		elseif DmFindPic('paidui.bmp',85,309,466,318,476,i) then
			time_table[i]=os.time()			
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		--打开背包
		elseif DmFindPic('bag.bmp',90,471,567,479,578,i) then
			click(x,y)  
			pack(i)	
			if DmFindPic('zhengli.bmp',80,568,551,576,560,i) then
				click(x,y)mSleep(500)
			end		
		--彩色羽毛
		elseif DmFindPic('csym.bmp',85,357,316,368,327,i) then--449,303
			click(x+90,y-13)
		--恶魔凭证留着
		elseif DmFindPic('ee.bmp',85,263,370,274,378,i) or DmFindPic('ee1.bmp',85,263,389,274,401,i) then --449,289   450,310
			click(x+190,y-80)
		elseif DmFindPic('e.bmp',85,311,325,319,333,i) or DmFindPic('e1.bmp',85,310,297,318,307,i) then	--450,311
			click(x+140,y-10)			
		--全部使用
		elseif DmFindPic('qbshiyong.bmp',90,307,495,319,502,i) then
			click(x,y)		
		elseif DmFindPic('fuhuoshi.bmp',90,263,347,274,354,i) or DmFindPic('fuhuoshi1.bmp',90,263,368,272,378,i) then
			closewin(i)
			logDebug('fuhuoshi'..i)
			break	
		--声望勋章
		elseif DmFindPic('sq.bmp',85,257,339,266,347,i) and DmFindPic('sqsy.bmp',85,463,490,473,500,i) then
			click(x,y)
		elseif DmFindPic('sq1.bmp',85,257,362,269,370,i) and DmFindPic('sqsy1.bmp',85,461,467,471,477,i) then
			click(x,y)
		--成就印记
		elseif DmFindPic('cj.bmp',85,263,374,272,382,i) and DmFindPic('cjsy.bmp',85,465,469,474,476,i) then
			click(x,y)
		elseif DmFindPic('cj1.bmp',85,264,351,272,360,i) and DmFindPic('cjsy1.bmp',85,461,489,473,498,i) then
			click(x,y)
		--金币部分
		elseif DmFindPic('jinbi1.bmp',90,241,413,249,423,i) and DmFindPic('jinbishiyong.bmp',90,462,460,472,468,i) then
			click(x,y)
		elseif DmFindPic('jinbi2.bmp',90,243,393,252,402,i) and 	DmFindPic('jinbishiyong1.bmp',90,464,479,471,489,i) then
			click(x,y)
		--合成材料部分
		elseif DmFindPic('hecheng.bmp',90,242,412,255,419,i) and DmFindPic('hechengcs.bmp',90,464,461,472,469,i) then
			click(x,y) 
		elseif DmFindPic('hecheng1.bmp',90,242,393,250,403,i) and DmFindPic('hechengcs1.bmp',90,461,481,471,491,i) then
			click(x,y) 
		--果子部分
		elseif DmFindPic('guoshi.bmp',90,255,390,267,397,i) and DmFindPic('shiyonggz.bmp',90,463,441,471,448,i) then
			click(x,y)
		--晶石也卖了
		elseif DmFindPic('jing.bmp',85,263,351,271,359,i) then--449,284
			click(x+180,y-70)
			closewin(i)
			break
		elseif DmFindPic('cz.bmp',85,262,347,270,356,i) or DmFindPic('cz1.bmp',85,261,370,270,378,i) then --448,281
			click(x+180,y-70)
			closewin(i)
			break
		--背包有tu
		elseif DmFindPic('jpcs.bmp',90,465,464,474,475,i) or 
				DmFindPic('jpcs1.bmp',90,461,473,473,484,i) or 
				DmFindPic('jpcs2.bmp',90,461,489,472,498,i) or 
				DmFindPic('jpcs3.bmp',90,462,494,473,505,i) then
			click(x,y)
		--回收垃圾宠物
		elseif DmFindPic('huishoucw.bmp',85,464,553,472,562,i) then
			click(x,y)
		elseif wz > 25 then
			closewin(i)
			logDebug('25格使用完成')
			break
		elseif DmFindPic('renwu.bmp',90,331,236,343,246,i) then
			mSleep(200)
			click(390+a*50,300+b*50+(i-1)*361)mSleep(300)
			wz = wz + 1
		--贵重物品
		elseif DmFindPic('guizhongwuping.bmp',85,359,463,369,473,i) then
			click(x,y)
		--不存在的物品的X子
--[[		elseif DmFindPic('x_zb.bmp',90,518,244,528,254,i) then
			click(x,y)
		elseif DmFindPic('x_yumao.bmp',90,440,289,450,298,i) then 
			click(x,y)
		elseif DmFindPic('x_lh.bmp',90,451,302,459,311,i) then 
			click(x,y)
		elseif DmFindPic('x_zb1.bmp',85,452,276,461,283,i) then
			click(x,y)
		elseif DmFindPic('x_zb2.bmp',85,449,243,458,253,i) then
			click(x,y)
		elseif DmFindPic('x_zb3.bmp',85,451,270,459,276,i) then
			click(x,y)
		elseif DmFindPic('x_zb4.bmp',85,452,298,462,306,i) then
			click(x,y)
		elseif DmFindPic('x_laji1.bmp',85,448,294,458,303,i) then
			click(x,y)
		elseif DmFindPic('x_laji.bmp',85,448,248,458,256,i) then
			click(x,y)
		elseif DmFindPic('x_shjp.bmp',85,450,305,461,313,i) then
			click(x,y)
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y)  	
		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)	--]]
		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)			
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y)  				
		elseif DmFindPic('x_all.bmp',90,620,243,631,252,i) then
			click(x,y)
		else
			mSleep(200)
			failed(i)
		end
	end
end

--兑换护身符
function exchange()
	nowifi = 0
	local t1=os.time()
	local t2=os.time()
	local time_table={t1,t2}	
	local i = 1 
	logDebug('exchange')
	while (i<3) do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		elseif os.difftime(os.time(),time_table[i]) > 180 then
			appKill(packagename[i])
			time_table[i] = os.time()
			logDebug('kill'..':'..packagename[i])			
			logDebug('exchange'..i..'超时')
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif DmFindPic('bag.bmp',90,471,567,479,578,i) then
			click(x,y)  pack(i)
		--佩戴护身符
		elseif DmFindPic('peidai.bmp',90,402,505,410,513,i) or DmFindPic('peidai1.bmp',85,401,484,410,493,i) or DmFindPic('peidaihsf.bmp',85,402,483,411,491,i) then
			click(x,y)			
		elseif (DmFindPic('huiduihuan.bmp',90,549,338,558,349) and DmFindPicTwo('huiduihuan.bmp',90,549,338,558,349)) or
				(DmFindPic('hushenfu.bmp',85,303,312,314,321) and DmFindPicTwo('hushenfu.bmp',85,303,312,314,321))then
			mSleep(500)
			closewin(1)
			closewin(2)
			logDebug('护身符兑换完成')
			break
		elseif DmFindPic('huiduihuan.bmp',90,549,338,558,349,i) or DmFindPic('hushenfu.bmp',85,303,312,314,321,i) then
		
		elseif DmFindPic('huobi.bmp',90,44,348,55,358,i) then
			click(x,y)
		elseif DmFindPic('qianwangmj.bmp',90,588,490,595,499,i) then
			click(x,y)mSleep(1500)
		elseif DmFindPic('lijiduihuan.bmp',90,543,332,551,340,i) then
			click(x,y)
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y)  mSleep(300)	
		--兑换魔晶
		elseif DmFindPic('x_dialog.bmp',90,563,350,572,359,i) then
			click(x,y)  		
--[[		elseif DmFindPic('x_mojing.bmp',90,611,249,624,257,i) then
			click(x,y) mSleep(300)		--]]
--[[		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)	--]]		
--[[		elseif DmFindPic('renwu.bmp',90,331,236,343,246,i)	 then
			closewin(i)--]]
		else
			mSleep(300)
			failed(i)
		end
		i = i + 1
		if i > 2 then
			i = 1
		end
	end
end

--升级技能
function upskill()
	nowifi = 0
	local i = 1
	math.randomseed(tostring(os.time()):reverse():sub(1, 1))  
	local t1=os.time()
	local t2=os.time()
	local time_table={t1,t2}	
	logDebug('upskill')
	while (i<3)do		
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		elseif os.difftime(os.time(),time_table[i]) > 240 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('kill'..':'..packagename[i])
			logDebug('upskill'..i..'超时')
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		-- 被打死了							
		elseif DmFindPic('hcfh.bmp',90,286,431,295,440,i) then
			click(x,y)				
		elseif DmFindPic('bag.bmp',90,471,567,479,578,i) then
			click(x,y)  pack(i)
		elseif DmFindPic('jineng.bmp',90,24,431,34,442,i) then
			click(x,y) mSleep(300)
		elseif DmFindPic('huitisheng.bmp',85,478,526,486,536) and DmFindPicTwo('huitisheng.bmp',85,478,526,486,536) then
			closewin(1)
			closewin(2)
			break			
		elseif DmFindPic('jinengliang.bmp',90,30,431,39,442,i) then	--随机点击4个技能 199,322 276,318 353,319 429,317
			local wz = {{199,322},{275,322},{353,319},{429,317}}
			local index = math.random(1,4)
			a = wz[index]
			x1 = wz[index][1]
			y1 = wz[index][2]+(i-1)*361
			click(x1,y1) mSleep(300)
			--绿色升级按钮
			if DmFindPic('shengjijineng.bmp',90,477,527,488,535,i) then
				clickone(x,y)
			end
		elseif DmFindPic('x_cailiao.bmp',90,413,269,422,279,i) then
			click(x,y)
		elseif DmFindPic('x_dialog.bmp',90,563,350,572,359,i) then
			click(x,y)  			
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y)  mSleep(300)		
		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)				
		elseif DmFindPic('x_mojing.bmp',90,611,249,624,257,i) then
			click(x,y) mSleep(300)						
		else
			mSleep(300)
			failed(i)
		end
		i = i + 1
		if i > 2 then
			i  = 1
		end
	end
end
--领奖累计登陆
function award()
	nowifi = 0
	local i =1
	local t1=os.time()
	local t2=os.time()
	local time_table={t1,t2}	
	local aa_time={os.time(),os.time()}
	local isok={0,0}
	local isdj={0,0}
	local count = 0
	logDebug('award')
	while (i<3) do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		elseif os.difftime(os.time(),time_table[i])>180 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('kill'..':'..packagename[i])
			logDebug('award'..i..'超时')
		elseif DmFindPic('paidui.bmp',85,309,466,318,476,i) then
			time_table[i]=os.time()			
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)			
		elseif isok[1]==1 and isok[2]==1 then
			closewin(1)
			closewin(2)
			break
		elseif DmFindPic('peidai.bmp',80,402,505,410,513,i) or DmFindPic('peidai1.bmp',85,401,484,410,493,i) then
			click(x,y) 				
		elseif DmFindPic('lingqu1.bmp',80,540,384,558,569,i)--[[ or DmFindPic('lingqu2.bmp',85,554,401,564,411,i)) and count < 4 --]]then
			click(x,y) mSleep(500)					
		--已经滑动到最下面了
		elseif (DmFindPicFuzzy('san.bmp',80,544,377,558,572,0xffffff,i)) and isdj[i]==1 then
			isok[i]=1
			closewin(i)
		elseif os.difftime(os.time(),aa_time[i]) > 3 and isdj[i]==1 and DmFindPic('dafuli.bmp',90,289,238,299,250,i) then
			myMove_UD(563,548+(i-1)*361,564,478+(i-1)*361,10)
			aa_time[i]=os.time()
		elseif DmFindPic('fuli.bmp',90,370,258,377,267,i) == false and DmFindPic('bag.bmp',85,471,567,479,578,i) and DmFindPic('head.bmp',85,11,243,17,250,i) then	
			click(x,y)mSleep(1500)			
		elseif DmFindPic('fuli.bmp',90,370,258,377,267,i) then
			click(x,y) 					
		elseif DmFindPic('dafuli.bmp',90,289,238,299,250,i) and (DmFindPic('leijidenglu.bmp',90,46,480,58,491,i) or DmFindPic('leijidenglu1.bmp',90,58,485,69,493,i)) then
			click(x,y)		
			isdj[i]=1
		--关闭福利窗口
		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)			
		elseif DmFindPic('x_cailiao.bmp',90,413,269,422,279,i) then
			click(x,y)
		else
			mSleep(300)
			failed(i)
		end
		i = i + 1
		if i > 2 then
			i = 1
		end	
	end	
end

--领取等级
function awardlevel()
	nowifi = 0
	local isok={0,0}
	local i =1
	local t1=os.time()
	local t2=os.time()
	local time_table={t1,t2}	
	local count = 0
	logDebug('awardlevel')
	while (i<3) do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		elseif os.difftime(os.time(),time_table[1])>120 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('awardlevel'..i..'超时')
			logDebug('kill'..':'..packagename[i])			
		elseif (isok[1]==1 and isok[2]==1) then
			closewin(1)
			closewin(2)
			break
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif DmFindPic('fuli.bmp',85,370,258,377,267,i) == false and DmFindPic('bag.bmp',85,471,567,479,578,i) and DmFindPic('head.bmp',85,11,243,17,250,i) then	
			click(x,y)mSleep(1500)			
		elseif DmFindPic('fuli.bmp',90,370,258,377,267,i) then
			click(x,y) 		
		elseif DmFindPic('peidai.bmp',80,402,505,410,513,i) or DmFindPic('peidai1.bmp',85,401,484,410,493,i) then
			click(x,y) 				
		elseif DmFindPic('dafuli.bmp',90,289,238,299,250,i) and (DmFindPic('dengji.bmp',90,45,406,53,415,i) or DmFindPic('dengji1.bmp',85,46,406,56,414,i) )then
			click(x,y)mSleep(500)
		--已领取
		elseif DmFindPicFuzzy('ylq.bmp',85,549,538,561,546,0xffffff,i) then
			isok[i]=1
			closewin(i)
		--领取等级奖励
		elseif DmFindPic('lingqudj.bmp',80,540,399,560,557,i) then
			click(x,y)
		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)			
		elseif DmFindPic('x_cailiao.bmp',90,413,269,422,279,i) then
			click(x,y)
		else
			mSleep(300)
			failed(i)
		end
		i = i + 1
		if i > 2 then
			i = 1
		end	
	end		
end

--在线时长
function awardonline()
	nowifi = 0
	local i =1
	local t1=os.time()
	local t2=os.time()
	local time_table={t1,t2}	
	local count = 0
	local isok={0,0}
	logDebug('awardonline')
	while (i<3) do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		elseif os.difftime(os.time(),time_table[i]) > 120 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('awardonline'..i..'超时')
			logDebug('kill'..':'..packagename[i])				
		elseif isok[1]==1 and isok[2]==1 then
			closewin(1)
			closewin(2)
			break
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif DmFindPic('fuli.bmp',85,370,258,377,267,i) == false and DmFindPic('bag.bmp',85,471,567,479,578,i) and DmFindPic('head.bmp',85,11,243,17,250,i) then	
			click(x,y)mSleep(1500)			
		elseif DmFindPic('fuli.bmp',90,370,258,377,267,i) then
			click(x,y) 		
		elseif DmFindPic('peidai.bmp',80,402,505,410,513,i) or DmFindPic('peidai1.bmp',85,401,484,410,493,i) then
			click(x,y) 				
		elseif DmFindPic('dafuli.bmp',90,289,238,299,250,i) and (DmFindPic('zaixian.bmp',80,57,518,71,529,i) or DmFindPic('zaixian1.bmp',80,58,522,68,531,i))then
			click(x,y)
		--领取变灰
		elseif DmFindPic('lingzxhui.bmp',90,477,479,490,488,i) then
			isok[i]=1
			closewin(i)
		--领取在线奖励
		elseif DmFindPic('lingzx.bmp',90,475,476,487,483,i) then
			click(x,y)mSleep(4000)
--[[		elseif DmFindPic('zaixian.bmp',90,57,518,71,529,i) then
			click(x,y)--]]
		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)			
		elseif DmFindPic('x_cailiao.bmp',90,413,269,422,279,i) then
			click(x,y)
		else
			mSleep(300)
			failed(i)
		end
		i = i + 1
		if i > 2 then
			i = 1
		end	
	end		
end

--连续登录
function awardlx()
	nowifi = 0
	local i =1
	local t1=os.time()
	local t2=os.time()
	local time_table={t1,t2}	
	local count = 0
	local isok={0,0}
	logDebug('awardlx')
	while (i<3) do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		elseif os.difftime(os.time(),time_table[1])>120 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('awardlx'..i..'超时')
			logDebug('kill'..':'..packagename[i])			
		elseif (isok[1]==1 and isok[2]==1) then
			closewin(1)
			closewin(2)
			break
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif DmFindPic('fuli.bmp',85,370,258,377,267,i) == false and DmFindPic('bag.bmp',85,471,567,479,578,i) and DmFindPic('head.bmp',85,11,243,17,250,i) then	
			click(x,y)mSleep(1500)			
		elseif DmFindPic('fuli.bmp',90,370,258,377,267,i) then
			click(x,y) 		
		elseif DmFindPic('peidai.bmp',80,402,505,410,513,i) or DmFindPic('peidai1.bmp',85,401,484,410,493,i) then
			click(x,y) 				
		elseif DmFindPic('dafuli.bmp',90,289,238,299,250,i) and DmFindPic('lianxu.bmp',90,59,445,72,454,i) then
			click(x,y)
		elseif DmFindPic('linglx.bmp',90,486,476,497,485,i) then
			click(x,y)mSleep(4000)
			isok[i]=1
		elseif DmFindPic('linglxhui.bmp',85,483,475,495,486,i) then
			isok[i]=1
		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)			
		elseif DmFindPic('x_cailiao.bmp',90,413,269,422,279,i) then
			click(x,y)
		else
			mSleep(300)
			failed(i)
		end
		i = i + 1
		if i > 2 then
			i = 1
		end	
	end		
end

--连续登录
function awardholiday()
	nowifi = 0
	local i =1
	local t1=os.time()
	local t2=os.time()
	local time_table={t1,t2}	
	local aa_time={os.time(),os.time()}
	local count = 0
	local isok={0,0}
	local dianji={0,0}
	logDebug('awardholiday')
	while (i<3) do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		elseif os.difftime(os.time(),time_table[i])>120 then
--[[			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('awardholiday'..i..'超时')
			logDebug('kill'..':'..packagename[i])	--]]
			closewin(1)
			closewin(2)
			break		
		elseif (isok[1]==1 and isok[2]==1) then
			closewin(1)
			closewin(2)
			break
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif DmFindPic('fuli.bmp',85,370,258,377,267,i) == false and DmFindPic('bag.bmp',85,471,567,479,578,i) and DmFindPic('head.bmp',85,11,243,17,250,i) then	
			click(x,y)mSleep(1500)		
		elseif DmFindPic('holiday1.bmp',85,264,311,275,319,i) then
			click(x,y)mSleep(1500)
		elseif DmFindPic('fuli.bmp',90,370,258,377,267,i) and DmFindPic('holiday.bmp',85,329,260,338,268,i)==false then
			isok[i]=1
		elseif DmFindPic('fuli.bmp',90,370,258,377,267,i) and --[[DmFindPic('holiday.bmp',85,324,259,334,267,i)--]]DmFindPic('holiday.bmp',85,329,260,338,268,i) then
			click(x,y) mSleep(500)
		elseif DmFindPic('dajieri.bmp',85,348,251,360,259,i) and DmFindPic('zhounian.bmp',85,58,327,67,336,i) then
			click(x,y)
			dianji[i]=1
		--领取节日
		elseif DmFindPic('lingqujieri.bmp',80,548,426,566,568,i) then
			click(x,y)
		elseif DmFindPic('seven.bmp',80,142,535,154,553,i) or DmFindPic('di.bmp',80,120,534,138,553,i) then
			isok[i]=1
			closewin(i)
		elseif os.difftime(os.time(),aa_time[i]) > 3 and ((DmFindPic('zhounianliang.bmp',80,57,323,67,331,i) or dianji[i]==1) and DmFindPic('dajieri.bmp',85,348,251,360,259,i))then
			myMove_UD(563,560+(i-1)*361,563,420+(i-1)*361,10)mSleep(500)
			aa_time[i]=os.time()						
		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)			
		elseif DmFindPic('x_cailiao.bmp',90,413,269,422,279,i) then
			click(x,y)
		elseif DmFindPic('dajieri.bmp',85,348,251,360,259,i)==false and DmFindPic('x_fuli.bmp',85,613,249,623,258,i) then
			click(x,y)  mSleep(100)			
		else
			mSleep(300)
			failed(i)
		end
		i = i + 1
		if i > 2 then
			i = 1
		end	
	end		
end

--升级翅膀
function wing()
	local i = 1
	nowifi = 0
	local t1=os.time()
	local t2=os.time()
	local time_table={t1,t2}	
	local b = {0,0}
	logDebug('wing')
	while (i<3) do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		elseif os.difftime(os.time(),time_table[i]) > 180 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('kill'..':'..packagename[i])
			logDebug('wing'..i..'超时')
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		-- 被打死了							
		elseif DmFindPic('hcfh.bmp',90,286,431,295,440,i) then
			click(x,y)				
		elseif DmFindPic('bag.bmp',90,471,567,479,578,i)then
			click(x,y) pack(i) 
		elseif DmFindPic('cb.bmp',90,30,471,41,478,i) then
			click(x,y) 
		elseif DmFindPic('peidaicb.bmp',80,304,404,313,414,i) then
			clickone(x,y)			
		--如果发现为1阶段翅膀则先买火种
		elseif DmFindPic('liangcb.bmp',90,29,470,41,480,i) and DmFindPic('yijie.bmp',90,102,299,111,315,i) and b[i] == 0 then
			buyseed(i)
			b[i] = 1
		--自动提升
		elseif DmFindPic('zdts.bmp',90,444,544,453,553,i) or DmFindPic('zdjj.bmp',90,444,543,455,550,i) then
			click(x,y)
		elseif DmFindPic('daojutisheng.bmp',90,444,499,453,509,i) or DmFindPic('daojutisheng1.bmp',90,442,497,451,508,i) then
			click(x,y) 
		elseif DmFindPic('x_cailiao.bmp',90,413,269,422,279) and DmFindPicTwo('x_cailiao.bmp',90,413,269,422,279) then
			mSleep(500)
			closewin(1)
			closewin(2)
			logDebug('翅膀升级完成')
			break
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y)  mSleep(300)		
		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)					
		else
			mSleep(300)
			failed(i)
		end	
		i = i + 1
		if i > 2 then
			i = 1
		end			
	end
end


--购买神鹰火种
function buyseed(i)
	local count = 1
	local isbuy = 0
	local one = 0
	local three = 0
	nowifi = 0
	local jh = 0
	local tt = os.time()
	while os.difftime(os.time(),tt) <60 do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)		
		-- 被打死了							
		elseif DmFindPic('hcfh.bmp',90,286,431,295,440,i) then
			click(x,y)				
		elseif DmFindPic('bag.bmp',90,471,567,479,578,i) then
			click(x,y) pack(i) 	
		elseif DmFindPic('huobi.bmp',90,44,348,55,358,i) then
			click(x,y)		
		elseif DmFindPic('zsqianwang.bmp',90,548,445,558,454,i) then
			click(x,y)
		elseif DmFindPic('bzlei.bmp',90,460,283,470,293,i) --[[and DmFindPic('shen.bmp',90,474,514,482,523,i)--]] and isbuy == 0 then --442,521
			click(x-10,y+240)
		--买13个火种
		elseif DmFindPic('one.bmp',90,253,377,264,396,i) and one == 0 then
			click(x,y)
			one = 1
		elseif DmFindPic('three.bmp',90,360,380,369,395,i) and three == 0 then
			click(x,y)
			three = 1
		--确认
		elseif DmFindPic('queren.bmp',90,417,479,430,488,i) then
			click(x,y)
		elseif DmFindPic('jiahao.bmp',90,357,451,364,460,i) and jh == 0 then --326,459
			click(x-30,y+8)				
			jh = 1
		elseif DmFindPic('gmhong.bmp',90,461,482,470,491,i) and isbuy == 0 then
			click(x,y)
			isbuy = 1
		
		elseif DmFindPic('x_shangcheng.bmp',90,612,240,626,247,i) and isbuy == 1 then
			closewin(i)
			logDebug('神鹰火种购买完成')
			break
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y)  mSleep(300)				
		else
			mSleep(300)
			failed(i)
		end
	end
end

--升级成就
function uparc()
	local i = 1
	nowifi = 0
	local t1=os.time()
	local t2=os.time()
	local time_table={t1,t2}	
	logDebug('uparc')
	while (i<3) do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		elseif os.difftime(os.time(),time_table[i]) > 120 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('kill'..':'..packagename[i])
			logDebug('uparc'..i..'超时')
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		-- 被打死了							
		elseif DmFindPic('hcfh.bmp',90,286,431,295,440,i) then
			click(x,y)				
		elseif DmFindPic('bag.bmp',90,471,567,479,578,i) then
			click(x,y) pack(i) 
		elseif DmFindPic('huobi.bmp',90,44,348,55,358,i) then
			click(x,y)
		elseif DmFindPic('qwchengjiu.bmp',90,549,543,558,553,i) then
			click(x,y)
			
		--灰色提升
		elseif DmFindPic('heitisheng.bmp',90,520,340,531,351) and DmFindPicTwo('heitisheng.bmp',90,520,340,531,351) then
			mSleep(500)
			closewin(1)
			closewin(2)
			logDebug('成就提升完成')
			break
		--灰色提升
		elseif DmFindPic('heitisheng.bmp',90,520,340,531,351,i) then
		
		elseif DmFindPic('tschengjiu.bmp',90,518,340,526,350,i) then
			click(x,y)
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y)  mSleep(300)				
		else
			mSleep(300)
			failed(i)
		end
		i = i + 1
		if i > 2 then
			i =  1
		end
	end
end

--购买声望勋章
function buypre(i)
	local count = 0 
	local ispre=0
	nowifi = 0
	local tt =os.time()
	while true do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)
		--连接断开
		elseif os.difftime(os.time(),tt) > 120 then
			appKill(packagename[i])
			tt=os.time()
			logDebug('buy'..i..'超时')
			logDebug('kill'..':'..packagename[i])
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif DmFindPic('bag.bmp',90,471,567,479,578,i) then
			click(x,y)  pack(i) mSleep(1500)
		elseif DmFindPic('huobi.bmp',90,44,348,55,358,i) then
			click(x,y)
		elseif DmFindPic('zsqianwang.bmp',90,548,445,558,454,i) then
			click(x,y)
		elseif ispre == 1 then
			closewin(i)
			break
		--点击声望勋章
		elseif DmFindPic('pre.bmp',80,439,393,450,401,i) then
			click(x,y)
		--点击购买
		elseif DmFindPic('gmpre.bmp',85,464,488,472,498,i) and count > 1 then
			click(x,y)
			ispre = 1
		--点击声望的加号
		elseif DmFindPic('prejia.bmp',85,360,464,368,472,i) then
			click(x,y)		
			count= count + 1
		--关闭福利窗口
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y)  mSleep(300)			
		else
			mSleep(100)
			failed(i)
		end
	end
end

--升级声望
function upprestige()
	local i = 1
	nowifi = 0
	local t1=os.time()
	local t2=os.time()
	local time_table={t1,t2}	
	local isok={0,0}
	local move={0,0}
	logDebug('uparc')
	while (i<3) do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		elseif os.difftime(os.time(),time_table[i]) > 120 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('kill'..':'..packagename[i])
			logDebug('uparc'..i..'超时')
		elseif isok[1]==1 and isok[2]==1 then
			closewin(1)
			closewin(2)
			break
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		-- 被打死了							
		elseif DmFindPic('hcfh.bmp',90,286,431,295,440,i) then
			click(x,y)				
		elseif DmFindPic('bag.bmp',90,471,567,479,578,i) then
			click(x,y) pack(i) 
		elseif DmFindPic('huobi.bmp',90,44,348,55,358,i) then
			click(x,y)
		elseif DmFindPic('hao.bmp',80,95,540,104,550,i) then
			mSleep(500)
			myMove_UD(375,570+(i-1)*361,371,521+(i-1)*361,3)mSleep(500)
			move[i]=1
		--提升声望
		elseif DmFindPic('hao.bmp',75,90,372,107,566,i) then--95,440 549,493
			click(x+460,y+60)
			--[[notifyMessage(i)mSleep(1000)--]]
		--提升军衔
		elseif DmFindPic('tsjx.bmp',85,507,562,517,573,i) then
			click(x,y)
		--提升变黑
		elseif DmFindPic('tshei.bmp',85,507,563,517,572,i) then
			isok[i]=1
			closewin(i)
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y)  mSleep(300)		
		elseif move[i] == 1 then
			mSleep(200)
			--[[notifyMessage('a'..i)mSleep(2000)--]]
			if DmFindPic('renwu.bmp',90,331,236,343,246,i) then
				closewin(i)
			end
			move[i]=0
		else
			mSleep(300)
			failed(i)
		end
		i = i + 1
		if i > 2 then
			i =  1
		end
	end	
end

--强化武器
function weapon()
	local i = 1
	nowifi = 0
	local isok={0,0}
	local isfr={0,0}
	local t1=os.time()
	local t2=os.time()
	local time_table={t1,t2}	
	logDebug('weapon')
	while (i<3) do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		elseif os.difftime(os.time(),time_table[i]) > 90 and os.difftime(os.time(),time_table[2]) > 90 then
			closewin(1)
			closewin(2)
			break
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		-- 被打死了							
		elseif DmFindPic('hcfh.bmp',90,286,431,295,440,i) then
			click(x,y)				
		elseif DmFindPic('lianlu.bmp',90,174,257,183,268,i) then
			click(x,y)
		elseif DmFindPic('lianlu.bmp',90,174,257,183,268,i) == false and DmFindPic('bag.bmp',85,471,567,479,578,i) and DmFindPic('head.bmp',85,11,243,17,250,i) then	
			click(x,y)mSleep(500)		
			if DmFindPic('lianlu.bmp',90,174,257,183,268,i) then
				click(x,y)mSleep(1000)
			end
		elseif isok[1]==1 and isok[2]==1 then
			closewin(1)
			closewin(2)
			break
		elseif DmFindPic('qianghua.bmp',90,232,553,244,563,i) and isfr[i]==1 then
			click(x,y)			
		--确认在强化界面放入装备
		elseif DmFindPic('dalianlu.bmp',85,340,248,352,260,i) and (DmFindPic('gedengfazhang.bmp',85,540,333,551,342,i) or DmFindPic('gdfz.bmp',85,535,331,544,342,i)) then
			click(x,y)
			isfr[i]=1
		elseif DmFindPic('dalianlu.bmp',85,340,248,352,260,i) and find_Onequyu(0x8627B1,85,467,358+(i-1)*361,477,368+(i-1)*361) then
			click(x+20,y-20)
			isfr[i]=1			
		elseif DmFindPic('dalianlu.bmp',85,340,248,352,260,i) and (DmFindPic('gedengfazhang.bmp',85,540,333,551,342,i)==false or DmFindPic('gdfz.bmp',85,535,331,544,342,i)==false ) then
			isok[i]=1			
			closewin(i)
		elseif DmFindPic('x_cailiao.bmp',90,413,269,422,279,i) then
			isok[i]=1
			closewin(i)
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y)  mSleep(300)			
		--竞技场
		elseif DmFindPic('x_jjc.bmp',85,591,248,601,258,i) then
			click(x,y)mSleep(300)		
		else
			mSleep(300)
			failed(i)
		end
		i = i + 1
		if i > 2 then
			i =  1
		end
	end		
end
--强化项链
function necklace()
	local i = 1
	nowifi = 0
	local isok={0,0}
	local isfr={0,0}
	local t1=os.time()
	local t2=os.time()
	local count={0,0}
	local time_table={t1,t2}	
	logDebug('necklace')
	while (i<3) do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		elseif os.difftime(os.time(),time_table[i]) > 90 and os.difftime(os.time(),time_table[2]) > 90 then
--[[			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('kill'..':'..packagename[i])
			logDebug('uparc'..i..'超时')--]]
			closewin(1)
			closewin(2)
			break
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		-- 被打死了							
		elseif DmFindPic('hcfh.bmp',90,286,431,295,440,i) then
			click(x,y)				
		elseif DmFindPic('lianlu.bmp',90,174,257,183,268,i) then
			click(x,y)
		elseif DmFindPic('lianlu.bmp',90,174,257,183,268,i) == false and DmFindPic('bag.bmp',85,471,567,479,578,i) and DmFindPic('head.bmp',85,11,243,17,250,i) then	
			click(x,y)mSleep(500)		
			if DmFindPic('lianlu.bmp',90,174,257,183,268,i) then
				click(x,y)
			end			
		elseif isok[1]==1 and isok[2]==1 then
			closewin(1)
			closewin(2)
			break
		elseif DmFindPic('x_cailiao.bmp',90,413,269,422,279,i) then
			isok[i]=1			
		elseif DmFindPic('qianghua.bmp',90,232,553,244,563,i) and isfr[i]==1 then
			click(x,y)		
		elseif find_Onequyu(0xB945CA,85,469,424+(i-1)*361,478,432+(i-1)*361)==false and count[i]>2 then
			isok[i]=1
		--放入项链
		elseif DmFindPic('dalianlu.bmp',85,340,248,352,260,i) and find_Onequyu(0xB945CA,85,469,424+(i-1)*361,478,432+(i-1)*361) then
			click(x+20,y-20)
			isfr[i]=1
		--确认在强化界面放入装备
		elseif DmFindPic('dalianlu.bmp',85,340,248,352,260,i) and DmFindPic('shang.bmp',90,466,289,478,301,i) then
			myMove_UD(570,558+(i-1)*361,574,318+(i-1)*361,50)mSleep(1000)
			count[i]=count[i]+1
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y)  mSleep(300)				
		else
			mSleep(300)
			failed(i)
		end
		i = i + 1
		if i > 2 then
			i =  1
		end
	end		
end
--祈福
function pray()
	local i = 1
	nowifi = 0
	local t1=os.time()
	local t2=os.time()
	local isok={0,0}
	local time_table={t1,t2}	
	logDebug('pray')
	while (i<3) do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		elseif (os.difftime(os.time(),time_table[i]) > 90 and os.difftime(os.time(),time_table[2]) > 90) or (isok[1]==1 and isok[2]==1) then
			closewin(1)
			closewin(2)
			break
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif DmFindPic('bag.bmp',90,471,567,479,578,i) then
			click(x,y) pack(i) 
		elseif DmFindPic('huobi.bmp',90,44,348,55,358,i) then
			click(x,y)
		elseif DmFindPic('qifuqw.bmp',90,549,392,560,404,i) then
			click(x,y)
		--免费首抽
		elseif DmFindPic('free.bmp',90,212,559,224,570,i) then
			click(x,y)
		--确定
		elseif DmFindPic('queding.bmp',90,507,544,516,555,i) then
			click(x,y)
		--抽取一次
		elseif DmFindPic('chou.bmp',90,213,559,222,574,i) then
			isok[i]=1
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y)  mSleep(300)				
		else
			mSleep(300)
			failed(i)
		end
		i = i + 1
		if i > 2 then
			i =  1
		end
	end	
end

--抽取宝宝
function elves()
	local i = 1
	nowifi = 0
	local isok={0,0}
	local t1=os.time()
	local t2=os.time()
	local time_table={t1,t2}	
	logDebug('elves')
	while (i<3) do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		elseif os.difftime(os.time(),time_table[1]) > 90 and os.difftime(os.time(),time_table[2]) > 90 then
			closewin(1)
			closewin(2)
			break
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		-- 被打死了							
		elseif DmFindPic('hcfh.bmp',90,286,431,295,440,i) then
			click(x,y)				
		elseif DmFindPic('jingling.bmp',90,508,248,517,258,i) then
			click(x,y)
		elseif DmFindPic('jingling.bmp',90,508,248,517,258,i) == false and DmFindPic('bag.bmp',85,471,567,479,578,i) and DmFindPic('head.bmp',85,11,243,17,250,i) then	
			click(x,y)mSleep(500)		
			if DmFindPic('jingling.bmp',90,508,248,517,258,i) then
				click(x,y)
			end
		elseif isok[1]==1 and isok[2]==1 then
			closewin(1)
			closewin(2)
			break
		elseif DmFindPic('x_cailiao.bmp',90,413,269,422,279,i) then
			isok[i]=1
		--猎取
		elseif DmFindPic('liequ.bmp',90,388,345,400,354,i) then
			click(x,y)
		--召唤一次
		elseif DmFindPic('zhaohuan.bmp',90,207,559,214,568,i) then
			click(x,y)
		--确定
		elseif DmFindPic('zhaohuanqueding.bmp',90,505,553,515,564,i) then
			click(x,y)
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y)  mSleep(300)				
		else
			mSleep(300)
			failed(i)
		end
		i = i + 1
		if i > 2 then
			i =  1
		end
	end	
end

--是否能进古战场
function allow()
	local i = 1
	nowifi = 0
	local count = 0
	local dd = 0
	local t1=os.time()
	local t2=os.time()
	local time_table={t1,t2}	
	logDebug('allow')
	while (i<3) do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		elseif os.difftime(os.time(),time_table[i]) > 120 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('allow'..i..'超时')
			logDebug('kill'..':'..packagename[i])
			
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		--误点天使圣殿
		elseif DmFindPic('tian.bmp',90,29,369,37,378,i) and DmFindPic('x_tian.bmp',90,616,247,626,258,i) then
			click(x,y)			
		--卡屏
		elseif dd > 10 then
			closewin(1)
			closewin(2)		
			return 0
		elseif DmFindPic('map_gu.bmp',85,571,233,579,241,i) then
			closewin(1)
			closewin(2)		
			return 3
		elseif DmFindPic('huodong.bmp',85,415,307,422,314,i) then
			click(x,y)
			dd = dd + 1
		--活动图标都没出来，暂时不够进入古战场的等级
		elseif count > 5 or (DmFindPic('huodong.bmp',90,415,307,422,314,i) == false and DmFindPic('gongneng.bmp',90,459,260,469,269,i)  and DmFindPic('bag.bmp',90,471,567,479,578,i)) then
			closewin(1)
			closewin(2)
			return 0
		elseif DmFindPic('huodong.bmp',85,415,307,422,314,i) == false and DmFindPic('bag.bmp',85,471,567,479,578,i) and DmFindPic('head.bmp',85,11,243,17,250,i) then	
			click(x,y)
		elseif DmFindPic('dahuodong.bmp',90,286,239,297,250,i) and DmFindPic('guzc.bmp',85,64,444,76,452,i) then
			click(x,y)
			count = count + 1
		--立即进入，两个都可以进
		elseif DmFindPicTwo('jinruzc.bmp',90,589,552,597,561) and DmFindPic('jinruzc.bmp',90,589,552,597,561) and DmFindPic('over.bmp',90,217,548,231,558) == false  and DmFindPicTwo('over.bmp',90,217,548,231,558) == false  then
			closewin(1)
			closewin(2)
			return 1			
		--立即进入，有一个时间完了,不打换号
		elseif DmFindPicTwo('jinruzc.bmp',90,589,552,597,561) and DmFindPic('jinruzc.bmp',90,589,552,597,561) and (DmFindPic('over.bmp',90,217,548,231,558) or DmFindPicTwo('over.bmp',90,217,548,231,558)) then
			closewin(1)
			closewin(2)
			return 2
		--关闭福利窗口
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y)  mSleep(300)
		elseif DmFindPic('x_dialog.bmp',90,563,350,572,359,i) then
			click(x,y)		
		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)
		else
			mSleep(300)
			failed(i)
		end
		i = i + 1
		if i > 2 then
			i =  1
		end		
	end
end

--购买恶魔凭证
function buy(i)
	local count = 0 
	local isempz=0
	nowifi = 0
	local tt =os.time()
	while true do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)
		--连接断开
		elseif os.difftime(os.time(),tt) > 120 then
			appKill(packagename[i])
			tt=os.time()
			logDebug('buy'..i..'超时')
			logDebug('kill'..':'..packagename[i])
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif DmFindPic('bag.bmp',90,471,567,479,578,i) then
			click(x,y)  pack(i) mSleep(1500)
		elseif DmFindPic('huobi.bmp',90,44,348,55,358,i) then
			click(x,y)
		elseif DmFindPic('zsqianwang.bmp',90,548,445,558,454,i) then
			click(x,y)
		elseif DmFindPic('empz.bmp',75,202,301,247,527,i) then
			click(x,y)
		elseif count > 4 then
			closewin(i)
			count = 0
		elseif DmFindPic('bzlei.bmp',90,460,283,470,293,i) then
			myMove_UD(336,372+(i-1)*361,336,304+(i-1)*361,2)mSleep(500)
			count = count + 1
			--[[break--]]
		elseif DmFindPic('gmpz.bmp',90,463,481,472,491,i) then--362,460
			click(x-100,y-20)mSleep(100)
			click(x,y)
			closewin(i)
			logDebug('恶魔凭证购买完成'..i)
			break
		--关闭福利窗口
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y)  mSleep(300)			
		else
			mSleep(100)
			failed(i)
		end
	end
end

--买药
function potion(i)
	local count = 1
	local isempz=0
--[[	local i = 1--]]
	nowifi = 0
	local tt = os.time()
	logDebug('potion')
	while i<3 do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		--连接断开
		elseif os.difftime(os.time(),tt) > 120 then
			appKill(packagename[i])
			tt=os.time()
			logDebug('potion'..i..'超时')
			logDebug('kill'..':'..packagename[i])		
		elseif DmFindPic('paidui.bmp',85,309,466,318,476,i) then
			tt=os.time()				
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	
		elseif DmFindPic('bag.bmp',90,471,567,479,578,i) then
			click(x,y)  pack(i)
		elseif DmFindPic('huobi.bmp',90,44,348,55,358,i) then
			click(x,y)
		elseif DmFindPic('jbqianwang.bmp',90,550,344,558,351,i) then
			click(x,y)
		elseif count > 4 then
			closewin(1)
			closewin(2)
			logDebug('买药完成')
			break
		elseif count < 3 and DmFindPic('hong.bmp',90,207,317,217,326,i) then
			click(x,y)
		elseif count < 5 and DmFindPic('lan.bmp',90,208,373,216,381,i) then
			click(x,y)
		elseif DmFindPic('zuida.bmp',90,397,456,405,466,i) then
			click(x,y)mSleep(100)
			if DmFindPic('gmhong.bmp',90,461,482,470,491,i) then
				click(x,y)
				count = count + 1
			end
		--关闭福利窗口
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y)  mSleep(300)			
		else
			mSleep(100)
			failed(i)
		end			
	end
end
--恶魔广场
color_emgc={0xBF9A1B,--291,526;
1,0,0xE3B61A,2,0,0xD5AA1A,
3,0,0xE2B519,1,2,0x96781C,
2,2,0x604D1B,4,3,0xA3821A,
}

--进入古战场
function battle()
	local i = 1
	nowifi = 0
	local zb = {{243,339},{202,376},{187,395},{228,454},{257,468},{280,491},{304,463},{331,422},{335,367},{272,363},{297,372},{280,389},{304,395}}
	local ismove1= {0,0}
	local isem={0,0}
	local beibao ={os.time(),os.time()}
	local guwutt = {os.time(),os.time()}
	local ft = {os.time(),os.time()}
	local isboss={0,0}
	local count={0,0}
	local isok={0,0}
	local bosstime={os.time(),os.time()}
	logDebug('battle')
	while (i<3) do
		math.randomseed(tostring(os.time()):reverse():sub(1,6))		
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	
			ismove1[i]=0	
		--装备坏了
		elseif DmFindPic('bag.bmp',90,471,567,479,578,i) and DmFindPic('huaile.bmp',85,523,367,529,374,i)then
			click(x,y)
		elseif DmFindPic('lijixiuli.bmp',85,248,444,259,452,i) then
			click(x,y)					
		--时间为0
		elseif DmFindPic('over.bmp',90,217,548,231,558) and DmFindPicTwo('over.bmp',90,217,548,231,558) then
			closewin(1)
			closewin(2)
			logDebug('古战场时间为零')
			break
		elseif DmFindPic('over.bmp',90,217,548,231,558,i) then

		elseif --[[DmFindPic('fbxx.bmp',90,586,232,594,241,i)==false and --]]os.difftime(os.time(),ft[i]) > 360 then
			appKill(packagename[i])
			ft[i]=os.time()
			logDebug('battle'..i..'超时')
			logDebug('kill'..':'..packagename[i])	
		elseif DmFindPic('paidui.bmp',85,309,466,318,476,i) then
			ft[i]=os.time()				
		--整理背包
--[[		elseif DmFindPic('beibaoman.bmp',80,516,747,525,755,i) then
			bag(i)
			beibao[i]=os.time()		--]]	
		elseif os.difftime(os.time(),beibao[i]) > 200 and DmFindPic('bag.bmp',90,471,567,479,578,i) then
			bag(i)
			beibao[i]=os.time()
		--地图不见了
		elseif DmFindPic('daosanjiao.bmp',90,627,235,637,243,i) then
			click(x,y)
		--误点天使圣殿
		elseif DmFindPic('tian.bmp',90,29,369,37,378,i) and DmFindPic('x_tian.bmp',90,616,247,626,258,i) then
			click(x,y)			
		--防止多次点击
		elseif DmFindPic('hongempz.bmp',90,84,347,91,354,i)==false and DmFindPic('jrhd.bmp',90,515,555,525,566,i) then
			click(x+10,y+10)mSleep(1500)
			ismove1[i]=0		
			logDebug(i..'进入恶魔广场')	
			local tt = os.time()
			while os.difftime(os.time(),tt) < 4 do
				closewin(i)
			end				
		-- 被打死了							
		elseif DmFindPic('hcfh.bmp',90,286,431,295,440,i) then
			click(x,y)	
			ft[i]=os.time()
		--领取补偿
		elseif DmFindPic('huoqu.bmp',85,483,486,491,494,i) then
			click(x,y)	
		elseif DmFindPic('buchang.bmp',85,518,389,527,398,i) then
			click(x,y) 
		--已经有鼓舞了 取消
		elseif DmFindPic('guwuquxiao.bmp',85,356,446,368,454,i) then
			click(x,y)
			ft[i]=os.time()
		--使用鼓舞
		elseif os.difftime(os.time(),guwutt[i]) > 120 and DmFindPic('fbxx.bmp',90,586,232,594,241,i) and DmFindPic('guwu.bmp',90,536,432,543,440,i) then
			click(x,y)
			guwutt[i] = os.time()
			ft[i]=os.time()
		--弹出鼓舞确定
		elseif DmFindPic('guwulv.bmp',85,309,459,318,468,i) then
			click(x,y) 			
			ft[i]=os.time()
		--boss打完了
		elseif DmFindPic('lqjl.bmp',90,295,541,304,549,i) then
			click(x,y)	 ismove1[i]=0				
		--找到金属巴洛克之后取消挂机
		elseif isboss[i] == 0 and DmFindPic('bag.bmp',90,471,567,479,578,i) and DmFindPic('baluoke.bmp',90,188,252,206,258,i) and DmFindPic('quxiaoguaji.bmp',90,533,484,542,495,i) then
			click(x,y)
			isboss[i] = 1
			bosstime[i] = os.time()
			logDebug('boss出现')
		elseif isboss[i] == 1 and  DmFindPic('fbxx.bmp',90,586,232,594,241,i) and DmFindPic('bag.bmp',90,471,567,479,578,i) then
			if DmFindPic('diyuhuo.bmp',85,599,422,607,432,i) then
				click(x,y)mSleep(500)
				--[[ft[i]=os.time()--]]
			end
			if DmFindPic('jiguang.bmp',85,600,475,611,487,i) then
				click(x,y)mSleep(500)
				--[[ft[i]=os.time()--]]
			end
			if DmFindPic('heilongbo.bmp',85,535,536,546,548,i) then
				click(x,y)mSleep(500)
				--[[ft[i]=os.time()--]]
			end
			mSleep(1500)
			if os.difftime(os.time(),bosstime[i]) > 120 then
				movebyround(90,520+(i-1)*361,1.5,20,0,2)mSleep(500)	
				touchDown(0,32,502+(i-1) *361)
				mSleep(1000)
				touchUp(0)
				bosstime[i] = bosstime[i] - 10
				ft[i]=os.time()
			end
			--[[ft[i]=os.time()--]]
--[[			if DmFindPic('ksgj.bmp',90,534,485,542,495,i) then
				click(x,y)mSleep(1500)
			end--]]
		--古战场中出现恶魔广场提示字样,点击离开古战场		
--[[		elseif (DmFindPicFuzzy('emgc1.bmp',90,291,526,308,540,0xffffff,i) or DmFindPicFuzzy('emgc.bmp',90,263,523,291,540,0xffffff,i)) and DmFindPic('likai.bmp',85,513,244,520,253,i) then
			click(x,y)logDebug('离开古战场去恶魔')
			mSleep(1500)		--]]
		--开启挂机
		elseif ismove1[i] == 1 and DmFindPic('xunlu.bmp',90,295,312,302,321,i) == false and DmFindPic('map_gu.bmp',90,571,233,579,241,i) and  DmFindPic('ksgj.bmp',90,534,485,542,495,i) then
			click(x,y)					
		elseif DmFindPic('map_gu.bmp',90,571,233,579,241,i)==false and (DmFindPicFuzzy('emgc1.bmp',90,291,526,308,540,0xffffff,i) or DmFindPicFuzzy('emgc.bmp',90,263,523,291,540,0xffffff,i)) then
			click(x,y)mSleep(1000)
			local tt =os.time()
			while os.difftime(os.time(),tt)<4 do
				if DmFindPic('hongempz.bmp',90,84,347,91,354,i)==false and DmFindPic('jrhd.bmp',90,515,555,525,566,i) then
					click(x+10,y+10)
					guwutt[i] = os.time()
					ismove1[i]=0		
					logDebug(i..'进入恶魔广场')	
					local tt = os.time()
					while os.difftime(os.time(),tt) < 4 do
						closewin(i)
					end
				end					
			end
			ft[i]=os.time()
		--找不到古战场找得到活动则打开活动		
		elseif DmFindPic('guzc.bmp',85,64,444,76,452,i)==false and DmFindPic('huodong.bmp',90,415,307,422,314,i) then--419,300
			click(x+10,y-8) 
		--判断是否有恶魔凭证
		elseif DmFindPic('richang.bmp',90,280,239,289,248,i) and DmFindPic('hongempz.bmp',90,84,347,91,354,i) then
			closewin(i)
			buy(i)
		--副本信息进入恶魔开始挂机	
		elseif isboss[i] == 0 and DmFindPic('fbxx.bmp',90,586,232,594,241,i) and DmFindPic('ksgj.bmp',90,534,485,542,495,i) then
			click(x,y) 
		--恶魔广场完结					
		elseif (DmFindPicFuzzy('exp.bmp',90,474,481,508,516,0xffffff,i) or DmFindPicFuzzy('exp1.bmp',90,474,442,510,518,0xffffff,i) )and DmFindPic('bag.bmp',90,471,567,479,578,i) then
			ft[i]=os.time()
		--没药水了
		elseif (DmFindPic('yaoshui.bmp',80,520,384,529,393,i) or DmFindPic('yaoshui1.bmp',80,521,383,528,392,i)) and DmFindPic('bag.bmp',90,471,567,479,578,i)then
			potion(i)
		elseif DmFindPic('xunlu.bmp',90,295,312,302,321,i) then			
			ismove1[i]= 1
			isboss[i] = 0
		elseif isok[1]==1 and isok[2]==1 and isem[1]==0 then
			other()
			isem[1]=1
			ft[i]=os.time()
		--挂机
		elseif DmFindPic('zhandou.bmp',90,295,313,302,322,i) then
			isok[i]=1
		--都在古战场了 
		elseif ismove1[i] == 0 and DmFindPic('map_gu.bmp',90,571,233,579,241,i) then--587,299
			click(x,y+60) 
			isboss[i] = 0
		--古战场里面走路
		elseif DmFindPic('daditu.bmp',90,288,238,298,249,i) and DmFindPic('quyu.bmp',90,69,327,78,335,i) then	
			click(x,y) 
		--确认打开小地图了
		elseif DmFindPic('daditu.bmp',90,288,238,298,249,i) and DmFindPic('quyuliang.bmp',90,69,322,78,331,i) then
			local xx = zb[math.random(1,13)]
			click(xx[1],xx[2]+(i-1)*361)
			ismove1[i] = 1
			mSleep(1500)
			closewin(i)
		elseif DmFindPic('guzc.bmp',85,64,444,76,452,i)==false and 
				DmFindPic('huodong.bmp',85,415,307,422,314,i) == false and 
				DmFindPic('bag.bmp',85,471,567,479,578,i) and 
				DmFindPic('head.bmp',85,11,243,17,250,i) then	
			click(x,y)mSleep(1000)
		elseif DmFindPic('dahuodong.bmp',90,286,239,297,250,i) and DmFindPic('guzc.bmp',85,64,444,76,452,i) then
			click(x,y)
		--立即进入
		elseif DmFindPic('chang.bmp',90,67,440,77,451,i) and DmFindPic('dahuodong.bmp',90,286,239,297,250,i) and DmFindPic('jinruzc.bmp',90,589,552,597,561,i)  then
			click(x,y) mSleep(500)
			ismove1[i] = 0
			local tt = os.time()
			while os.difftime(os.time(),tt) <4 do
				closewin(i)
			end
			ft[i]=os.time()
		--点到天使神殿的声望
		elseif DmFindPic('x_shengwang.bmp',85,452,303,461,313,i) then
			click(x,y+5)
		--关闭福利窗口
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y)  mSleep(300)
		--我的军衔
		elseif DmFindPic('x_junxian.bmp',85,617,244,628,251,i) then
			click(x,y)mSleep(300)			
		--背包
		elseif DmFindPic('renwu.bmp',90,331,236,343,246,i) then
			closewin(i)
		else
			mSleep(300)
			failed(i)
		end
		i = i + 1
		if i > 2 then
			i =  1
		end		
	end
end

function movebyround(zx,zy,ldian,banj,dzbj,quanshu)
	local x0,y0,rr,l,n,r,x,y,shouc,yans
	shouc=1
	--设置圆心坐标
	x0,y0=zx,zy
	--r=半径
	r=banj
	--rr=递增半径
	rr=dzbj
	--l=两点间的距离
	l=ldian
	--初始化角度
	n=0
	--设置第一圈半径
	--r=30
	--设置画圆圈数
	--延时
	yans=5
	touchDown(0, x0,y0)
	
	for i=1,quanshu do
		while n<3.1415926*2 do
			x=x0+r*math.cos(n)
			y=y0+r*math.sin(n)
			if shouc==1 then 
				touchDown(0, x0,y0)	
				shouc=2	
			end 
			touchMove(0, x, y)
			mSleep(yans);
			n=n+l/r
		end 
	n=0
	r=r+rr
	end
	touchUp(0) 			
end 


--退出游戏
function exit()
	local i = 1
	nowifi = 0
	local dlx = 0
	local tt = {os.time(),os.time()}
	while (i<3) do
		logDebug('exit'..i)
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	
		elseif os.difftime(os.time(),tt[i]) > 180 	then
			appKill(packagename[i])
			tt[i]=os.time()
			logDebug('potion'..i..'超时')
			logDebug('kill'..':'..packagename[i])	
		elseif DmFindPic('fhdl.bmp',90,298,358,310,365,i) then
			click(x,y)
		elseif DmFindPic('qhzh.bmp',90,125,503,134,515) and DmFindPicTwo('qhzh.bmp',90,125,503,134,515) then
			modifyTxt(1)
			modifyTxt(2)
			logDebug('退出游戏完成')
			break
		--已经交易了
		elseif DmFindPic('quxiao.bmp',85,358,464,369,473,i)  then
			click(x,y)
			closewin(i)
		elseif DmFindPic('x_dialog.bmp',90,563,350,572,359,i) then
			click(x,y)  			
		elseif DmFindPic('start.bmp',90,454,480,462,488,i) then
			click(x,y)  			
		elseif DmFindPic('qhzh.bmp',90,125,503,134,515,i) then
									
		elseif DmFindPic('xtsz.bmp',90,484,314,494,325,i) then
			click(x,y)
		elseif DmFindPic('tuichu.bmp',90,213,315,222,326,i) then
			click(x,y)
		elseif DmFindPic('gongneng.bmp',90,459,260,469,269,i) then
			click(x,y)
		elseif DmFindPic('huodong.bmp',90,415,307,422,314,i) == false and DmFindPic('bag.bmp',90,471,567,479,578,i) and DmFindPic('head.bmp',90,11,243,17,250,i) then	
			click(x,y)
			mSleep(500)	
		elseif DmFindPic('return.bmp',80,555,558,570,567,i) or DmFindPic("完成2.bmp", 80,865,172,964,329) == true or DmFindPic('huanhang.bmp',90,563,556,575,569,i) then
			click(x+3,y+3)			
		--关闭福利窗口
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y) 			
		else
			mSleep(300)
			failed(i)	
		end
		i = i + 1
		if i > 2 then
			i =  1
		end		
	end	
end



--交易物品
function dealbyfriend()
	while true do
		if DmFindPic('haoyou.bmp',90,250,260,258,269,i) then
			click(x,y)
		elseif DmFindPic('haoyou.bmp',90,250,260,258,269,i) and DmFindPic('bag.bmp',90,475,569,483,578,i) and DmFindPic('head.bmp',90,11,243,17,250,i) then	
			click(x,y)mSleep(500)
		--找到头像点头像
		end
	end
end

--前往冰风谷
function bingfenggu()
	logDebug('bingfenggu')
	local i = 1
	nowifi = 0
	local isbfg={0,0}
	local time_table={os.time(),os.time()}
	while i<3 do
		mSleep(500)
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		elseif os.difftime(os.time(),time_table[i]) > 120 then
			appKill(packagename[i])				
			time_table[i]=os.time()
			logDebug('kill'..':'..packagename[i])				
			logDebug('bingfenggu'..i..'超时')
		elseif DmFindPic('paidui.bmp',85,309,466,318,476,i) then
			time_table[i]=os.time()					
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	
		elseif DmFindPic('xunlu.bmp',90,295,312,302,321,i) then		
		
		elseif DmFindPic('x_laiya.bmp',90,565,350,575,356) and DmFindPicTwo('x_laiya.bmp',90,565,350,575,356) then
			closewin(1)
			closewin(2)
			logDebug('前往冰风谷完成')
			break
		--到莱亚了
		elseif DmFindPic('x_laiya.bmp',90,565,350,575,356,i) then	
		--地图不见了
		elseif DmFindPic('daosanjiao.bmp',90,627,235,637,243,i) then
			click(x+5,y+5)
		--走到莱亚
		elseif DmFindPic('daditu.bmp',90,288,238,298,249,i) and (DmFindPic('laoban.bmp',90,481,459,494,471,i) or DmFindPic('laoban1.bmp',85,482,459,493,469,i)) then
			click(x,y+10)mSleep(500)
			isbfg[i] = 1
--[[			closewin(i)--]]
		elseif DmFindPic('bing.bmp',90,569,233,579,238,i) == false and DmFindPic('sanjiao.bmp',90,628,236,634,244,i) then--588,298
			click(x-40,y+30)
		elseif DmFindPic('daditu.bmp',90,288,238,298,249,i) and DmFindPic('sjdt.bmp',90,71,282,81,291,i) and isbfg[i] == 0 then
			click(x,y)
		--传送到冰风谷
		elseif DmFindPic('bfg.bmp',90,206,370,214,379,i) then
			click(x,y)
		--冰风谷走路
		elseif DmFindPic('bing.bmp',90,569,233,579,238,i) and DmFindPic('sanjiao.bmp',90,628,236,634,244,i) then--588,298
			click(x-40,y+30)
		--关闭福利窗口
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y) 				
		--背包
		elseif DmFindPic('renwu.bmp',90,331,236,343,246,i) then
			closewin(i)
		else
			mSleep(300)
			failed(i)	
		end
		i = i + 1
		if i > 2 then
			i =  1
		end				
	end
end



--交易物品
function dealbysay()
	local isdeal={0,0}
	nowifi = 0
	local say={0,0}
	local tt = {os.time(),os.time()}
	local i = 1
	logDebug('dealbysay'..i)
	while i<3 do
		if nowifi > 9 then
			logDebug('无wifi自动重启')	
			nowifi = 0	
			os.execute('reboot') 
		elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
			notifyMessage('屏幕左上角wifi不见了')
			logDebug('屏幕左上角wifi不见了')
			nowifi = nowifi + 1
			mSleep(2000)		
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,295,456,303,466,i) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)		
		elseif os.difftime(os.time(),tt[1]) > 300 and os.difftime(os.time(),tt[2]) > 300 then
			closewin(1)
			closewin(2)
			logDebug('交易未响应')
			break
		elseif os.difftime(os.time(),tt[i]) > 240 then
			closewin(i)
		elseif DmFindPic('liaotian.bmp',90,423,555,433,564,i) then
			click(x,y)
		elseif  DmFindPic('deal.bmp',90,243,543,253,553) == false and DmFindPicTwo('deal.bmp',90,243,543,253,553) == false and isdeal[1]>=2  and isdeal[2]>=2 then
			mSleep(3000)
			closewin(1)
			closewin(2)
			logDebug('交易完成')
			break
		--密语	
		elseif DmFindPic('fasong.bmp',90,543,553,555,562,i) and say[i] == 0 then
			click(x-200,y+5)mSleep(1000)
			local name = getName()
			inputText("/"..name.." 在")
			say[i] = 1
		--换行
		elseif DmFindPic('huanhang.bmp',90,563,556,575,569,i) or DmFindPic('return.bmp',80,555,558,570,567,i) then
			click(x,y)
		--发送密语
		elseif DmFindPic('fasong.bmp',90,543,553,555,562,i) and say[i]  == 1 and isdeal[i] == 0 then
			click(x,y)
			say[i]=0
		--已经交易了
		elseif DmFindPic('quxiao.bmp',85,358,464,369,473,i) and isdeal[i] > 0 then
			click(x,y)
			closewin(i)
		--弹出交易提示
		elseif DmFindPic('jiaoyitishi.bmp',90,260,464,270,475,i) then
			click(x,y)
		--交易界面弹出来
		elseif DmFindPic('jiaoyi.bmp',90,337,247,350,258,i) then
			--开始放东西
			if DmFindPic('jiaoyi.bmp',90,337,247,350,258,i) and isdeal[i] ==0 then
				--放入晶石
				give(i)
				give(i)
				--放入金币
				if money(i) then
					isdeal[i]=1
				end
			--锁定
			elseif DmFindPic('suoding.bmp',90,83,543,95,554,i) and isdeal[i] >= 1 then
				click(x,y)
			--交易
			elseif DmFindPic('deal.bmp',90,243,543,253,553,i) and isdeal[i]>=1 then
				click(x,y)
				isdeal[i] = isdeal[i] + 1
				say[i]=1
			else
				mSleep(300)
				failed(i)	
			end
		--关闭福利窗口
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y) 	 
		elseif DmFindPic('daditu.bmp',90,288,238,298,249,i) and DmFindPic('x_mojing.bmp',90,611,249,624,257,i) then
			click(x,y) 
		else
			mSleep(300)
			failed(i)				
		end
		i = i + 1
		if i > 2 then
			i =  1
		end
	end
end

--获取收钱号角色名
function getName()
	local file,l,a1,a2,sname
	file = io.open("/var/touchelf/scripts/收钱名.txt","r")
	for l in file:lines() do  
		local list = Split(l,",")
		a1=list[1]
		a2=list[2]		
		if area==a1 then 
		sname=a2	
		break
		end
	end 	
	file:close()
	return sname
end
-----------------------------------------------------------给金币
function money(i)
	local fier,yans=1,1
	while (true) do
		--连接断开立即重连与立即刷新
		if DmFindPic('dxl.bmp',90,295,456,303,466,i) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)		
		elseif yans>=30 then 
			notifyMessage('钱给完了')
			logDebug('钱给完了'..i)
			return false
		elseif DmFindPic('deal.bmp',90,243,543,253,553,i) and fier==2 then 
			logDebug('钱给完了'..i)
			return true
		elseif DmFindPic('return.bmp',80,555,558,570,567,i) or DmFindPic("完成2.bmp", 80,865,172,964,329) == true or DmFindPic('huanhang.bmp',90,563,556,575,569,i) then
			click(x+3,y+3)
			fier=2
		elseif DmFindPic('deal.bmp',90,243,543,253,553,i) then --297,431
			click(x+50,y-110)mSleep(1000)
			inputText("11111111")
			mSleep(300);
		elseif DmFindPic("x_jingshi.bmp",80,441,303,450,309,i) or DmFindPic("x_jingshi1.bmp", 80,442,273,450,282,i) then
			click(x+3,y+3)	
		--关闭福利窗口
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y) 				
		else
			mSleep(100)
			failed(i)				
		end 
		mSleep(100)
		yans=yans+1
	end
end 

--不绑定晶石
color_jingshi={0x702A8F,--471,369;
0,1,0x7D2E9F,1,2,0x812EA3,
}
function give(i)
	local wz,nz=0,1
	while wz<20 do
		--连接断开立即重连与立即刷新
		if DmFindPic('dxl.bmp',90,295,456,303,466,i)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	
		end
		if wz<5 then 
		   a=wz
		   b=0
		elseif wz>=5 and wz<10 then 
		   a=wz-5
		   b=1
		elseif wz>=10 and wz<15 then 
		   a=wz-10
		   b=2
		elseif wz>=15 then 
		   a=wz-15
		   b=3
		end 
		--367,314,375,320
		--419,314,427,320
		--367,366,375,372
		--x方向公差52
		--y方向公差52
		if find_Onequyu(0x6A2988,85,373+a*52,321+b*52+(i-1)*361,375+a*52,325+b*52+(i-1)*361,i)then 
			click(x+20,y-20)mSleep(200)
			wz=wz+1
			nz=2
		else
			wz=wz+1
			nz=1
		end
		if nz==2 then 
			if DmFindPic("fangru.bmp", 80,463,398,472,406,i) or DmFindPic("fangru1.bmp", 80,462,406,470,416,i) or DmFindPic('fangru2.bmp',80,463,384,471,393,i) or DmFindPic('fangru3.bmp',80,463,379,473,388,i) then
				click(x,y)
			elseif DmFindPic("x_jingshi.bmp",80,441,303,450,309,i) or DmFindPic("x_jingshi1.bmp", 80,442,273,450,282,i) or DmFindPic('x_laji.bmp',85,448,248,458,256,i) then
				click(x+5,y+5)
			end
		end 
		--关闭福利窗口
		if DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y) 	
		end		
		mSleep(200)
	end 	
end 

function router()
	local index = id
	index = string.match(index,"%s*(.-)%s*$")	
	url = 'id%3d'..index..'%26type%3ddown%26shell_data%3dinternet%253DMAC_VLAN%2binterface%253Dwan1%26r%3d0.43528579045092863'	
	local tt = os.time()
	local ipAddress = 0
	while true do
		ipAddress = httpGet('http://ip.3322.net/')
		local ret = string.match(ipAddress,'%d+')
		if ret ~= nil then
			notifyMessage('ip:'..ipAddress)
			break
		elseif ret == nil then
			notifyMessage('联网失败,请等待')
			mSleep(5000)
		elseif os.difftime(os.time(),tt) > 90 then
			os.execute('reboot')
		end	
	end
	
	routerControl(getDeviceID(),url)
	mSleep(10000)
	local count = 0
	while true do
		local curIp = httpGet('http://ip.3322.net/')
		notifyMessage(curIp)
		--[[local curRet = string.match(curIp,'%d+')--]]
		if curRet ~= '' and curIp ~= ipAddress then
			notifyMessage('断网成功')
			break
		elseif count > 5 then
			for i = 1,10 do
				notifyMessage('断网5次还没断成功,请人工干预一下,断网5次还没断成功,请人工干预一下,断网5次还没断成功,请人工干预一下,断网5次还没断成功,请人工干预一下,断网5次还没断成功,请人工干预一下,断网5次还没断成功,请人工干预一下,断网5次还没断成功,请人工干预一下,断网5次还没断成功,请人工干预一下!断网5次还没断成功,请人工干预一下!断网5次还没断成功,请人工干预一下!断网5次还没断成功,请人工干预一下!断网5次还没断成功,请人工干预一下!断网5次还没断成功,请人工干预一下!断网5次还没断成功,请人工干预一下!断网5次还没断成功,请人工干预一下!断网5次还没断成功,请人工干预一下!')
				mSleep(2000)
			end
		else
			notifyMessage('断网失败,继续请求')
			routerControl(getDeviceID(),url)
			count = count + 1
		end
	end
end


function routerControl(deviceId,url)
	local data = httpGet('http://192.168.1.200:8080/makemoney/android/ad/router?action=control&sn='..getDeviceID()..'&url='..url)
	--[[local data = httpGet('http://192.168.240.122:8080/makemoney/android/ad/router?action=control&sn='..getDeviceID()..'&url='..url)--]]
	local i,j = string.find(data,'ok')
	if i~=nil and j~=nil then
		notifyMessage('断网请求成功')
		mSleep(5000)
	else
		notifyMessage('断网请求失败')
		mSleep(5000)
	end	
end

--断线重连
function con(i)
	if nowifi > 9 then
		logDebug('无wifi自动重启')	
		nowifi = 0	
		os.execute('reboot') 
	elseif DmFindPic('wifi.bmp',90,8,6,166,45) == false and DmFindPic('deng.bmp',90,483,980,644,1005) then
		notifyMessage('屏幕左上角wifi不见了')
		logDebug('屏幕左上角wifi不见了')
		nowifi = nowifi + 1
		mSleep(2000)
		--[[os.execute('reboot')--]]
	elseif DmFindPic('simcard.bmp',80,320,612,347,645) then
		click(x,y)			
	elseif DmFindPic('cuowu.bmp',90,310,350,320,358,i) and  DmFindPic('qhzh.bmp',90,125,503,134,515,i) and DmFindPic('ljsb.bmp',90,358,465,369,473,i)  then
		logDebug('ljsb_con')	
		--[[local file,l,f,jiy,peny,ourline
		file = io.open("/var/touchelf/scripts/avf"..i..".txt","r")
		ourline = tonumber(file:read())		
		delete(ourline,i)		--]]	
		os.execute('reboot')	
	--用户在线
	elseif DmFindPic('yhzx.bmp',90,360,463,368,472,i) then	
		click(x,y)		logDebug('yhzx')
	elseif DmFindPic('rename_sure.bmp',90,360,466,369,472,i) then		
		click(x,y)  logDebug('baochishuju')
	elseif DmFindPic('jin.bmp',90,473,509,483,519,i) then
		click(x,y)	 logDebug('jin')
	elseif DmFindPic('jinru.bmp',90,284,540,294,550,i) then
		click(x,y) logDebug('jinru')
	elseif DmFindPic('ljsb.bmp',90,358,465,369,473,i) then
		click(x,y) logDebug('ljsb')
	--选择服务器
	elseif DmFindPic('x_xzfwq.bmp',90,615,247,624,255,i) then
		click(x,y) logDebug('x_xzfwq')
	--登录异常	
	elseif DmFindPic('dlyc.bmp',90,305,498,313,506,i) then
		click(x,y) logDebug('dlyc')
	elseif DmFindPic('jiu.bmp',85,309,328,323,341,i) and DmFindPic('jiuqueding.bmp',85,304,497,314,504,i) then
		click(x,y)		
	--公告
	elseif DmFindPic('x_gonggao.bmp',85,577,254,585,262,i) then	
		click(x,y)		
	--登录按钮
	elseif DmFindPic('denglu.bmp',90,473,387,484,398,i) then 		
		click(x,y) logDebug('denglu')
	--领取恶魔广场奖励
	elseif DmFindPic('lqjl.bmp',90,295,541,304,549,i) then
		click(x,y)	logDebug('lqjl')	 
	else
		mSleep(200)
		restoreAvf()
	end
end

function isMoving(i)
	local a,b,c,fig
	fig=1
		a = getColor(192,281+(i-1)*361)
		b = getColor(80,487+(i-1)*361)
		c = getColor(511,432+(i-1)*361)
		mSleep(500);
		fig=fig+1
	--[[	if DmFindPic('heilongbo.bmp',90,535,538,543,546,i) then
			click(x,y)
		end--]]
		if DmFindPic('bag.bmp',90,471,567,479,578,i) == false then
			return false
		elseif a==getColor(192,281+(i-1)*361) and b==getColor(80,487+(i-1)*361) then 
			return true
		elseif b==getColor(80,487+(i-1)*361) and c ==getColor(511,432+(i-1)*361) then 
			return true
		elseif a==getColor(192,281+(i-1)*361) and c == getColor(511,432+(i-1)*361) then 
			return true
		else
			mSleep(100)
		end				
end


--关闭窗口
function closewin(i)
	for j = 1,3 do
		--连接断开立即重连与立即刷新
		if DmFindPic('dxl.bmp',90,295,456,303,466,i) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	mSleep(500)
		elseif DmFindPic('x_dialog.bmp',90,563,350,572,359,i) then
			click(x,y) mSleep(500)
		--关闭福利窗口
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y) mSleep(500)
		--关闭翅膀窗口
		elseif DmFindPic('x_cb.bmp',90,615,246,624,256,i) then		
			click(x,y) mSleep(500)
		--转生
		elseif DmFindPic('x_zs.bmp',90,614,249,623,256,i) then		
			click(x,y)  mSleep(500)
		--钻石不够
		elseif DmFindPic('x_cailiao.bmp',90,413,269,422,279,i) then
			click(x,y) mSleep(500)
		--兑换魔晶 /地图
		elseif DmFindPic('x_mojing.bmp',90,611,249,624,257,i) then
			click(x,y) mSleep(500)
		--复活石
		elseif DmFindPic('x_fuhuoshi.bmp',90,440,284,449,294,i) then
			click(x,y) mSleep(500)
		elseif DmFindPic('x_fuhuoshi1.bmp',90,440,307,449,375,i) then
			click(x,y) mSleep(500)
		elseif DmFindPic('x_fuhuoshi2.bmp',90,441,274,451,282,i) then
			click(x,y) mSleep(500)
		--古战场xx
		elseif DmFindPic('x_gzc.bmp',90,615,249,623,257,i) then
			click(x,y)  mSleep(500)
		--恶魔凭证
		elseif DmFindPic('x_empz.bmp',90,440,280,449,288,i) then
			click(x,y) mSleep(500)
		--商城
		elseif DmFindPic('x_shangcheng.bmp',90,612,240,626,247,i) then
			click(x,y)  mSleep(500)
		--召唤精灵界面
		elseif DmFindPic('x_jingling.bmp',85,619,245,627,253,i) then
			click(x,y) mSleep(500)
		--我的军衔
		elseif DmFindPic('x_junxian.bmp',85,617,244,628,251,i) then
			click(x,y)mSleep(300)
		--竞技场
		elseif DmFindPic('x_jjc.bmp',85,591,248,601,258,i) then
			click(x,y)mSleep(300)
		--boss打完了
		elseif DmFindPic('lqjl.bmp',90,295,541,304,549,i) then
			click(x,y)	mSleep(500)			
		else
			mSleep(300)
		end	
	end	
end

------------------------------------------------------------------------- 区域模糊找色
function find_Onequyu(mColor, sim, x1, y1, x2, y2)
	x, y = findColorInRegionFuzzy(mColor, sim, x1-5, y1-5, x2-5, y2-5); -- 在区域[(100,100)(200,200)]范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
        if x  ~= -1 and y ~= -1 then		 
		         return true;
		else
		         return false;
	    end
end 

function MulcolorNoOffset(t,sim,x1,y1,x2,y2,i)
	if i == 1 or i == nil then	
		keepScreen(true)
		x,y = findMultiColorInRegionFuzzy(t,sim,x1,y1,x2,y2)
		if x~= -1 and y ~=-1 then
			keepScreen(false)
			return true
		else
			keepScreen(false)
			return false
		end	
	elseif i == 2 then		
		keepScreen(true)
		x,y = findMultiColorInRegionFuzzy(t,sim,x1,y1+361,x2,y2+361)
		if x~= -1 and y ~=-1 then
			keepScreen(false)
			return true
		else
			keepScreen(false)
			return false
		end	
	end
end

-----------------------------------------------------工具函数
	function Mulcolor(t,sim,x1,y1,x2,y2,i)
		if i == 0 or i == nil then
			keepScreen(true)
			x,y = findMultiColorInRegionFuzzy(t,sim,x1-5,y1-5,x2-5,y2-5)
			if x~= -1 and y ~=-1 then
				keepScreen(false)
				return true
			else
				keepScreen(false)
				return false
			end
		elseif i == 2 then
			keepScreen(true)
			x,y = findMultiColorInRegionFuzzy(t,sim,x1-5,y1+361-5,x2-5,y2+361-5)
			if x~= -1 and y ~=-1 then
				keepScreen(false)
				return true
			else
				keepScreen(false)
				return false
			end
		end			
	end

	function DmFindPic(pic,per,x1,y1,x2,y2,i)
		if i == 1 or i == nil then
			keepScreen(true)
			x, y = findImageInRegionFuzzy(PIC_PATH..pic, per, x1-5,y1-5,x2-5,y2-5)
			if x~=-1 and y~=-1 then	
				keepScreen(false)	
				return true		
			else
				keepScreen(false)
				return false
			end	
		elseif i == 2 then
			keepScreen(true)
			x, y = findImageInRegionFuzzy(PIC_PATH..pic, per, x1-5,y1-5+361,x2-5,y2-5+361)
			if x~=-1 and y~=-1 then	
				keepScreen(false)	
				return true		
			else
				keepScreen(false)
				return false
			end			
		end
	end	
	
	function DmFindPicTwo(pic,per,x1,y1,x2,y2)
		keepScreen(true)
		x, y = findImageInRegionFuzzy(PIC_PATH..pic, per, x1-5,y1-5+361,x2-5,y2-5+361)
		if x~=-1 and y~=-1 then	
			keepScreen(false)	
			return true		
		else
			keepScreen(false)
			return false
		end	
	end
	
	
	-- 忽略色找图
	function DmFindPicFuzzy(pic,per,x1,y1,x2,y2,color,i)
		if i == 1 or i == nil then
			keepScreen(true)
			x, y = findImageInRegionFuzzy(PIC_PATH..pic,per,x1-5,y1-5,x2-5,y2-5,color)
			if x~=-1 and y~=-1 then
				keepScreen(false)
				return true		
			else
				keepScreen(false)
				return false
			end	
		elseif i == 2 then
			keepScreen(true)
			x, y = findImageInRegionFuzzy(PIC_PATH..pic,per,x1-5,y1-5+361,x2-5,y2-5+361,color)
			if x~=-1 and y~=-1 then
				keepScreen(false)
				return true		
			else
				keepScreen(false)
				return false
			end			
		end	
	end
	
		-- 忽略色找图
	function DmFindPicFuzzyTwo(pic,per,x1,y1,x2,y2,color)
		keepScreen(true)
		x, y = findImageInRegionFuzzy(PIC_PATH..pic,per,x1-5,y1-5+361,x2-5,y2-5+361,color)
		if x~=-1 and y~=-1 then
			keepScreen(false)
			return true		
		else
			keepScreen(false)
			return false
		end	
	end
	
	--上下滑动函数
	function myMove_UD(x1, y1, x2, y2,speed)
		local step = speed
		if y2 > y1 then step = -speed end 
		local cnt = math.abs((y2 - y1) /speed)
		if cnt == 0 then
			cnt = 1
			step = math.abs(y2 - y1)
		end
		touchDown(0, x1, y1)
		mSleep(50)
		for i = 1, cnt do
			mSleep(50)
			y1 = y1 - step
			touchMove(0, x1, y1)
		end
		touchUp(0)
		mSleep(100)
	end	
	--左右滑动函数
	function myMove_RL(x1, y1, x2, y2,speed)
		local step = speed
		if x2 > x1 then step = -speed end 
		local cnt = math.abs((x2 - x1) / speed)
		if cnt == 0 then
			cnt = 1
			step = math.abs(x2 - x1)
		end
		touchDown(0, x1, y1)
		mSleep(50)
		for i = 1, cnt do
			mSleep(50)
			x1 = x1 - step
			touchMove(0, x1, y1)
		end
		touchUp(0)
		mSleep(100)
	end	
	--分割字符串
--local list = Split("abc,123,345", ",")--示例
function Split(szFullString, szSeparator)  
	local nFindStartIndex = 1  
	local nSplitIndex = 1  
	local nSplitArray = {}  
	while true do  
	   local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)  
	   if not nFindLastIndex then  
		nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))  
		break  
	   end  
	   nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)  
	   nFindStartIndex = nFindLastIndex + string.len(szSeparator)  
	   nSplitIndex = nSplitIndex + 1  
	end  
	return nSplitArray  
end  

function delete(index,num)
		local t={}
        local file=io.open("var/touchelf/scripts/abc"..num..".txt")
        for line in file:lines() do
                table.insert(t,line)
        end
		local acc = dedaozhanghao(num)
        record(acc)
		temp_line=table.remove(t,index)
		
        local file=io.open("var/touchelf/scripts/abc"..num..".txt",'w')
        for i,j in ipairs(t) do
                file:write(j,'\n')
        end
        file:close()
        return temp_line
end 

--记录删除账号
function record(acc)
	local file
	file = io.open("var/touchelf/scripts/ban.txt","a+")
	local data = acc
	file:write(data..'\n')
	file:close()
end