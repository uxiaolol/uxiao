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
--应用程序包名
packagename = {'com.tianmashikong.qmqj.apps','com.tianmashikong.qmqj.apps.pp.1'}
--[[packagename = {'com.tianmashikong.qmqj.apps','X00.tianmashikong.qmqj.apps'}--]]
--计算器包名 com.apple.calculator 

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

function io.list7()
	for l in io.popen("ls ".."var/mobile/Applications/"):lines() do
		file=io.open("var/mobile/Applications/" ..l .."/apps.app/Info.plist")
		if file~=nil then
			path="var/mobile/Applications/" ..l .."/apps.app"
			youxiyouhua()
		end
	end
end

--台服奇迹自动选区
function auto()
	for l in io.popen("ls ".."/var/mobile/Applications/"):lines() do
		a = io.open("/var/mobile/Applications/" ..l .."/apps.app")	
		if a ~= nil then
		file=io.open("/var/mobile/Applications/" ..l .."/Library/Preferences/.GlobalPreferences.plist")
			if file~=nil then
				path = "/var/mobile/Applications/" ..l .."/Library/Preferences/"
				autoarea()
				file:close();
			end
		end	
	end
end

function os.remove(path)
    return os.execute("rm -rf "..path);
end	

--修改指定的区
function autoarea()
	local file,l
	file = io.open('/var/touchelf/scripts/log.xml','r')
	if file ~= nil then
		local data = file:read('*a')
		file:close()	
		local i,j = string.find(data,'LastServerInfoID')	 
		local k,h = string.find(data,'NoticeShowed')	 
		local head = string.sub(data,0,j+6)
		local mid = string.sub(data,j+7,k-6)
		mid = string.gsub(mid,'%d+',area,1)
		local tail = string.sub(data,k-5)
		
		file = io.open('/var/touchelf/scripts/log.xml','w')
		file:write(head..mid..tail)
		file:close()
		os.copy('/var/touchelf/scripts/log.xml','/var/touchelf/scripts/com.tianmashikong.qmqj.apps.plist')
		os.copy('/var/touchelf/scripts/com.tianmashikong.qmqj.apps.plist',path..'com.tianmashikong.qmqj.apps.plist')
		
		
		os.copy('/var/touchelf/scripts/log.xml','/var/touchelf/scripts/com.tianmashikong.qmqj.apps.pp.1.plist')
		os.copy('/var/touchelf/scripts/com.tianmashikong.qmqj.apps.plist',path..'com.tianmashikong.qmqj.apps.pp.1.plist')
		
		os.copy('/var/touchelf/scripts/log.xml','/var/touchelf/scripts/com.tianmashikong.qmqj.apps.pp.11.plist')
		os.copy('/var/touchelf/scripts/com.tianmashikong.qmqj.apps.plist',path..'com.tianmashikong.qmqj.apps.pp.11.plist')
	elseif file == nil then
		while true do 
			notifyMessage('缺少登录配置文件')
		end
	end	
end

function os.copy(path,to)
    return os.execute("cp -rf "..path.." "..to);
end


--UI界面
UI = {
	{'InputBox{}', 'id',    '宽带编号:' },
};

nowifi = 0
--自动选区
function smart()
	appKill(packagename[1])mSleep(1000)
	appKill(packagename[2])mSleep(1000)
	auto()
end

function main()
	mSleep(2000)
	unlock()
	rotateScreen(90)
	mSleep(1000)
	io.list7()
	time_start = os.date('*t',t)
	start = time_start.hour	
	while true do
		load()
		levelup()
		--minjie()
		--zhili()
		bag(1)	
		award()		
		--qiri()
		wing()
		uparc()
		exchange()
		upskill()
		weapon()
		necklace()
		awardholiday()
		using(1)		
		buy(1)
		emgc()
		if isDeal() then
			bingfenggu()
			dealbysayone()
		end
		exit()
		--[[router()--]]
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
--[[	awardlevel()--]]
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

function load()
	local i = 1
	local isok = {0,0}
	local account = 0
	local pwd = 0
	local isname ={0,0}
	local ismofa={0,0}
	local tt={os.time(),os.time()}
	local isfinish={0,0}
	local isclear={0,0}
	local count={0,0}
	local isarea={0,0}
	logDebug('load')
	nowifi = 0
	while (i < 3) do
		changeApp(i)
		if os.difftime(os.time(),tt[i]) > 180 then
			appKill(packagename[i])
			tt[i]=os.time()
			logDebug('load'..i..'超时')
			logDebug('kill'..':'..packagename[i])		
			isok[i] = 0
			account = 0
			pwd = 0
		elseif isfinish[i] == 1 then
			break
		elseif DmFindPic('bag.bmp',90,831,615,842,628) then
			logDebug('登录完成'..i)
			isfinish[i] = 1
		--排队
		elseif DmFindPic('paidui.bmp',85,545,428,558,441) then
			tt[i]=os.time()
		elseif DmFindPic('start.bmp',90,800,461,813,473) then
			click(x,y)  			
			--[[os.execute('reboot')--]]
		elseif DmFindPic('x_dialog.bmp',90,1004,222,1017,236) then
			click(x,y)  
		--关闭福利窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			closewin(i)
		--选择服务器
		elseif DmFindPic('x_xzfwq.bmp',90,990,30,1006,45) then
			click(x,y) logDebug('x_xzfwq')
		--勇士网络连接断开
		elseif DmFindPic('yongshi.bmp',90,428,274,452,291) and DmFindPic('queding.bmp',90,634,431,647,444) then
			click(x,y)
		--公告
		elseif DmFindPic('x_gonggao.bmp',85,1023,47,1037,62) then
			click(x,y)
		--服务器连接失败
		elseif DmFindPic('cuowu.bmp',90,548,228,563,240) and DmFindPic('qhzh.bmp',90,252,497,266,508) and DmFindPic('ljsb.bmp',90,637,435,652,447)   then
			click(x,y) logDebug('ljsb')
			isok[i] = 0
--[[			local file,l,f,jiy,peny,ourline
			file = io.open("/var/touchelf/scripts/avf"..i..".txt","r")
			ourline = tonumber(file:read())		
			delete(ourline,i)		--]]
		elseif DmFindPic('create.bmp',90,882,566,893,581) and DmFindPic('mofa.bmp',90,175,293,189,303) then	
			click(x,y) 
			ismofa[i]=1
		elseif DmFindPic('rename_sure.bmp',90,636,429,652,441) then
			click(x+5,y)mSleep(1000)   logDebug('rename')
			if DmFindPic('saizi.bmp',85,746,572,756,585) then--687,572
				click(x-60,y)mSleep(1000)inputText('\b\b\b\b\b\b\b\b\b')mSleep(500)
				local tail=randomnum(3)
				local head = randomstring(4)
				local name =head..tail
				inputText(name)
				click(x+160,y-270)--587,278
			end		
			isarea[i]=0
		elseif DmFindPic('jin.bmp',90,840,501,851,513) and isarea[i] == 1 then
			click(x,y) 	
		elseif DmFindPic('ru.bmp',85,984,583,1003,598,i) and isarea[i] == 1 then
			click(x,y)
		elseif DmFindPic('num.bmp',85,546,269,571,293,i) and DmFindPic('numsure.bmp',85,637,426,654,440,i) then
			click(x,y)
			isarea[i]=0
		elseif DmFindPic('huan.bmp',85,752,395,767,411,i) and isok[i]==1 then	
			click(x,y)
		elseif DmFindPic('suoyou.bmp',85,121,578,137,594,i) and isok[i]==1 then
			click(x,y)
		elseif DmFindPic('tuijie.bmp',85,120,576,144,592,i) and isok[i]==1 then--496,559
			click(889,594)mSleep(500)
			local file,ourline
			file = io.open("/var/touchelf/scripts/area.txt","r")
			ourline = file:read()
			keyborad(ourline,1)
			isarea[i]=1
		elseif DmFindPic('do.bmp',85,912,269,927,291,i) then
			click(x,y)
		--暂时与服务器断开连接
		elseif DmFindPic('yhzx.bmp',90,360,463,368,472,i) then
			click(x,y) logDebug('yhzx')
		elseif DmFindPic('mofahong.bmp',90,175,292,185,306) and DmFindPic('create.bmp',90,882,566,893,581) then			
			click(x,y) 
		elseif DmFindPic('jinru.bmp',90,546,577,560,588) then
			click(x,y)  
		--服务器验证999
		elseif DmFindPic('999.bmp',85,712,186,727,207) and DmFindPic('999queding.bmp',85,540,485,555,497) then
			click(x,y)
			notifyMessage('验证失败999需要断网')
			--[[router()--]]
		--账号封停
		elseif DmFindPic('fenghao.bmp',85,550,182,574,208) and DmFindPic('fenghaoqueding.bmp',90,542,488,555,498) and isok[i] == 1 then
			click(x,y)
			notifyMessage('账号被封')mSleep(2000)
			local file,l,f,jiy,peny,ourline
			file = io.open("/var/touchelf/scripts/avf"..i..".txt","r")
			ourline = tonumber(file:read())		
			delete(ourline,i)			
			isok[i]=0
		--账号封停
		elseif DmFindPic('fenghao.bmp',85,550,182,574,208) and DmFindPic('fenghaoqueding.bmp',90,542,488,555,498) then
			click(x,y)
		--登录异常
		elseif DmFindPic('dlyc.bmp',90,542,490,553,502) then
			click(x,y) 
			isname[i]=0
		--切换账号
		elseif DmFindPic('qhzh.bmp',90,252,497,266,508) then
			click(x,y)
		--登录按钮
		elseif DmFindPic('denglu.bmp',90,840,292,854,307) and isclear[i]==1 then --634,311
			click(x-210,y+20) mSleep(800)
		elseif DmFindPic('denglu.bmp',90,840,292,854,307) then
			history(i)
			isclear[i]=1
		elseif DmFindPic('denglu1.bmp',90,841,108,854,121) then
			account = dedaozhanghao(i)
			inputText('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')mSleep(1000)
			inputText(account)mSleep(1000)
			if DmFindPic('denglu1.bmp',90,841,108,854,121) then--666,195
				click(x-180,y+90)mSleep(1200)
				inputText('\b\b\b\b\b\b\b\b\b\b\b\b\b')mSleep(1000)
				inputText('qwer1876')mSleep(1000)
				click(x,y)
				isok[i] = 1
			end			
			--账号不存在
			local tt = os.time()
			local iswuxiao=0
			while os.difftime(os.time(),tt) < 3 do
				if (DmFindPic('zhbcz1.bmp',80,664,289,692,319) or DmFindPic('zhbcz2.bmp',80,735,278,769,318)) and iswuxiao==0 then					
					local file,l,f,jiy,peny,ourline
					file = io.open("/var/touchelf/scripts/avf"..i..".txt","r")
					ourline = tonumber(file:read())		
					delete(ourline,i)			
					notifyMessage('删除无效账号')
					iswuxiao = 1
				elseif count[i]> 2 then
					notifyMessage('输了三次都不对')
					local file,l,f,jiy,peny,ourline
					file = io.open("/var/touchelf/scripts/avf"..i..".txt","r")
					ourline = tonumber(file:read())		
					delete(ourline,i)			
					notifyMessage('删除无效账号')
					count[i]=0
				elseif DmFindPic('mimacuowu.bmp',85,739,289,767,318) and iswuxiao==0 then
					notifyMessage('账号或密码错误')
					isok[i] = 0
					count[i]=count[i]+1
					iswuxiao = 1
				else
					mSleep(50)
				end
			end
		--换行
		elseif DmFindPic('huanhang.bmp',90,563,556,575,569,i) or DmFindPic('return.bmp',80,555,558,570,567,i) then
			click(x,y)			
		--账号不能为空
		elseif DmFindPic('zhwk.bmp',90,544,363,605,412) then
			click(x,y)
		--请输入密码
		elseif DmFindPic('shurumima.bmp',85,552,366,599,408) then
			click(x,y)
			isok[i]=0
		else
			mSleep(200)
		end
		--[[i = i + 1--]]
		if i > 2 then
			i = 1
		end
	end	
end

function keyborad(key,i)
	local length=string.len(key)
	for a =1,10 do--541,563
		click(961,607)
	end	
	
	for j=1,length do
		local index = string.sub(key,j,j)
		if index=='1' then
			click(196,354)
		elseif index=='2' then
			click(573,353)
		elseif index=='3' then
			click(963,351)
		elseif index=='4' then
			click(199,431)
		elseif index=='5' then
			click(568,431)
		elseif index=='6' then
			click(959,438)
		elseif index=='7' then
			click(200,517)
		elseif index=='8' then
			click(569,518)
		elseif index=='9' then
			click(961,510)
		elseif index=='0' then
			click(572,601)
		end
	end
end

function reload(i)
	local isok = {0,0}
	local account = 0
	local pwd = 0
	local isname ={0,0}
	local ismofa={0,0}
	local tt={os.time(),os.time()}
	local isfinish={0,0}
	local isclear={0,0}
	local count={0,0}
	local i = 1
	logDebug('reload')
	nowifi = 0
	while (i < 3) do
		changeApp(i)
		if os.difftime(os.time(),tt[i]) > 180 then
			appKill(packagename[i])
			tt[i]=os.time()
			logDebug('reload'..i..'超时')
			logDebug('kill'..':'..packagename[i])		
			isok[i] = 0
			account = 0
			pwd = 0
		elseif isfinish[i] == 1 then
			break
		elseif DmFindPic('bag.bmp',90,831,615,842,628) then
			logDebug('reload完成'..i)
			isfinish[i] = 1
		elseif DmFindPic('start.bmp',90,800,461,813,473) then
			click(x,y)  			
			--[[os.execute('reboot')--]]
		elseif DmFindPic('x_dialog.bmp',90,1004,222,1017,236) then
			click(x,y)  
		--关闭福利窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			closewin(i)
		--选择服务器
		elseif DmFindPic('x_xzfwq.bmp',90,990,30,1006,45) then
			click(x,y) logDebug('x_xzfwq')
		--勇士网络连接断开
		elseif DmFindPic('yongshi.bmp',90,428,274,452,291) and DmFindPic('queding.bmp',90,634,431,647,444) then
			click(x,y)
		--公告
		elseif DmFindPic('x_gonggao.bmp',85,1023,47,1037,62) then
			click(x,y)
		--服务器连接失败
		elseif DmFindPic('cuowu.bmp',90,548,228,563,240) and DmFindPic('qhzh.bmp',90,252,497,266,508) and DmFindPic('ljsb.bmp',90,637,435,652,447)   then
			click(x,y) logDebug('ljsb')
			isok[i] = 0
--[[			local file,l,f,jiy,peny,ourline
			file = io.open("/var/touchelf/scripts/avf"..i..".txt","r")
			ourline = tonumber(file:read())		
			delete(ourline,i)		--]]
		elseif DmFindPic('create.bmp',90,882,566,893,581) and DmFindPic('mofa.bmp',90,171,297,182,306) then	
			click(x,y) 
			ismofa[i]=1
		elseif DmFindPic('rename_sure.bmp',90,637,433,650,445) then
			click(x+5,y)mSleep(1000)   logDebug('rename')
			if DmFindPic('saizi.bmp',85,746,572,756,585) then--687,572
				click(x-60,y)mSleep(1000)inputText('\b\b\b\b\b\b\b\b\b')mSleep(500)
				local tail=randomnum(3)
				local head = randomstring(4)
				local name =head..tail
				inputText(name)
				click(x+160,y-270)--587,278
			end		
		--输入账号密码之后点击进入游戏
		elseif DmFindPic('jin.bmp',90,840,501,851,513) and isok[i] == 1 then
			click(x,y) 			
		--暂时与服务器断开连接
		elseif DmFindPic('yhzx.bmp',90,360,463,368,472,i) then
			click(x,y) logDebug('yhzx')
		elseif DmFindPic('mofahong.bmp',90,176,295,186,304) and DmFindPic('create.bmp',90,882,566,893,581) then			
			click(x,y) 
		elseif DmFindPic('jinru.bmp',90,546,577,560,588) then
			click(x,y)  
		--服务器验证999
		elseif DmFindPic('999.bmp',85,673,184,688,206) and DmFindPic('999queding.bmp',85,543,493,558,507) then
			click(x,y)
			notifyMessage('验证失败999需要断网')
--[[			router()--]]
		--账号封停
		elseif DmFindPic('fenghao.bmp',85,550,182,574,208) and DmFindPic('fenghaoqueding.bmp',90,542,488,555,498)and isok[i] == 1 then
			os.execute('reboot')
		--账号封停
		elseif DmFindPic('fenghao.bmp',85,550,182,574,208) and DmFindPic('fenghaoqueding.bmp',90,542,488,555,498) then
			click(x,y)
		--登录异常
		elseif DmFindPic('dlyc.bmp',90,542,490,553,502) then
			click(x,y) 
			isname[i]=0
		--切换账号
		elseif DmFindPic('qhzh.bmp',90,252,497,266,508) then
			click(x,y)
		--登录按钮
		elseif DmFindPic('denglu.bmp',90,840,292,854,307) then --634,311
			click(x-210,y+20) mSleep(800)
		elseif DmFindPic('denglu1.bmp',90,841,108,854,121) then
			account = dedaozhanghao(i)
			inputText('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')mSleep(1000)
			inputText(account)mSleep(1000)
			if DmFindPic('denglu1.bmp',90,841,108,854,121) then--666,195
				click(x-180,y+90)mSleep(1200)
				inputText('\b\b\b\b\b\b\b\b\b\b\b\b\b')mSleep(1000)
				inputText('qwer1876')mSleep(1000)
				click(x,y)
				isok[i] = 1
			end			
			--账号不存在
			local tt = os.time()
			local iswuxiao=0
			while os.difftime(os.time(),tt) < 4 do
				if (DmFindPic('zhbcz1.bmp',80,664,289,692,319) or DmFindPic('zhbcz2.bmp',80,735,278,769,318)) and iswuxiao==0 then					
					os.execute('reboot')
				elseif count[i]> 2 then
					os.execute('reboot')
				elseif DmFindPic('mimacuowu.bmp',85,739,289,767,318) and iswuxiao==0 then
					notifyMessage('账号或密码错误')
					isok[i] = 0
					count[i]=count[i]+1
					iswuxiao = 1
				else
					mSleep(50)
				end
			end
		--换行
		elseif DmFindPic('huanhang.bmp',90,563,556,575,569,i) or DmFindPic('return.bmp',80,555,558,570,567,i) then
			click(x,y)			
		--账号不能为空
		elseif DmFindPic('zhwk.bmp',90,544,363,605,412) then
			click(x,y)
		--请输入密码
		elseif DmFindPic('shurumima.bmp',85,552,366,599,408) then
			click(x,y)
			isok[i]=0
		else
			mSleep(200)
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
		changeApp(i)
		if os.difftime(os.time(),tt) > 120 then
			appKill(packagename[i])
			tt=os.time()
			logDebug('register'..i..'超时')
			logDebug('kill'..':'..packagename[i])		
			isacc = 0
			ispwd = 0	
		elseif DmFindPic('ymzc.bmp',90,841,185,852,197) or DmFindPic('ymzc1.bmp',90,839,373,853,388) then
			click(x,y)
		elseif DmFindPic('zhanghao.bmp',90,237,129,247,141) and isacc == 0 then--626,136
			click(x+400,y+10)mSleep(1000)
			local tail=randomnum(8)
			account = 'qmqj'..tail
			inputText('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')mSleep(500)
			inputText(account)
			isacc=1
		elseif DmFindPic('mima.bmp',90,239,230,248,241) and ispwd == 0 then--684,236
			click(x+450,y+10)mSleep(1000)
			inputText('\b\b\b\bb\b\b\b\b\b\b\b\b')mSleep(500)
			inputText('qwer1876')
			ispwd = 1
		--提交账号
		elseif DmFindPic('tjzc.bmp',90,813,226,826,236) and isreg == 0 then
			click(x,y)
			isreg = 0
		--登录异常
		elseif DmFindPic('dlyc.bmp',90,542,490,553,502) then
			click(x,y)
		--请输入密码
		elseif DmFindPic('srmm.bmp',80,530,362,581,410) then
			click(x,y)
			isacc = 0
			pwd = 0
			--[[notifyMessage('a')--]]
		elseif DmFindPic('changducuowu.bmp',85,529,377,577,428) then
			click(x,y)
			isacc = 0
			pwd = 0			
		--注册失败
		elseif DmFindPic('zcsb.bmp',90,576,395,587,414) then
			click(x,y)		
			isacc = 0
			ispwd = 0
			isreg = 0
		elseif DmFindPic('zhuceguoduo.bmp',85,577,398,585,407) then
			click(x,y)
			isacc = 0
			ispwd = 0
			isreg = 0			
		--切换账号
		elseif DmFindPic('qhzh.bmp',90,252,497,266,508) and isacc==1 and ispwd == 1 then
			local file = io.open('/var/touchelf/scripts/abc'..i..'.txt','a+')
			logDebug('abc'..i..':'..account)
			file:write(account..'\n')
			file:close()
			--notifyMessage('写入完成')
			break
		elseif DmFindPic('qhzh.bmp',90,252,497,266,508) then
			click(x,y)
		else
			mSleep(300)
			con(i)
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
			break
		elseif DmFindPic('x_lsjl1.bmp',85,686,445,699,465) then
			clickone(686,447)mSleep(500)
		elseif DmFindPic('x_lsjl1.bmp',85,686,445,699,465)==false and DmFindPic('x_lsjl.bmp',85,685,369,700,389)then
			clickone(688,373)
			logDebug('history'..i..'ok')
			break
		elseif DmFindPic("xiala.bmp", 90,677,303,691,313) --[[and wf==1--]] then
		   clickone(679,302)mSleep(1500)
		   wf=2			
		elseif DmFindPic('qhzh.bmp',90,252,497,266,508) then
			click(x,y)		
		end       
		mSleep(200)
	end 	
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
	if f>20 then
		jiy=20
	else
	    jiy=f
	end 
	
	if tonumber(ourline)>jiy then
		local file,hello
		if tonumber(ourline)<=20 and peny==1 then 
			register(bao)
		elseif tonumber(ourline) > 20 then 
			file = io.open("/var/touchelf/scripts/avf"..bao..".txt","r")
			ourline = tonumber(file:read())
			file:close()
			file = io.open("/var/touchelf/scripts/avf"..bao..".txt","w")
			file:write(1)
			file:close()
			file = io.open("/var/touchelf/scripts/avf"..bao..".txt","r")
			ourline = tonumber(file:read())
			file:close()		
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


function levelup()
	nowifi = 0
	local time_table={os.time(),os.time()}
	local bag_table = {os.time(),os.time()}
	local click_time={os.time(),os.time()}
	local isallow = 0
	local isfinish={0,0}
	local i = 1
	local count={0,0}
	logDebug('levelup')
	while (i<3) do
		changeApp(i)
		if os.difftime(os.time(),time_table[i]) > 300 then
			appKill(packagename[i]) 
			logDebug('levelup:'..i..'超时')
			notifyMessage('干掉'..packagename[i]) mSleep(2000)
			time_table[i] = os.time()
			if i == 1 then
				time_table[i+1]=os.time()-60
			elseif i == 2 then
				time_table[i-1] = os.time() - 60
			end
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif DmFindPic('start.bmp',90,800,461,813,473) then
			click(x,y) 		
		--排队
		elseif DmFindPic('paidui.bmp',85,545,428,558,441) then
			time_table[i]=os.time()				
		--领取补偿
		elseif DmFindPic('huoqu.bmp',80,877,467,889,479) then
			clickone(x+20,y+10)	
		elseif DmFindPic('buchang.bmp',80,929,293,942,308) then
			clickone(x,y) 
		--领取任务	
		elseif DmFindPic('ling.bmp',80,859,472,870,487) then
			clickone(x,y)
			time_table[i] = os.time()
			count[i] = 0			
		-- 跳过提示
		elseif DmFindPic('tiaoguo.bmp',90,982,570,991,579) then
			clickone(x,y)
		elseif DmFindPic('tiaoguo1.bmp',85,1018,552,1025,573) then
			clickone(x,y)
		elseif DmFindPic('jump.bmp',90,921,555,926,574) then
			clickone(x,y) 	
		--回城复活
		elseif DmFindPic('hcfh.bmp',90,505,369,521,380) then
			clickone(x,y)
			time_table[i] = os.time() 
		--屏蔽其他玩家
		elseif DmFindPic('eye.bmp',90,1035,216,1045,227) then
			clickone(x,y)  
		--佩戴装备
		elseif (DmFindPic('peidai.bmp',90,713,504,724,516) or DmFindPic('peidai1.bmp',85,709,469,728,484))then
			clickone(x,y)
		--按照提示更换技能
		elseif DmFindPic('shouzhi1.bmp',85,862,590,885,614) then--1028,573
			click(x+170,y-20)
		--在打boss
		elseif DmFindPic('liangbai.bmp',85,330,49,360,63) then
			if DmFindPic('ksgj.bmp',85,947,464,958,476) then
				click(x,y)
			end
		--整理背包
		elseif os.difftime(os.time(),bag_table[i]) >480 and DmFindPic('bag.bmp',90,831,615,842,628) then
			click(x,y) mSleep(1500)
			if DmFindPic('person.bmp',90,590,44,605,57) then	
				bag(i)
				bag_table[i] = os.time()
			elseif DmFindPic('heilongbo.bmp',85,949,559,964,571) then
				click(x,y)
			end		
		elseif count[i] > 8 and DmFindPic('bag.bmp',90,831,615,842,628) then
			mSleep(1000)
			touchDown(0,52,593)
			mSleep(1500)
			touchUp(0)
			if DmFindPic('heilongbo.bmp',85,949,559,964,571) then
				click(x,y)mSleep(2000)
			end				
			count[i] = 0
		--2个窗口主线都完成了之后检查是否能进入古战场
		elseif isfinish[i] == 1 then
			break	
		--1转1
		elseif DmFindPicFuzzy('1zhuan1.bmp',90,82,233,119,250,0xffffff) and DmFindPic('bag.bmp',90,831,615,842,628) then
			isfinish[i]=1
		elseif (DmFindPic('zhandou.bmp',80,521,158,529,171) or DmFindPic('xunlu.bmp',80,521,157,532,168)) and os.difftime(os.time(),click_time[i]) < 15  then
			mSleep(2000)
		--任务停止移动之后点击主线任务	
		elseif isMoving() and DmFindPic('bag.bmp',90,831,615,842,628) and DmFindPicFuzzy('renwu.bmp',90,10,200,36,225,0xffffff) then--37,251
			click(x+25,y+50)
			count[i]=count[i]+1
			click_time[i]=os.time()
		--前往副本
		elseif DmFindPic('qianwang.bmp',85,860,478,874,491) then
			clickone(x,y) 
			time_table[i] = os.time()
		--章节奖励点击确定
		elseif DmFindPic('zhangjie.bmp',85,543,486,557,499) or DmFindPic('zhangjie1.bmp',85,947,464,958,476) then
			clickone(x,y)
			time_table[i] = os.time() 
		--跳出技能战盟等提示
		elseif DmFindPic('hei.bmp',85,33,100,41,108) then --39,120
			clickone(x+6,y+20) 
			time_table[i] = os.time() 
		--弹出对话框黑色
		elseif DmFindPic('shouzhi.bmp',90,565,530,581,544) then
			clickone(x,y)
			time_table[i] = os.time() 
		--佩戴翅膀
		elseif DmFindPic('peidaicb.bmp',90,539,330,552,343) then
			clickone(x,y) 
			time_table[i] = os.time() 
		--关闭翅膀窗口--人物栏叉子通用
		elseif DmFindPic('x_person.bmp',90,1095,36,1112,52) then
			clickone(x,y) 
		--领取任务	
		elseif DmFindPic('ling.bmp',90,859,473,869,487) then
			clickone(x,y)
			time_table[i] = os.time()
			count[i] = 0
		--黄字转生
		elseif DmFindPic('huangzs.bmp',85,427,435,439,448) then
			closewin()
			isfinish[i]=1
		--不够转生
		elseif DmFindPic('xuqiudengji.bmp',85,793,439,818,457) and DmFindPic('x_zs.bmp',90,1093,41,1106,55) then
			--关闭转生窗口
			click(x,y)		
		--关闭窗口之后将另外的窗口超时的起始时间置为0	
		elseif DmFindPic('lvzs.bmp',85,859,580,873,596) and DmFindPic('xuqiudengji.bmp',85,793,439,818,457) and DmFindPic('x_zs.bmp',90,1093,41,1106,55)== false then
			isfinish[i]=1
		--一转暂时不升级二转
		elseif DmFindPic('erzhuan.bmp',85,544,292,554,304,i) and DmFindPic('x_zs.bmp',90,1093,41,1106,55) then
			click(x,y)
		--绿色转生
		elseif DmFindPic('lvzs.bmp',85,859,580,873,596) then
			closewin()
			isfinish[i]=1
		--转生成功
		elseif DmFindPic('zscg.bmp',85,307,509,316,519,i) then
			click(x,y)   
		--恶魔广场任务做完了
		elseif DmFindPic('minxiang.bmp',85,683,482,701,494) and DmFindPic('likaiem.bmp',85,909,35,918,48) then
			click(x,y)
		--任务对话框
		elseif DmFindPic('ling.bmp',80,859,472,870,487) ==false and (DmFindPic('x_dialog.bmp',90,1004,222,1017,236) or DmFindPic('x_dialog1.bmp',90,1001,226,1014,237)) then
			clickone(x,y)  
			--[[time_table[i] = time_table[i] - 30			--]]
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y)  mSleep(100)	
		--兑换魔晶 /地图
		elseif DmFindPic('x_mojing.bmp',85,611,249,624,257,i) then
			click(x,y)		
		--古战场xx
		elseif DmFindPic('x_gzc.bmp',85,615,249,623,257,i) then
			click(x,y)			
		else		
			mSleep(200)	
			con(i)
		end
--[[		i = i + 1
		if i > 2 then
			i = 1
		end		--]]
	end
end


--整理背包
function bag(i)
		local count = 0
		nowifi = 0
		local time_table=os.time()
		local iszl=0
		--回收
		logDebug('bag'..i)
		appRun(packagename[i])mSleep(2000)
		while true do			
			if os.difftime(os.time(),time_table) > 150 then
				appKill(packagename[i])				
				time_table=os.time()
				logDebug('kill'..':'..packagename[i])				
				logDebug('bag'..i..'超时')
			--连接断开立即重连与立即刷新
			elseif DmFindPic('dxl.bmp',90,512,422,521,431)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
				clickone(x,y)
			elseif DmFindPic('bag.bmp',90,831,615,842,628) then
				click(x,y)  mSleep(1500) pack(i) 
			elseif (DmFindPic('peidai.bmp',90,713,504,724,516) or DmFindPic('peidai1.bmp',85,709,469,728,484)) then
				click(x,y) 				
			elseif DmFindPic('x_dialog.bmp',90,1004,222,1017,236) then
				click(x,y) 	
			elseif DmFindPic('x_zhuoyue.bmp',90,793,169,810,181) then
				click(x,y)
			elseif DmFindPic('huishou.bmp',85,683,585,700,595) or DmFindPic('zbhuishou.bmp',90,669,586,684,601) then
				click(x,y) 
			--勾选			
			elseif DmFindPic('person.bmp',90,590,44,605,57) and DmFindPic('lvzhuang.bmp',85,284,509,298,521) then
				click(x,y)  
			elseif DmFindPic('person.bmp',90,590,44,605,57) and DmFindPic('lanzhuang.bmp',85,403,507,417,522) then
				click(x,y) 
			elseif DmFindPic('person.bmp',90,590,44,605,57) and DmFindPic('zizhuang.bmp',85,527,509,542,521) then
				click(x,y) 
			--回收确定	
			elseif DmFindPic('hsqueding.bmp',90,260,462,269,470,i) then
				click(x,y) 	
			elseif count > 2 then
				local tt = os.time()
				while os.difftime(os.time(),tt) < 2 do
					if DmFindPic('zhengli.bmp',80,1008,583,1021,596) and iszl == 0 then
						click(x,y)
						iszl=1
					end
				end				
				closewin()
				logDebug('回收魔晶点击超过3次')
				break		
			--贵重物品是否回收
			elseif DmFindPic('gzwp.bmp',85,458,430,474,441) then
				click(x,y)
			--登录异常
			elseif DmFindPic('dlyc.bmp',90,542,490,553,502) then
				click(x,y)				
			--误点其他地方导致卡屏
			elseif DmFindPic('x_all.bmp',90,1089,27,1103,42) then
				click(x,y)
			--立即回收
			elseif DmFindPic('ljhuishou.bmp',85,216,577,232,592) then
				click(x,y) 
				count = count + 1	
			elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
				click(x,y)  mSleep(300)				
			else
				mSleep(200)
				anchorApp(i)
				con(i)
			end	
		end		
end


--背包完全打开
function pack(i)
	logDebug('pack'..i)
	nowifi = 0
	local tt =os.time()
	while os.difftime(os.time(),tt) < 4 do
		if DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	
		elseif DmFindPic('person.bmp',90,590,44,605,57) then
			logDebug('背包完全打开'..i)
			break
		elseif DmFindPic('bag.bmp',90,831,615,842,628) then
			click(x,y)
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			closewin(i)
		elseif DmFindPic('x_dialog.bmp',90,1004,222,1017,236) then
			click(x,y)  
		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)			
		else
			mSleep(200)
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
	local time_table=os.time()
	logDebug('using')	
	appRun(packagename[i])mSleep(2000)
	while true do		
		mSleep(200)
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
		if os.difftime(os.time(),time_table) > 180 then
			time_table=os.time()
			appKill(packagename[i])
			logDebug('kill'..':'..packagename[i])
			logDebug('using'..i..'超时')
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		--打开背包
		elseif DmFindPic('bag.bmp',90,831,615,842,628) then
			click(x,y)  
			pack(i)	
			if DmFindPic('zhengli.bmp',80,1007,588,1019,602) then
				click(x,y)mSleep(500)
			end			
		--全部使用
		elseif DmFindPic('qbshiyong.bmp',85,547,479,561,495) then
			click(x,y)		
		--金币部分
		elseif DmFindPic('shiyong1.bmp',85,824,421,838,435) or DmFindPic('shiyong2.bmp',85,822,460,836,474) then
			click(x,y)
		elseif DmFindPic('shiyong3.bmp',85,822,434,835,446) then
			click(x,y)
		--合成材料部分
		elseif DmFindPic('hecheng.bmp',90,429,344,443,358) and DmFindPic('hechengcs.bmp',90,821,419,832,436) then
			click(x,y) 
		elseif DmFindPic('hecheng1.bmp',90,427,307,443,320) and DmFindPic('hechengcs1.bmp',90,822,457,835,471) then
			click(x,y) 

		elseif wz > 25 then
			closewin(i)
			logDebug('25格使用完成')
			break
		elseif DmFindPic('person.bmp',90,590,44,605,57) then
			mSleep(1000)
			click(690+a*93,146+b*93)
			wz = wz + 1
		--贵重物品
		elseif DmFindPic('guizhongwuping.bmp',85,637,431,650,445) then
			click(x,y)
			mSleep(1000)
			if DmFindPic('x_all.bmp',90,1089,27,1103,42) then
				click(x,y)
			end
		--误点其他地方导致卡屏
		elseif DmFindPic('x_all.bmp',90,1089,27,1103,42) then
			click(x,y)
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y)  	
		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)			
		else			
			mSleep(200)
			anchorApp(i)
			con(i)
		end
	end
end


function minjie()
	logDebug('minjie')
	local i = 1
	local tt=os.time()
	while i< 3 do
		changeApp(i)
		if os.difftime(os.time(),tt) > 180 then
			appKill(packagename[i])
			tt = os.time()
			logDebug('kill'..':'..packagename[i])			
			logDebug('minjie'..i..'超时')
		--排队
		elseif DmFindPic('paidui.bmp',85,545,428,558,441) then
			tt=os.time()			
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif DmFindPic('bag.bmp',90,831,615,842,628) then
			click(x,y)  pack(i)
		--确认敏捷加点为128点
		elseif DmFindPic('bai128.bmp',85,726,415,767,438) then
			clickone(1106,42)
			break
		--敏捷加点完成
		elseif DmFindPic('128.bmp',85,961,400,1002,421) and DmFindPic('mjqd.bmp',85,786,574,800,588) then
			click(x,y)
		elseif DmFindPic('que.bmp',85,964,454,979,468) then
			click(692,287)
			click(789,291)
			click(787,466)
			click(974,467)
		--敏捷点数分配
		elseif  DmFindPic('minjiejian.bmp',85,861,402,873,414) == false and DmFindPic('que.bmp',85,964,454,979,468)==false and DmFindPic('minjie.bmp',85,1062,401,1076,416) then
			click(x,y)
		elseif DmFindPic('minjie.bmp',85,1062,401,1076,416) and DmFindPic('minjiejian.bmp',85,861,402,873,414) then
			click(968,407)	
		--确认
		elseif DmFindPic('xdqr.bmp',85,613,383,627,397) then
			click(x,y)
		--洗点
		elseif DmFindPic('xidian.bmp',85,786,576,798,587) then
			click(x,y)			
		--点击属性
		elseif DmFindPic('shuxing.bmp',85,73,153,90,166) then
			click(x,y)
		--加点
		elseif DmFindPic('jiadian.bmp',90,879,122,892,139) then
			click(x,y)
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y)  				
		else
			mSleep(500)
			con(i)
		end
	end
end

function zhili()
	logDebug('zhili')
	local i = 1
	local tt=os.time()
	while i< 3 do
		changeApp(i)
		if os.difftime(os.time(),tt) > 180 then
			appKill(packagename[i])
			tt = os.time()
			logDebug('kill'..':'..packagename[i])			
			logDebug('zhili'..i..'超时')
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		--排队
		elseif DmFindPic('paidui.bmp',85,545,428,558,441) then
			tt=os.time()					
		elseif DmFindPic('bag.bmp',90,831,615,842,628) then
			click(x,y)  pack(i)
		--确认敏捷加点为128点
		elseif DmFindPic('bai367.bmp',85,723,329,764,350) then
			clickone(1106,42)
			break
		--敏捷加点完成
		elseif DmFindPic('367.bmp',85,959,313,1000,336) and DmFindPic('mjqd.bmp',85,786,574,800,588) then
			click(x,y)
		elseif DmFindPic('que.bmp',85,964,454,979,468) then
			click(882,290)
			click(880,377)
			click(692,466)
			click(974,467)
		--敏捷点数分配
		elseif  DmFindPic('zhilijian.bmp',85,862,317,875,334) == false and DmFindPic('que.bmp',85,964,454,979,468)==false and DmFindPic('zhili.bmp',85,1065,317,1079,329) then
			click(x,y)
		elseif DmFindPic('zhili.bmp',85,1065,317,1079,329) and DmFindPic('zhilijian.bmp',85,862,317,875,334) then
			click(966,326)	
		--确认
		elseif DmFindPic('xdqr.bmp',85,613,383,627,397) then
			click(x,y)
		--洗点
		elseif DmFindPic('xidian.bmp',85,786,576,798,587) then
			click(x,y)			
		--点击属性
		elseif DmFindPic('shuxing.bmp',85,73,153,90,166) then
			click(x,y)
		--加点
		elseif DmFindPic('jiadian.bmp',90,879,122,892,139) then
			click(x,y)
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y)  				
		else
			mSleep(500)
			con(i)
		end
	end
end

--兑换护身符
function exchange()
	nowifi = 0
	local time_table={os.time(),os.time()}	
	local i = 1 
	local ishave={0,0}
	logDebug('exchange')
	while (i<3) do
		changeApp(i)
		if os.difftime(os.time(),time_table[i]) > 180 then
			appKill(packagename[i])
			time_table[i] = os.time()
			logDebug('kill'..':'..packagename[i])			
			logDebug('exchange'..i..'超时')
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif DmFindPic('bag.bmp',90,831,615,842,628) then
			click(x,y)  pack(i)
		--佩戴护身符
		elseif (DmFindPic('peidai.bmp',90,713,504,724,516) or DmFindPic('peidai1.bmp',85,709,469,728,484)) then
			click(x,y)			
		elseif ishave[i]==1 then
			closewin()
			break
		elseif DmFindPic('hsf.bmp',80,553,150,567,159) then
			ishave[i]=1
			closewin()
		elseif DmFindPic('huiduihuan.bmp',90,973,202,992,216) then
			ishave[i]=1
			closewin()
		elseif DmFindPic('person.bmp',90,590,44,605,57) and DmFindPic('huobi.bmp',90,75,222,91,238) then
			click(x,y)
		elseif DmFindPic('qianwangmj.bmp',90,974,476,991,489) then
			click(x,y)mSleep(1500)
		elseif DmFindPic('lijiduihuan.bmp',90,971,201,983,216) then
			click(x,y)
		--任务对话窗口
		elseif DmFindPic('x_dialog.bmp',90,1004,222,1017,236) then
			click(x,y) mSleep(500)
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(500)	
		else
			mSleep(300)
			con(i)
		end
		--[[i = i + 1--]]
		if i > 2 then
			i = 1
		end
	end
end

--升级技能
function upskill()
	nowifi = 0
	local i = 1
	math.randomseed(tostring(os.time()):reverse():sub(1, 6))  
	local time_table={os.time(),os.time()}	
	local isup={1,1}
	logDebug('upskill')
	while (i<3)do		
		changeApp(i)
		if os.difftime(os.time(),time_table[i]) > 240 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('kill'..':'..packagename[i])
			logDebug('upskill'..i..'超时')
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif DmFindPic('bag.bmp',90,831,615,842,628) then
			click(x,y)  pack(i)
		elseif DmFindPic('person.bmp',90,590,44,605,57) and DmFindPic('jineng.bmp',90,70,367,88,381) then
			click(x,y) mSleep(300)
		elseif isup[i]>4 then
			closewin()
			break
			
		elseif DmFindPic('jinengliang.bmp',90,72,367,89,379) and isup[i]>0 then	--随机点击4个技能 199,322 276,318 353,319 429,317
			local wz = {{353,175},{493,175},{620,173},{758,172}}
			local index = math.random(1,4)
			a = wz[index]
			click(wz[index][1],wz[index][2]) mSleep(300)
			local tt = os.time()
			while os.difftime(os.time(),tt) < 4 do
				--绿色升级按钮
				if DmFindPic('shengjijineng.bmp',90,846,538,858,554) then
					clickone(x,y)
				else
					mSleep(50)
				end
			end
			isup[i]=isup[i]+1			
		elseif DmFindPic('huishengji.bmp',90,843,537,862,551) then
			isup[i]=isup[i]+1			
		--材料不足
		elseif DmFindPic('x_cailiao.bmp',90,752,79,766,89) then
			click(x,y)
		--任务对话窗口
		elseif DmFindPic('x_dialog.bmp',90,1004,222,1017,236) then
			click(x,y) mSleep(500)
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(500)
		elseif DmFindPic('x_mojing.bmp',90,1087,42,1102,53) then
			click(x,y) mSleep(300)						
		else
			mSleep(300)
			con(i)
		end
		--[[i = i + 1--]]
		if i > 2 then
			i  = 1
		end
	end
end
--领奖
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
		changeApp(i)	
		if os.difftime(os.time(),time_table[i])>180 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('kill'..':'..packagename[i])
			logDebug('award'..i..'超时')
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)			
		elseif isok[i]==1 then
			closewin()
			break
		elseif (DmFindPic('peidai.bmp',90,713,504,724,516) or DmFindPic('peidai1.bmp',85,709,469,728,484)) then
			clickone(x,y)			
		elseif DmFindPic('lingqu1.bmp',80,955,303,996,615)--[[ or DmFindPic('lingqu2.bmp',85,554,401,564,411,i)) and count < 4 --]]then
			click(x,y) mSleep(500)					
		--已经滑动到最下面了
		elseif DmFindPicFuzzy('san.bmp',80,954,304,990,613,0xffffff) and (DmFindPic('leijiliang.bmp',85,97,451,113,465) or isdj[i]==1 )then
			isok[i]=1
			closewin()
		elseif os.difftime(os.time(),time_table[i]) > 5 and ((DmFindPic('leijiliang.bmp',85,97,451,113,465) or isdj[i]==1) and DmFindPic('dafuli.bmp',90,597,48,612,60)) then
			myMove_UD(1000,607,1003,323,20)
			aa_time[i]=os.time()
		elseif DmFindPic('fuli.bmp',90,665,65,677,78) == false and DmFindPic('bag.bmp',90,831,615,842,628) and DmFindPic('head.bmp',85,10,50,21,60) then	
			click(x,y)mSleep(1500)			
		elseif DmFindPic('fuli.bmp',90,665,65,677,78) then
			click(x,y) mSleep(1500)				
		elseif DmFindPic('dafuli.bmp',90,597,48,612,60) and DmFindPic('leijidenglu.bmp',90,97,453,114,467) then
			click(x,y)		
			isdj[i]=1
		--关闭福利窗口
		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)			
		--材料不足
		elseif DmFindPic('x_cailiao.bmp',90,752,79,766,89) then
			click(x,y)
		else
			mSleep(300)
			con(i)
			anchorApp(i)
		end
		--[[i = i + 1--]]
		if i > 2 then
			i = 1
		end	
	end	
end

--七日狂欢
function qiri()
	nowifi = 0
	local i =1
	local t1=os.time()
	local t2=os.time()
	local time_table={t1,t2}	
	local aa_time={os.time(),os.time()}
	local isok={0,0}
	local isdj={0,0}
	local count = 0
	logDebug('qiri')
	while (i<3) do
		changeApp(i)	
		if os.difftime(os.time(),time_table[i])>180 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('kill'..':'..packagename[i])
			logDebug('qiri'..i..'超时')
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)			
		elseif isok[i]==1 then
			closewin()
			break
		elseif (DmFindPic('peidai.bmp',90,713,504,724,516) or DmFindPic('peidai1.bmp',85,709,469,728,484)) then
			clickone(x,y)			
		elseif DmFindPic('lingquqr.bmp',80,951,292,987,601)--[[ or DmFindPic('lingqu2.bmp',85,554,401,564,411,i)) and count < 4 --]]then
			click(x,y) mSleep(500)					
		--已经滑动到最下面了
		elseif count > 3 and (DmFindPic('denglufl.bmp',85,97,108,112,120) or isdj[i]==1 )then
			isok[i]=1
			closewin()
		elseif os.difftime(os.time(),time_table[i]) > 4 and ((DmFindPic('denglufl.bmp',85,97,108,112,120) or isdj[i]==1) and DmFindPic('qirikh.bmp',85,537,45,550,60)) then
			myMove_UD(774,600,769,357,20)
			count = count + 1
			aa_time[i]=os.time()
		elseif DmFindPic('fuli.bmp',90,665,65,677,78) == false and DmFindPic('bag.bmp',90,831,615,842,628) and DmFindPic('head.bmp',85,10,50,21,60) then	
			click(x,y)mSleep(1500)	
		elseif DmFindPic('fuli.bmp',90,665,65,677,78)  and (DmFindPic('qiri.bmp',85,892,146,904,155)==false and DmFindPic('hefu.bmp',85,895,141,909,155)==false) then
			logDebug('七日没有')
			break
		--有的区			
		elseif DmFindPic('qiri.bmp',85,892,146,904,155) or DmFindPic('qiri1.bmp',85,912,240,925,252) then
			click(x,y) mSleep(1500)	
		elseif DmFindPic('hefu.bmp',85,895,141,909,155) then
			click(x,y)
		--关闭福利窗口
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(500)		
		--材料不足
		elseif DmFindPic('x_cailiao.bmp',90,752,79,766,89) then
			click(x,y)
		else
			mSleep(300)
			con(i)
			anchorApp(i)
		end
		--[[i = i + 1--]]
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
		changeApp(i)		
		if os.difftime(os.time(),time_table[1])>120 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('awardlevel'..i..'超时')
			logDebug('kill'..':'..packagename[i])			
		elseif isok[i]==1 then
			closewin()
			break
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	
		elseif DmFindPic('fuli.bmp',90,665,65,677,78) == false and DmFindPic('bag.bmp',90,831,615,842,628) and DmFindPic('head.bmp',85,10,50,21,60) then	
			click(x,y)mSleep(1500)			
		elseif DmFindPic('fuli.bmp',90,665,65,677,78) then
			click(x,y) 	
		elseif (DmFindPic('peidai.bmp',90,713,504,724,516) or DmFindPic('peidai1.bmp',85,709,469,728,484)) then
			clickone(x,y)			
		elseif DmFindPic('dafuli.bmp',90,596,49,613,63) and DmFindPic('dengji.bmp',90,74,317,89,336) then
			click(x,y)mSleep(500)
		--领取等级奖励
		elseif DmFindPic('lingqu1.bmp',80,952,323,990,604) then
			click(x,y)
		--已领取
		elseif DmFindPicFuzzy('ylq.bmp',80,977,540,996,560,0xffffff) and DmFindPic('dafuli.bmp',90,596,49,613,63)then
			isok[i]=1			
		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)			
		elseif DmFindPic('x_cailiao.bmp',90,413,269,422,279,i) then
			click(x,y)
		else
			mSleep(300)
			con(i)
			anchorApp(i)
		end
		--[[i = i + 1--]]
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
		changeApp(i)		
		if os.difftime(os.time(),time_table[i]) > 180 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('awardonline'..i..'超时')
			logDebug('kill'..':'..packagename[i])				
		elseif isok[i]==1 then
			closewin()
			break
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	
		elseif DmFindPic('fuli.bmp',90,665,65,677,78) == false and DmFindPic('bag.bmp',90,831,615,842,628) and DmFindPic('head.bmp',85,10,50,21,60) then	
			click(x,y)mSleep(1500)			
		elseif DmFindPic('fuli.bmp',90,665,65,677,78) then
			click(x,y) 	
		elseif (DmFindPic('peidai.bmp',90,713,504,724,516) or DmFindPic('peidai1.bmp',85,709,469,728,484))then
			clickone(x,y)				
		elseif DmFindPic('dafuli.bmp',90,596,49,613,63) and DmFindPic('zaixian.bmp',90,98,529,113,543) then
			click(x,y)mSleep(500)
		--领取变灰
		elseif DmFindPic('lingzxhui.bmp',90,839,448,854,462) then
			isok[i]=1
			closewin()
		--领取在线奖励
		elseif DmFindPic('lingzx.bmp',90,839,453,853,466) then
			click(x,y)mSleep(4000)
--[[		elseif DmFindPic('zaixian.bmp',90,57,518,71,529,i) then
			click(x,y)--]]
		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)			
		elseif DmFindPic('x_cailiao.bmp',90,413,269,422,279,i) then
			click(x,y)
		else
			mSleep(300)
			con(i)
			anchorApp(i)
		end
		--[[i = i + 1--]]
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
		changeApp(i)				
		if os.difftime(os.time(),time_table[1])>120 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('awardlx'..i..'超时')
			logDebug('kill'..':'..packagename[i])			
		elseif isok[i]==1 then
			closewin()
			break
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	
		elseif DmFindPic('fuli.bmp',90,665,65,677,78) == false and DmFindPic('bag.bmp',90,831,615,842,628) and DmFindPic('head.bmp',85,10,50,21,60) then	
			click(x,y)mSleep(1500)			
		elseif DmFindPic('fuli.bmp',90,665,65,677,78) then
			click(x,y) 		
		elseif DmFindPic('peidai.bmp',90,712,507,722,518) or DmFindPic('peidai1.bmp',85,709,470,721,485) then
			clickone(x,y)					
		elseif DmFindPic('dafuli.bmp',90,596,49,613,63) and DmFindPic('lianxu.bmp',90,50,390,65,406) then
			click(x,y)mSleep(500)
		elseif DmFindPic('linglx.bmp',90,859,443,871,459) then
			click(x,y)mSleep(4000)
			isok[i]=1 
			mSleep(2000)
			closewin()
		elseif DmFindPic('linglxhui.bmp',85,857,449,870,464) then
			isok[i]=1
			closewin()
		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)			
		elseif DmFindPic('x_cailiao.bmp',90,413,269,422,279,i) then
			click(x,y)
		else
			mSleep(300)
			con(i)
			anchorApp(i)
		end
		--[[i = i + 1--]]
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
	local aa_time={t1,t2}
	local count = {0,0}
	local isok={0,0}
	local dianji={0,0}
	logDebug('awardholiday')
	while (i<3) do
		changeApp(i)		
		if os.difftime(os.time(),time_table[i])>120 then
--[[			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('awardholiday'..i..'超时')
			logDebug('kill'..':'..packagename[i])	--]]
			closewin()
			break		
		elseif isok[i]==1 then
			closewin(1)
			break
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	
		elseif DmFindPic('fuli.bmp',90,665,65,677,78) == false and DmFindPic('bag.bmp',90,831,615,842,628) and DmFindPic('head.bmp',85,10,50,21,60) then	
			click(x,y)mSleep(1500)	
		elseif DmFindPic('holiday1.bmp',85,473,166,484,179) then
			click(x,y)mSleep(1000)
		elseif DmFindPic('fuli.bmp',90,665,65,677,78) and DmFindPic('holiday.bmp',85,584,64,594,77)==false then
			isok[i]=1
		elseif DmFindPic('fuli.bmp',90,665,65,677,78) and DmFindPic('holiday.bmp',85,584,64,594,77)then
			click(x,y) 		
		elseif DmFindPic('dajieri.bmp',85,535,51,551,62) and DmFindPic('zhounian.bmp',85,98,179,113,193) then
			click(x,y)
			dianji[i]=1
		--领取节日
		elseif DmFindPic('lingqujieri.bmp',80,971,361,1006,609) then
			click(x,y)
--[[		elseif DmFindPicFuzzy() and DmFindPic() then
			isok[i]=i--]]
		elseif DmFindPic('seven.bmp',80,250,553,268,581) or count[i]>3 then
			isok[i]=1
			closewin()
		elseif os.difftime(os.time(),aa_time[i]) > 3 and ((DmFindPic('zhounianliang.bmp',80,57,323,67,331,i) or dianji[i]==1) or DmFindPic('dajieri.bmp',85,535,51,551,62))then
			myMove_UD(1026,605,1024,450,20)mSleep(500)
			count[i]=count[i]+1
			aa_time[i]=os.time()						
		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)			
		elseif DmFindPic('x_cailiao.bmp',90,413,269,422,279,i) then
			click(x,y)
		elseif DmFindPic('dajieri.bmp',85,535,51,551,62)==false and DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(100)			
		else
			mSleep(300)
			con(i)
			anchorApp(i)
		end
		--[[i = i + 1--]]
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
	local isfinish={0,0}
	logDebug('wing')
	while (i<3) do
		changeApp(i)
		if os.difftime(os.time(),time_table[i]) > 180 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('kill'..':'..packagename[i])
			logDebug('wing'..i..'超时')
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif DmFindPic('bag.bmp',90,831,615,842,628) then
			click(x,y) pack(i) 
		elseif DmFindPic('person.bmp',90,590,44,605,57) and DmFindPic('cb.bmp',85,73,432,89,445) then
			click(x,y) 
		elseif DmFindPic('peidaicb.bmp',90,541,334,556,347) then
			clickone(x,y)			
		elseif isfinish[i]==1 then
			closewin()
			break
		elseif DmFindPic('x_cailiao.bmp',90,752,79,766,89) then
			isfinish[i]=1
			closewin()
		--如果发现为1阶段翅膀则先买火种
--[[		elseif DmFindPic('liangcb.bmp',90,75,445,91,459) and DmFindPic('yijie.bmp',90,177,138,190,159) and b[i] == 0 then
			buyseed(i)
			b[i] = 1--]]
		--自动提升
		elseif DmFindPic('zdts.bmp',90,786,567,799,580) or DmFindPic('zdjj.bmp',85,788,570,805,584) then
			click(x,y)
		elseif DmFindPic('daojutisheng.bmp',90,786,486,800,500) or DmFindPic('daojujinjie.bmp',85,788,483,800,501) then
			click(x,y) 
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(500)	
		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)					
		else
			mSleep(300)
			con(i)
		end	
		--[[i = i + 1--]]
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
		if DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)		
		elseif DmFindPic('bag.bmp',90,831,615,842,628) then
			click(x,y) pack(i) 	
		elseif DmFindPic('person.bmp',90,586,44,602,56) and DmFindPic('huobi.bmp',90,74,225,91,238) then
			click(x,y)		
		elseif DmFindPic('zsqianwang.bmp',90,976,391,988,404) then
			click(x,y)
		elseif DmFindPic('shen.bmp',90,840,517,854,530) and isbuy == 0 then --442,521
			click(x,y)
		--买13个火种
		elseif DmFindPic('one.bmp',90,448,283,464,302) and one == 0 then
			click(x,y)
			one = 1
		elseif DmFindPic('three.bmp',90,636,287,653,304) and three == 0 then
			click(x,y)
			three = 1
		--确认
		elseif DmFindPic('queren.bmp',90,739,466,754,478) then
			click(x,y)
		elseif DmFindPic('jiahao.bmp',90,632,416,644,430) and jh == 0 then --586,418
			click(x-50,y+2)				
			jh = 1
		elseif DmFindPic('gmhong.bmp',90,821,464,835,476) and isbuy == 0 then
			click(x,y)
			isbuy = 1
		elseif DmFindPic('x_shangcheng.bmp',90,1102,29,1118,40) and isbuy == 1 then
			closewin()
			logDebug('神鹰火种购买完成')
			break
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(500)			
		else
			mSleep(300)
		end
	end
end

--升级成就
function uparc()
	local i = 1
	nowifi = 0
	local time_table={os.time(),os.time()}	
	local isfinish={0,0}
	logDebug('uparc')
	while (i<3) do
		changeApp(i)
		if os.difftime(os.time(),time_table[i]) > 180 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('kill'..':'..packagename[i])
			logDebug('uparc'..i..'超时')
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif isfinish[i]==1 then
			closewin()
			break			
		elseif DmFindPic('bag.bmp',90,831,615,842,628) then
			click(x,y) pack(i) 
		elseif DmFindPic('person.bmp',90,590,44,605,57) and DmFindPic('huobi.bmp',90,75,222,91,238) then
			click(x,y)
		elseif DmFindPic('qwchengjiu.bmp',90,977,570,989,582) then
			click(x,y)
		--灰色提升
		elseif DmFindPic('heitisheng.bmp',90,919,208,937,224) then
			isfinish[i]=1
			closewin()
		elseif DmFindPic('tschengjiu.bmp',90,920,208,933,223) then
			click(x,y)
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(500)				
		else
			mSleep(300)
			con(i)
		end
		--[[i = i + 1--]]
		if i > 2 then
			i =  1
		end
	end
end

--购买声望勋章
function buypre(i)
	local count = 1 
	local ispre=0
	nowifi = 0
	local tt =os.time()
	appRun(packagename[i])mSleep(2000)
	while true do
		if os.difftime(os.time(),tt) > 120 then
			appKill(packagename[i])
			tt=os.time()
			logDebug('buypre'..i..'超时')
			logDebug('kill'..':'..packagename[i])
		elseif ispre == 1 then
			closewin()
			break			
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif DmFindPic('bag.bmp',90,831,615,842,628) then
			click(x,y) pack(i) 
		elseif DmFindPic('person.bmp',90,586,44,602,56) and DmFindPic('huobi.bmp',90,74,225,91,238) then
			click(x,y)
		elseif DmFindPic('zsqianwang.bmp',90,976,391,988,404) then
			click(x,y)
		--点击声望勋章
		elseif DmFindPic('pre.bmp',80,778,308,791,318) then
			click(x,y)
		--点击购买
		elseif DmFindPic('gmpre.bmp',85,819,479,831,490) and count > 1 then
			click(x,y)
			ispre = 1
		--点击声望的加号
		elseif DmFindPic('prejia.bmp',85,639,429,649,443) then
			click(x,y)		
			count= count + 1
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(500)			
		else
			mSleep(100)
			con(i)
			anchorApp(i)
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
		changeApp(i)
		if os.difftime(os.time(),time_table[i]) > 120 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('kill'..':'..packagename[i])
			logDebug('uparc'..i..'超时')
		elseif isok[i]==1 then
			closewin()
			break
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif DmFindPic('bag.bmp',90,831,615,842,628) then
			click(x,y) pack(i) 
		elseif DmFindPic('huobi.bmp',90,74,225,91,238) then
			click(x,y)
		elseif DmFindPicFuzzy('hao.bmp',80,644,554,671,584,0xffffff) then
			mSleep(500)
			myMove_UD(528,617,528,550,2)mSleep(500)
			move[i]=1
		--提升声望
		elseif DmFindPicFuzzy('hao1.bmp',75,641,454,674,542,0xffffff)then--168,455 979,552
			click(x+320,y+100)
			--[[notifyMessage(i)mSleep(1000)--]]
		--提升军衔
		elseif DmFindPic('tsjx.bmp',85,870,605,882,616) then
			click(x,y)
		--提升变黑
		elseif DmFindPic('tshei.bmp',85,869,609,883,620) then
			isok[i]=1
			closewin()
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y)  mSleep(300)		
		elseif move[i] == 1 then
			mSleep(200)
			--[[notifyMessage('a'..i)mSleep(2000)--]]
			if DmFindPic('x_person.bmp',90,1095,36,1112,52) then
				closewin()
			end
			move[i]=0
		else
			mSleep(300)
			con(i)
			anchorApp(i)
		end
		--[[i = i + 1--]]
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
		changeApp(i)
		if os.difftime(os.time(),time_table[i]) > 90  then
			closewin(1)
			break
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif isok[i]==1 then
			closewin()
			break	
		elseif DmFindPic('lianlu.bmp',85,378,63,391,79) then
			click(x,y)
		elseif DmFindPic('lianlu.bmp',85,378,63,391,79) == false and DmFindPic('bag.bmp',90,831,615,842,628) and DmFindPic('head.bmp',85,10,50,21,60) then	
			click(x,y)mSleep(500)			
			if DmFindPic('lianlu.bmp',85,378,63,391,79) then
				click(x,y)mSleep(1000)
			end
		elseif DmFindPic('qianghua.bmp',90,412,583,425,598) and isfr[i]==1 then
			click(x,y)			
		--确认在强化界面放入装备
		elseif DmFindPic('dalianlu.bmp',85,599,49,613,64) and (DmFindPic('gedengfazhang.bmp',85,540,333,551,342,i) or DmFindPic('gdfz.bmp',85,535,331,544,342,i)) then
			click(x,y)
			isfr[i]=1
		elseif DmFindPic('dalianlu.bmp',85,599,49,613,64) and find_Onequyu(0xA033C6,85,831,244,841,252) then
			click(x+20,y-20)
			isfr[i]=1			
		elseif DmFindPic('dalianlu.bmp',85,599,49,613,64) and find_Onequyu(0xA033C6,85,831,244,841,252)==false then
			isok[i]=1	
			closewin()		
		elseif DmFindPic('x_cailiao.bmp',90,752,79,766,89) then
			isok[i]=1
			closewin()
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y)  mSleep(300)			
		--竞技场
		elseif DmFindPic('x_jjc.bmp',85,591,248,601,258,i) then
			click(x,y)mSleep(300)		
		else
			mSleep(300)
			con(i)
		end
		--[[i = i + 1--]]
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
		changeApp(i)
		if os.difftime(os.time(),time_table[i]) > 90 then
--[[			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('kill'..':'..packagename[i])
			logDebug('uparc'..i..'超时')--]]
			closewin()
			break
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif isok[i]==1 then
			closewin()
			break		
		elseif DmFindPic('lianlu.bmp',85,378,63,391,79) then
			click(x,y)
		elseif DmFindPic('lianlu.bmp',85,378,63,391,79) == false and DmFindPic('bag.bmp',90,831,615,842,628) and DmFindPic('head.bmp',85,10,50,21,60) then	
			click(x,y)mSleep(500)			
			if DmFindPic('lianlu.bmp',85,378,63,391,79) then
				click(x,y)mSleep(1000)
			end
		elseif DmFindPic('x_cailiao.bmp',90,752,79,766,89) then
			isok[i]=1		
		elseif DmFindPic('qianghua.bmp',90,412,583,425,598) and isfr[i]==1 then
			click(x,y)				
		elseif find_Onequyu(0xAA36D7,85,833,358,842,369)==false and count[i]>2 then
			isok[i]=1
			closewin()
		--放入项链
		elseif DmFindPic('dalianlu.bmp',85,599,49,613,64) and find_Onequyu(0xAA36D7,85,833,358,842,369) then
			click(x+20,y-20)
			isfr[i]=1
		--确认在强化界面放入装备
		elseif DmFindPic('dalianlu.bmp',85,599,49,613,64)  and DmFindPic('shang.bmp',90,829,121,843,139) then
			myMove_UD(958,592,962,250,50)mSleep(1000)
			count[i]=count[i]+1
		--关闭福利窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			closewin()				
		else
			mSleep(300)
			con(i)
		end
		--[[i = i + 1--]]
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
		changeApp(i)
		if os.difftime(os.time(),time_table[1]) > 90 and os.difftime(os.time(),time_table[2]) > 90 then
			closewin()
			break
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif isok[1]==1 and isok[2]==1 then
			closewin()
			break
		elseif DmFindPic('x_cailiao.bmp',90,752,79,766,89) then
			isok[i]=1	
			closewin()			
		elseif DmFindPic('jingling.bmp',90,911,68,920,80) then
			click(x,y)
		elseif DmFindPic('jingling.bmp',90,911,68,920,80) == false and DmFindPic('bag.bmp',90,831,615,842,628) and DmFindPic('head.bmp',85,10,50,21,60) then	
			click(x,y)mSleep(500)		
			if DmFindPic('jingling.bmp',90,911,68,920,80) then
				click(x,y)
			end
		--猎取
		elseif DmFindPic('liequ.bmp',90,683,215,695,227) then
			click(x,y)
		elseif  --[[DmFindPic('mianfei.bmp',85,305,587,320,599)  and--]] DmFindPic('zhaohuan.bmp',90,364,597,381,614)  then
			click(x,y)
			--[[isok[i]=1--]]
			--[[closewin()--]]
--[[		--召唤一次
		elseif  DmFindPic('mianfei.bmp',85,305,587,320,599) ==false and DmFindPic('zhaohuan.bmp',90,364,597,381,614)  then
			click(x,y)--]]
		--确定
		elseif DmFindPic('zhaohuanqueding.bmp',85,896,586,913,600) then
			click(x,y)
		elseif DmFindPic('x_fuli.bmp',90,613,249,623,258,i) then
			click(x,y)  mSleep(300)				
		else
			mSleep(300)
			con(i)
		end
		i = i + 1
		if i > 2 then
			i =  1
		end
	end	
end

--是否还有恶魔凭证
function ishave()
	local i = 1
	logDebug('ishave')
	local time_table={os.time(),os.time()}	
	while true do
		changeApp(i)
		if os.difftime(os.time(),time_table[i]) > 120 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('ishave'..i..'超时')
			logDebug('kill'..':'..packagename[i])	
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)		
		elseif DmFindPic('huodong.bmp',85,732,151,746,159) then
			click(x,y)
		elseif DmFindPic('huodong.bmp',85,732,151,746,159) == false and DmFindPic('bag.bmp',90,831,615,842,628) and DmFindPic('head.bmp',85,10,50,21,60) then	
			click(x,y)
		elseif DmFindPic('emo.bmp',85,349,111,363,130) then
			click(315,178)
		elseif DmFindPic('hongzheng.bmp',85,210,216,232,238) or DmFindPic('3.bmp',80,504,438,515,458) then
			notifyMessage('meiyoule')
			closewin()
			return false
		elseif (DmFindPic('zheng.bmp',85,211,217,230,239) or DmFindPic('3.bmp',80,504,438,515,458) ==false) and DmFindPic('jrhd.bmp',85,942,587,959,601) then
			closewin()
			notifyMessage('haiyou')
			return true
		else
			mSleep(400)
			con()
		end
	end
end


--进入恶魔广场
function jinru()
	local i = 1
	logDebug('jinru')
	local time_table={os.time(),os.time()}	
	while true do
		changeApp(i)
		if os.difftime(os.time(),time_table[i]) > 120 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('jinru'..i..'超时')
			logDebug('kill'..':'..packagename[i])	
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)		
		elseif DmFindPic('huodong.bmp',85,732,151,746,159) then
			click(x,y)
		elseif DmFindPic('fbxx.bmp',85,1040,16,1055,31)	then
			logDebug('在恶魔广场了')
			break
		elseif DmFindPic('huodong.bmp',85,732,151,746,159) == false and DmFindPic('bag.bmp',90,831,615,842,628) and DmFindPic('head.bmp',85,10,50,21,60) then	
			click(x,y)
		elseif DmFindPic('emo.bmp',85,349,111,363,130) then
			click(315,178)
		--领取奖励
		elseif DmFindPic('lqjl.bmp',85,527,568,543,581) then
			click(x,y)			
		elseif (DmFindPic('hongzheng.bmp',85,210,216,232,238) or DmFindPic('3.bmp',80,504,438,515,458)) and DmFindPic('jrhd.bmp',85,942,587,959,601) then
			return false
		elseif (DmFindPic('zheng.bmp',85,211,217,230,239) or DmFindPic('3.bmp',80,504,438,515,458) ==false) and DmFindPic('jrhd.bmp',85,942,587,959,601) then			
			click(x,y)
			local tt = os.time()
			while os.difftime(os.time(),tt) < 4 do
					closewin()
			end	
			logDebug('按时间进入恶魔广场完成')	
			return true
		else
			mSleep(400)
			con()
		end
	end	
end

--是否能进古战场
function allow()
	local i = 1
	nowifi = 0
	local count = 0
	local dd = 0
	local time_table={os.time(),os.time()}	
	local isgu={0,0}
	local notubiao={0,0}
	local isallow={0,0}
	logDebug('allow')
	while true do
		changeApp(i)
		if os.difftime(os.time(),time_table[i]) > 120 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('allow'..i..'超时')
			logDebug('kill'..':'..packagename[i])
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		--屏蔽其他玩家
		elseif DmFindPic('eye.bmp',90,1035,216,1045,227) then
			clickone(x,y)  			
		--误点天使圣殿
		elseif DmFindPic('tian.bmp',90,782,118,792,128) and DmFindPic('x_richang.bmp',90,1096,41,1110,54) then
			click(x,y)			
		--卡屏
		elseif dd > 10 then
			return 0
		elseif isgu[1]==1 and isgu[2] == 1 then
			return 3
		elseif DmFindPic('map_gu.bmp',85,1012,18,1026,32) then
			isgu[i] = 1
--[[			return 3--]]
		elseif DmFindPic('huodong.bmp',85,732,151,746,159) then
			click(x,y)
			dd = dd + 1
		--活动图标都没出来，暂时不够进入古战场的等级
		elseif notubiao[1]==1 and notubiao[2] == 1 then
			return 0
		elseif count > 5 or (DmFindPic('huodong.bmp',90,732,151,746,159) == false and DmFindPic('gongneng.bmp',90,819,62,832,75)  and DmFindPic('bag.bmp',90,831,615,842,628)) then
			notubiao[i]=1
--[[			return 0--]]
		elseif DmFindPic('huodong.bmp',85,732,151,746,159) == false and DmFindPic('bag.bmp',90,831,615,842,628) and DmFindPic('head.bmp',85,10,50,21,60) then	
			click(x,y)
		elseif DmFindPic('dahuodong.bmp',90,593,46,607,60) and DmFindPic('guzc.bmp',85,115,398,134,413) then
			click(x,y)
			count = count + 1
		--立即进入，两个都可以进
		elseif isallow[1]== 1 and isallow[2] == 1 then
			return 1
		elseif isallow[i] == 1 then
			closewin()
			--有一个窗口可以了
		elseif DmFindPic('jinguzc.bmp',90,965,582,975,598) and DmFindPic('over.bmp',90,382,576,406,594) == false then
			isallow[i]=1	
			closewin()
--[[			return 1	--]]
		--立即进入，有一个时间完了,不打换号
		elseif isallow[1] == 2 or isallow[2] == 2 then
			return 2
		elseif DmFindPic('jinguzc.bmp',90,965,582,975,598) and DmFindPic('over.bmp',90,382,576,406,594) then
			isallow[i]=2
			closewin()
		--任务对话窗口
		elseif DmFindPic('x_dialog.bmp',90,1004,222,1017,236) then
			click(x,y) mSleep(500)
		--关闭福利窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y)
		elseif DmFindPic('x_ditu.bmp',90,617,243,625,252,i) then
			click(x,y)
		else
			mSleep(300)
			con(i)
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
	appRun(packagename[i])mSleep(2000)
	while true do
		if os.difftime(os.time(),tt) > 120 then
			appKill(packagename[i])
			tt=os.time()
			logDebug('buy'..i..'超时')
			logDebug('kill'..':'..packagename[i])
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif DmFindPic('bag.bmp',90,831,615,842,628) then
			click(x,y)  pack(i) mSleep(1500)
		elseif DmFindPic('person.bmp',90,590,44,605,57) and DmFindPic('huobi.bmp',90,75,222,91,238) then
			click(x,y)
		elseif DmFindPic('zsqianwang.bmp',90,975,389,995,402) then
			click(x,y)
		elseif DmFindPic('empz.bmp',75,380,139,413,539) then
			click(x,y)
		elseif count > 4 then
			closewin()
			count = 0
		elseif DmFindPic('bzlei.bmp',90,776,103,794,116) then
			myMove_UD(652,520,646,350,20)mSleep(1000)
			count = count + 1
		elseif DmFindPic('gmhong.bmp',90,820,458,834,473) then--638,417
			click(x-180,y-50)mSleep(300)
			click(x-180,y-50)mSleep(300)
			click(x,y)
			closewin()
			logDebug('恶魔凭证购买完成'..i)
			break
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(500)					
		else
			mSleep(300)
			anchorApp(i)
			con(i)
		end
	end
end

--买药
function potion()
	local count = 1
	local i = 1
	nowifi = 0
	local tt = os.time()

	logDebug('potion')
	while i<3 do
		changeApp(i)
		if os.difftime(os.time(),tt) > 120 then
			appKill(packagename[i])
			tt=os.time()
			logDebug('potion'..i..'超时')
			logDebug('kill'..':'..packagename[i])		
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	
		elseif DmFindPic('bag.bmp',90,831,615,842,628) then
			click(x,y)  pack(i) mSleep(1500)
		elseif DmFindPic('person.bmp',90,586,44,602,56) and DmFindPic('huobi.bmp',90,74,225,91,238) then
			click(x,y)
		elseif DmFindPic('jbqianwang.bmp',90,975,215,990,230) then
			click(x,y)
		elseif count > 2 then
			logDebug('买药完成')
			break
		elseif count < 2 and DmFindPic('hong.bmp',90,369,163,381,174) then
			click(x,y)
		elseif count < 3 and DmFindPic('lan.bmp',90,372,266,386,277) then
			click(x,y)
		elseif DmFindPic('zuida.bmp',90,729,409,742,422) then
			click(x,y)mSleep(100)
			if DmFindPic('gmhong.bmp',90,821,464,835,476) then
				click(x,y)
				count = count + 1
			end
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(500)					
		else
			mSleep(100)
			con(i)
		end
		--[[i = i + 1--]]
		if i > 2 then
			i =  1
		end				
	end
end

--根据时间判断
function emtime()
	local tt = os.date('*t',t)
	local mins = tt.min
	local sec = tt.sec
	return mins,sec
end

--恶魔广场
function emgc()
	local i = 1
	local isboss= 0 
	local bosstime=os.time()
	local isguwu=0
	local start=os.time()
	logDebug('emgc')
	while true do
		changeApp(i)
		local sj,ms = emtime()
		--连接断开立即重连与立即刷新
		if DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)		
		--领取奖励
		elseif DmFindPic('lqjl.bmp',85,527,568,543,581) then
			click(x,y)
		--屏蔽其他玩家
		elseif DmFindPic('eye.bmp',90,1035,216,1045,227) then
			clickone(x,y) 	
		--每个小时的恶魔时间
		elseif ((sj == 15 or sj == 45) and ms>30 ) and DmFindPic('fbxx.bmp',85,1040,16,1055,31)==false and DmFindPic('bag.bmp',90,831,615,842,628) then
			if jinru() == false then
				break
			end
			isboss = 0
		--出现恶魔广场字样
		elseif DmFindPic('bag.bmp',90,831,615,842,628) and (DmFindPicFuzzy('emgc.bmp',85,526,538,550,561,0xffffff) --[[or DmFindPicFuzzy('emgc1.bmp',85,514,539,533,559,0xffffff)--]])then
			click(x,y)
		elseif (DmFindPic('hongzheng.bmp',85,210,216,232,238) or DmFindPic('3.bmp',80,504,438,515,458)) and DmFindPic('jrhd.bmp',85,942,587,959,601) then
			closewin()
			break
		--进入恶魔广场
		elseif DmFindPic('zheng.bmp',85,211,217,230,239) and DmFindPic('jrhd.bmp',85,942,587,959,601) then
			click(x,y)
			isguwu = 0
			isboss= 0 
			bosstime=os.time()
					logDebug(i..'进入恶魔广场')	
					local tt = os.time()
					while os.difftime(os.time(),tt) < 4 do
						closewin()
					end			
		-- 被打死了							
		elseif DmFindPic('hcfh.bmp',90,505,369,521,380) then
			click(x,y)		
		--进入恶魔广场开始挂机
		elseif isboss == 0 and DmFindPic('fbxx.bmp',85,1040,16,1055,31) and DmFindPic('ksgj.bmp',85,947,464,958,476) then
			click(x,y)
		--找到金属巴洛克之后取消挂机
		elseif isboss == 0 and DmFindPic('bag.bmp',90,831,615,842,628) and DmFindPic('baluoke.bmp',90,330,48,360,62) and DmFindPic('quxiaoguaji.bmp',85,945,465,959,478) then
			isboss = 1
			bosstime = os.time()
			logDebug('boss出现')		
		--boss出现之后鼓舞
		elseif isboss ==  1 and DmFindPic('guwu.bmp',85,952,370,960,381) and isguwu==0 then
			click(x,y)
			isguwu = 1
		elseif DmFindPic('guwulv.bmp',85,546,420,558,432) then
			click(x,y)mSleep(1000)
			if DmFindPic('quxiaoguaji.bmp',85,945,465,959,478) then
				click(x,y)
			end			
		--已经有鼓舞了
		elseif DmFindPic('guwuquxiao.bmp',85,638,393,653,404) then
			click(x,y)
		elseif isboss== 1 and DmFindPic('fbxx.bmp',85,1040,16,1055,31) and DmFindPic('bag.bmp',90,831,615,842,628) then
			if DmFindPic('quxiaoguaji.bmp',85,945,465,959,478) then
				click(x,y)
			end	
			if DmFindPic('diyuhuo.bmp',85,1064,351,1078,363) then
				click(x,y)mSleep(500)
			end
			if DmFindPic('jiguang.bmp',85,1067,445,1083,458) then
				click(x,y)mSleep(500)
			end
			if DmFindPic('heilongbo.bmp',85,949,559,964,571) then
				click(x,y)mSleep(1500)
			end
			if os.difftime(os.time(),bosstime) > 80 then
				movebyround(157,527,2,30,1,3)mSleep(500)
				touchDown(0,63,526)
				mSleep(1000)
				touchUp(0)
				bosstime = bosstime - 10
			end		
		--打完了
		elseif os.difftime(os.time(),start) > 120 and DmFindPic('fbxx.bmp',85,1040,16,1055,31)==false and DmFindPic('bag.bmp',90,831,615,842,628) then
			if ishave() == false then
				logDebug('恶魔广场次数或者凭证不够')
				break
			end
			start = os.time()
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(500)					
		else
			mSleep(300)
			con(i)
		end
	end
end


--进入古战场
function battle()
	local i = 1
	nowifi = 0
	local zb = {{440,209},{416,217},{368,253},{364,284},{329,308},{376,383},{418,427},{458,436},{489,483},{540,437},{595,370},{481,253},{524,267},{497,299},{537,309}}
	local ismove1= {0,0}
	local isok={0,0}
	local isem={0,0}
	local beibao ={os.time(),os.time()}
	local guwutt = {os.time(),os.time()}
	local ft = {os.time(),os.time()}
	local isboss={0,0}
	local count={0,0}
	local bosstime={os.time(),os.time()}
	local isfinish = {0,0}
	logDebug('battle')
	while (i<3) do
		changeApp(i)
		math.randomseed(tostring(os.time()):reverse():sub(1,6))		
		if os.difftime(os.time(),ft[i]) > 360 then
			appKill(packagename[i])
			ft[i]=os.time()
			logDebug('battle'..i..'超时')
			logDebug('kill'..':'..packagename[i])	
		--屏蔽其他玩家
		elseif DmFindPic('eye.bmp',90,1035,216,1045,227) then
			clickone(x,y) 			
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	
			ismove1[i]=0
		elseif isfinish[1]==1 and isfinish[2]==1 then
			break
		elseif DmFindPic('over.bmp',90,382,576,406,594) then			
			isfinish[i]=1
			closewin()
		elseif os.difftime(os.time(),beibao[i]) > 480 and DmFindPic('bag.bmp',90,831,615,842,628) then
			bag(i)
			beibao[i]=os.time()
		--地图不见了
		elseif DmFindPic('daosanjiao.bmp',90,1118,17,1128,29) then
			click(x,y)
		--误点天使圣殿
		elseif DmFindPic('tian.bmp',90,782,118,792,128) and DmFindPic('x_richang.bmp',90,1096,41,1110,54) then
			click(x,y)		
		--防止多次点击
		elseif DmFindPic('hongempz.bmp',90,84,347,91,354,i)==false and DmFindPic('jrhd.bmp',90,916,599,931,609) then
			click(x+10,y+10)mSleep(1500)
			ismove1[i]=0		
			logDebug(i..'进入恶魔广场')	
			local tt = os.time()
			while os.difftime(os.time(),tt) < 4 do
				closewin()
			end				
		-- 被打死了							
		elseif DmFindPic('hcfh.bmp',90,505,369,521,380) then
			click(x,y)	
			ft[i]=os.time()
		--领取补偿
		elseif DmFindPic('huoqu.bmp',80,878,468,889,485) then
			clickone(x+20,y+10)	
		elseif DmFindPic('buchang.bmp',80,929,293,942,308) then
			clickone(x,y) 
		--已经有鼓舞了 取消
		elseif DmFindPic('guwuquxiao.bmp',85,632,399,645,412) then
			click(x,y)
			ft[i]=os.time()
		--使用鼓舞
		elseif os.difftime(os.time(),guwutt[i]) > 120 and DmFindPic('fbxx.bmp',90,1000,20,1010,33) and DmFindPic('guwu.bmp',90,948,341,960,353) then
			click(x,y)
			guwutt[i] = os.time()
			ft[i]=os.time()
		--弹出鼓舞确定
		elseif DmFindPic('guwulv.bmp',85,544,423,558,435) then
			click(x,y) 			
			ft[i]=os.time()
		--boss打完了
		elseif DmFindPic('lqjl.bmp',90,525,571,538,585) then
			click(x,y)	 ismove1[i]=0				
		--找到金属巴洛克之后取消挂机
		elseif isboss[i] == 0 and DmFindPic('bag.bmp',90,831,615,842,628) and DmFindPic('baluoke.bmp',90,340,48,359,62) and DmFindPic('quxiaoguaji.bmp',85,947,472,959,483) then
			click(x,y)
			isboss[i] = 1
			bosstime[i] = os.time()
			logDebug('boss出现')
		elseif isboss[i] == 1 and  DmFindPic('fbxx.bmp',90,1000,20,1010,33) and DmFindPic('bag.bmp',90,831,615,842,628) then
			if DmFindPic('diyuhuo.bmp',85,1061,353,1073,363) then
				click(x,y)mSleep(500)
				--[[ft[i]=os.time()--]]
			end
			if DmFindPic('jiguang.bmp',85,1061,444,1075,457) then
				click(x,y)mSleep(500)
				--[[ft[i]=os.time()--]]
			end
			if DmFindPic('heilongbo.bmp',85,949,555,962,568) then
				click(x,y)mSleep(1500)
				--[[ft[i]=os.time()--]]
			end
			if os.difftime(os.time(),bosstime[i]) > 120 then
				movebyround(153,521,1.5,30,0,3)mSleep(500)
				touchDown(0,50,524)
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
--[[		elseif DmFindPicFuzzy('emgc1.bmp',90,515,537,533,557,0xffffff)  and DmFindPic('likai.bmp',85,908,38,921,49) then
			click(x,y)logDebug('离开古战场去恶魔')
			mSleep(1500)	--]]	
		--开启挂机
		elseif ismove1[i] == 1 and DmFindPic('xunlu.bmp',90,521,162,531,173) == false and DmFindPic('map_gu.bmp',85,1012,18,1026,32) and  DmFindPic('ksgj.bmp',85,950,467,961,480) then
			click(x,y)					
--[[		elseif DmFindPic('map_gu.bmp',85,1012,18,1026,32)==false and DmFindPicFuzzy('emgc1.bmp',90,515,537,533,557,0xffffff) then
			click(x,y)mSleep(1000)
			local tt =os.time()
			while os.difftime(os.time(),tt)<4 do
				if DmFindPic('hongempz.bmp',90,84,347,91,354,i)==false and DmFindPic('jrhd.bmp',90,916,599,931,609) then
					click(x+10,y+10)
					guwutt[i] = os.time()
					ismove1[i]=0		
					logDebug(i..'进入恶魔广场')	
					local tt = os.time()
					while os.difftime(os.time(),tt) < 4 do
						closewin()
					end
				end					
			end
			ft[i]=os.time()--]]
		--找不到古战场找得到活动则打开活动		
		elseif DmFindPic('map_gu.bmp',85,1012,18,1026,32)==false and DmFindPic('huodong.bmp',85,732,151,746,159) then--419,300
			click(x+10,y-8) 
		--判断是否有恶魔凭证
		elseif DmFindPic('richang.bmp',90,280,239,289,248,i) and DmFindPic('hongempz.bmp',90,84,347,91,354,i) then
			closewin(i)
			buy(i)
		--副本信息进入恶魔开始挂机	
		elseif isboss[i] == 0 and DmFindPic('fbxx.bmp',90,1000,20,1010,33) and DmFindPic('ksgj.bmp',85,950,467,961,480) then
			click(x,y) 
		--恶魔广场完结					
		elseif (DmFindPicFuzzy('exp.bmp',90,838,434,892,539,0xffffff) or DmFindPicFuzzy('exp1.bmp',90,850,430,897,528,0xffffff) )and DmFindPic('bag.bmp',90,831,615,842,628) then
			ft[i]=os.time()
		elseif DmFindPic('xunlu.bmp',90,521,162,531,173) then			
			ismove1[i]= 1
			isboss[i] = 0
		--挂机
		elseif isok[1]==1 and isok[2]==1 and isem[1]==0 then
			other()
			isem[1]=1
			ft[i]=os.time()		
		elseif DmFindPic('zhandou.bmp',90,520,163,532,174) then
			isok[i]=1
		--都在古战场了 
		elseif ismove1[i] == 0 and DmFindPic('map_gu.bmp',85,1012,18,1026,32) then--587,299
			click(x,y+160) 
			isboss[i] = 0
		--古战场里面走路
		elseif DmFindPic('daditu.bmp',90,595,50,611,63) and DmFindPic('quyu.bmp',90,69,327,78,335,i) then	
			click(x,y) 
		--确认打开小地图了
		elseif DmFindPic('daditu.bmp',90,595,50,611,63) and DmFindPic('quyuliang.bmp',90,110,183,124,195) then
			local xx = zb[math.random(1,15)]
			click(xx[1],xx[2])
			ismove1[i] = 1
			mSleep(1500)
			closewin(i)
		elseif DmFindPic('map_gu.bmp',85,1012,18,1026,32)==false and 
				DmFindPic('huodong.bmp',85,732,151,746,159) == false and 
				DmFindPic('bag.bmp',90,831,615,842,628) and 
				DmFindPic('head.bmp',85,10,50,21,60) then	
			click(x,y)mSleep(1000)
		elseif DmFindPic('dahuodong.bmp',90,593,46,607,60) and DmFindPic('guzc.bmp',85,115,398,134,413) then
			click(x,y)
		--立即进入
		elseif DmFindPic('chang.bmp',90,116,395,134,412) and DmFindPic('dahuodong.bmp',90,593,46,607,60) and DmFindPic('jinguzc.bmp',90,965,582,975,598) then
			click(x,y) mSleep(500)
			ismove1[i] = 0
			local tt = os.time()
			while os.difftime(os.time(),tt) <4 do
				closewin()
			end
			ft[i]=os.time()
		--确定
		elseif DmFindPic('zhaohuanqueding.bmp',85,896,586,913,600) then
			click(x,y)			
			closewin()
		elseif DmFindPic('x_jingling.bmp',85,1087,42,1101,58) then
			click(x,y)
		--点到天使神殿的声望
		elseif DmFindPic('x_shengwang.bmp',85,796,160,812,173) then
			click(x,y+5)
		--药品
		elseif DmFindPic('x_yaoping.bmp',85,800,99,817,111) then
			click(x,y)
		--召唤宠物面板
		elseif DmFindPic('x_pet.bmp',85,1100,35,1112,50) then
			click(x,y)
			closewin()			
		--人物栏窗口关闭
		elseif DmFindPic('x_person.bmp',90,1095,36,1112,52) then
			click(x,y) mSleep(500)
		--竞技场界面	
		elseif DmFindPic('x_jjc.bmp',85,1045,51,1059,63) then
			click(x,y)			
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(500)
		else
			mSleep(300)
			con(i)
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
	local isfinish={0,0}
	logDebug('exit')	
	while (i<3) do
		changeApp(i)
		if DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	
		elseif os.difftime(os.time(),tt[i]) > 180 	then
			appKill(packagename[i])
			tt[i]=os.time()
			logDebug('exit'..i..'超时')
			logDebug('kill'..':'..packagename[i])	
		elseif DmFindPic('fhdl.bmp',90,527,227,540,239) then
			click(x,y)
		elseif isfinish[i]==1 then
			modifyTxt(i)		
			break
		elseif DmFindPic('qhzh.bmp',90,252,497,266,508) then
			isfinish[i]=1
		--已经交易了
		elseif DmFindPic('quxiao.bmp',85,637,425,649,439)  then
			click(x,y)
		elseif DmFindPic('xtsz.bmp',90,855,166,869,181) then
			click(x,y)
		elseif DmFindPic('tuichu.bmp',90,370,168,386,179) then
			click(x,y)
		elseif DmFindPic('gongneng.bmp',90,819,62,832,75) then
			click(x,y)
		elseif DmFindPic('huodong.bmp',85,732,151,746,159) == false and DmFindPic('bag.bmp',90,831,615,842,628) and DmFindPic('head.bmp',85,10,50,21,60) then	
			click(x,y)
			mSleep(500)	
		--换行
		elseif DmFindPic('huanhang.bmp',90,967,605,987,623) or DmFindPic('return.bmp',80,953,594,982,616) then
			click(x,y)		
		--登录异常
		elseif DmFindPic('dlyc.bmp',90,542,490,553,502) then
			click(x,y)			
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(500)				
		--聊天窗口
		elseif DmFindPic('x_liaotian.bmp',90,1104,28,1117,41) then
			click(x,y)
		else
			mSleep(300)
		end
		--[[i = i + 1--]]
		if i > 2 then
			i =  1
		end		
	end	
end

function exitone(i)
	nowifi = 0
	local dlx = 0
	local tt = {os.time(),os.time()}
	local isfinish={0,0}
	logDebug('exit')	
	while (i<3) do
		changeApp(i)
		if DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	
		elseif os.difftime(os.time(),tt[i]) > 180 	then
			appKill(packagename[i])
			tt[i]=os.time()
			logDebug('exitone'..i..'超时')
			logDebug('kill'..':'..packagename[i])	
		elseif DmFindPic('fhdl.bmp',90,526,239,543,253) then
			click(x,y)
		elseif isfinish[i]==1 then	
			break
		elseif DmFindPic('qhzh.bmp',90,252,497,266,508) then
			isfinish[i]=1
		--已经交易了
		elseif DmFindPic('quxiao.bmp',85,636,435,653,447)  then
			click(x,y)
		elseif DmFindPic('xtsz.bmp',90,855,166,869,181) then
			click(x,y)
		elseif DmFindPic('tuichu.bmp',90,372,172,388,187) then
			click(x,y)
		elseif DmFindPic('gongneng.bmp',90,819,62,832,75) then
			click(x,y)
		elseif DmFindPic('huodong.bmp',85,732,151,746,159) == false and DmFindPic('bag.bmp',90,831,615,842,628) and DmFindPic('head.bmp',85,10,50,21,60) then	
			click(x,y)
			mSleep(500)	
		--换行
		elseif DmFindPic('huanhang.bmp',90,967,605,987,623) or DmFindPic('return.bmp',80,953,594,982,616) then
			click(x,y)		
		--登录异常
		elseif DmFindPic('dlyc.bmp',90,542,490,553,502) then
			click(x,y)			
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(500)				
		--聊天窗口
		elseif DmFindPic('x_liaotian.bmp',90,1104,28,1117,41) then
			click(x,y)
		else
			mSleep(300)
		end
	end	
end

function changeApp(i)
	if appRunning(packagename[i]) then
		appRun(packagename[i]) mSleep(1000)
	else
		appRun(packagename[i])mSleep(10000)
	end	
end

function anchorApp(i)
	if appRunning(packagename[i]) == false then
		appRun(packagename[i]) mSleep(10000)
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
	local isfinish={0,0}
	local time_table={os.time(),os.time()}
	while i<3 do
		changeApp(i)
		if os.difftime(os.time(),time_table[i]) > 90 then
			appKill(packagename[i])				
			time_table[i]=os.time()
			logDebug('kill'..':'..packagename[i])				
			logDebug('bingfenggu'..i..'超时')
			break
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	
		elseif DmFindPic('xunlu.bmp',90,521,162,531,173) then		
		
		elseif isfinish[i]==1 then
			closewin()
			break
		--到莱亚了
		elseif DmFindPic('x_fuliguan.bmp',90,1002,218,1016,234) then	
			click(x,y)
			isfinish[i]=1
		--地图不见了
		elseif DmFindPic('daosanjiao.bmp',90,1110,19,1122,29) then
			click(x,y+5)
		--走到莱亚
		elseif DmFindPic('daditu.bmp',90,595,55,614,64) and (DmFindPic('laoban.bmp',90,853,527,867,542) or DmFindPic('laoban1.bmp',85,853,421,870,439)) then
			click(x,y+10)mSleep(500)
			isbfg[i] = 1
			--[[closewin()--]]
		elseif DmFindPic('yongzhe.bmp',90,1021,17,1037,29) == false and DmFindPic('sanjiao.bmp',90,1113,21,1123,31) then--1036,129
			click(x-80,y+100)
		elseif DmFindPic('daditu.bmp',90,595,55,614,64) and DmFindPic('sjdt.bmp',90,51,100,64,115) and isbfg[i] == 0 then
			click(x,y)
		--传送到冰风谷
		elseif DmFindPic('yzdl.bmp',90,488,332,499,344) then
			click(x,y)
		--冰风谷走路
		elseif DmFindPic('yongzhe.bmp',90,1021,17,1037,29) and DmFindPic('sanjiao.bmp',90,1113,21,1123,31) then--588,298
			click(x-80,y+100)
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(500)			
		else
			mSleep(300)
			con(i)
		end
		--[[i = i + 1--]]
		if i > 2 then
			i =  1
		end				
	end
end



--交易物品
function dealbysayone()
	local isdeal={0,0}
	nowifi = 0
	local say={0,0}
	local tt = {os.time(),os.time()}
	local i = 1
	local isfinish={0,0}
	logDebug('dealbysay'..i)
	while i<3 do
		changeApp(i)
		if DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)		
		elseif os.difftime(os.time(),tt[i]) > 240 then
			closewin()
			break
		elseif DmFindPic('liaotian.bmp',90,757,591,778,601) then
			click(x,y)
		elseif isfinish[i]==1 then
			closewin()
			break
		elseif  DmFindPic('deal.bmp',90,432,572,446,584) == false and isdeal[i]>=2 then
			isfinish[i]=1
		--密语	
		elseif DmFindPic('fasong.bmp',90,966,585,978,598) and say[i] == 0 then--808,595
			click(x-160,y+8)mSleep(1000)
			local name = getName()
			inputText("/"..name.." 在")
			say[i] = 1
		--换行
		elseif DmFindPic('huanhang1.bmp',85,965,601,985,617) or DmFindPic('return1.bmp',85,955,598,981,613) then
			click(x,y)		
		elseif DmFindPic('huanhang.bmp',90,967,605,987,623) or DmFindPic('return.bmp',80,953,594,982,616) then
			click(x,y)
		--发送密语
		elseif DmFindPic('fasong.bmp',90,966,585,978,598) and say[i]  == 1 and isdeal[i] == 0 then
			click(x,y)
			say[i]=0
		--已经交易了
		elseif DmFindPic('quxiao.bmp',85,637,425,649,439) and isdeal[i] > 1 then
			click(x,y)
			closewin(i)
		--弹出交易提示
		elseif DmFindPic('jiaoyitishi.bmp',90,462,428,475,441) then
			click(x,y)
		--交易界面弹出来
		elseif DmFindPic('jiaoyi.bmp',90,600,51,614,65) then
			--开始放东西
			if DmFindPic('jiaoyi.bmp',90,600,51,614,65) and isdeal[i] ==0 then
				--放入晶石
				give(i)
				give(i)
				--放入金币
				if money(i) then
					isdeal[i]=1
				end
			--锁定
			elseif DmFindPic('suoding.bmp',90,147,574,160,589) and isdeal[i] >= 1 then
				click(x,y)
			--交易
			elseif DmFindPic('deal.bmp',90,428,575,443,588) and isdeal[i]>=1 then
				click(x,y)
				isdeal[i] = isdeal[i] + 1
				say[i]=1
			else
				mSleep(300)
			end
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(300)		 
		else
			mSleep(300)
			con(i)		
		end
--[[		if i > 2 then
			i =  1
		end--]]
	end
end

--交易物品
function dealbysaytwo(i)
	local isdeal={0,0}
	nowifi = 0
	local say={0,0}
	local tt = {os.time(),os.time()}
--[[	local i = 1--]]
	local isfinish={0,0}
	logDebug('dealbysay'..i)
	appRun(packagename[i])mSleep(2000)
	while true do
		if DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)		
		elseif os.difftime(os.time(),tt[1]) > 300 or os.difftime(os.time(),tt[2]) > 300 then
			exitone(i)
			break
		--已经交易了
		elseif DmFindPic('quxiao.bmp',85,636,435,653,447) and isdeal[i] > 1 then
			click(x,y)
			closewin(i)			
		elseif os.difftime(os.time(),tt[i]) > 240 then
			closewin()
		elseif DmFindPic('liaotian.bmp',90,757,591,778,601) then
			click(x,y)
		elseif isfinish[i]==1 then
			exitone(i)
			break
		elseif  DmFindPic('deal.bmp',90,432,572,446,584) == false and isdeal[i]>=2 then
			isfinish[i]=1
		--密语	
		elseif DmFindPic('fasong.bmp',90,968,587,981,602) and say[i] == 0 then--808,595
			click(x-160,y+8)mSleep(1000)
			local name = getName()
			inputText("/"..name.." 在")
			say[i] = 1
		--换行
		elseif DmFindPic('huanhang1.bmp',85,965,601,985,617) or DmFindPic('return1.bmp',85,955,598,981,613) then
			click(x,y)		
		elseif DmFindPic('huanhang.bmp',90,967,605,987,623) or DmFindPic('return.bmp',80,953,594,982,616) then
			click(x,y)
		--发送密语
		elseif DmFindPic('fasong.bmp',90,968,587,981,602) and say[i]  == 1 and isdeal[i] == 0 then
			click(x,y)
			say[i]=0
		--弹出交易提示
		elseif DmFindPic('jiaoyitishi.bmp',90,463,431,476,446) then
			click(x,y)
		--交易界面弹出来
		elseif DmFindPic('jiaoyi.bmp',90,596,49,617,64) then
			--开始放东西
			if DmFindPic('jiaoyi.bmp',90,596,49,617,64) and isdeal[i] ==0 then
				--放入晶石
				give(i)
				give(i)
				--放入金币
				if money(i) then
					isdeal[i]=1
				end
			--锁定
			elseif DmFindPic('suoding.bmp',90,189,567,203,582) and isdeal[i] >= 1 then
				click(x,y)
			--交易
			elseif DmFindPic('deal.bmp',90,432,572,446,584) and isdeal[i]>=1 then
				click(x,y)
				isdeal[i] = isdeal[i] + 1
				say[i]=1
			else
			end
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(300)		 
		else
			mSleep(300)
			con(i)		
			anchorApp(i)
		end
--[[		i = i + 1
		if i > 2 then
			i =  1
		end--]]
	end
end

--获取收钱号角色名
function getName()
	local file,file1,l,a1,a2,sname,ourline
	file = io.open("/var/touchelf/scripts/收钱名.txt","r")
	file1 = io.open("/var/touchelf/scripts/area.txt","r")
	ourline = file1:read()
	
	for l in file:lines() do  
		local list = Split(l,",")
		a1=list[1]
		a2=list[2]	
		if ourline==a1 then 
			sname=a2	
		break
		end
	end 	
	file:close()
	file1:close()
	return sname
end
-----------------------------------------------------------给金币
function money(i)
	local fier,yans=1,1
	while (true) do
		--连接断开立即重连与立即刷新
		if DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)		
		elseif yans>=30 then 
			notifyMessage('钱给完了')
			logDebug('钱给完了'..i)
			return false
		elseif  DmFindPic('deal.bmp',90,428,575,443,588)  and fier==2 then 
			logDebug('钱给完了'..i)
			return true
		--换行
		elseif DmFindPic('huanhang1.bmp',85,965,601,985,617) or DmFindPic('return1.bmp',85,955,598,981,613) then
			click(x,y)		
			fier=2			
		elseif DmFindPic('huanhang.bmp',90,967,605,987,623) or DmFindPic('return.bmp',80,953,594,982,616) then
			click(x,y)
			fier=2
		elseif  DmFindPic('deal.bmp',90,428,575,443,588)  then --518,372
			click(531,371)mSleep(1000)
			inputText("11111111")
			mSleep(300)
		elseif DmFindPic("x_jingshi.bmp",80,800,140,815,152) or DmFindPic("x_jingshi1.bmp", 80,799,103,811,116) then
			click(x+3,y+3)	
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(300)				
		else
			mSleep(100)			
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
		if DmFindPic('dxl.bmp',90,512,422,521,431)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
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
		--658,172,668,178  --751,172,761,178
		--658,264,669,270
		--x方向公差93
		--y方向公差93
		if find_Onequyu(0x9433B8,85,658+a*93,172+b*93,668+a*93,178+b*93)then 
			click(x+20,y-20)
			wz=wz+1
			nz=2
		else
			wz=wz+1
			nz=1
		end
		if nz==2 then 
			if DmFindPic("fangru.bmp", 80,822,326,832,340) or DmFindPic("fangru1.bmp", 80,823,314,833,324) or DmFindPic('fangru2.bmp',80,819,288,833,298) or DmFindPic('fangru3.bmp',80,822,275,834,285) then
				click(x,y)
			elseif DmFindPic("x_jingshi.bmp",80,800,140,815,152) or DmFindPic("x_jingshi1.bmp", 80,799,103,811,116) then
				click(x+5,y+5)
			elseif DmFindPic('x_weizhi.bmp',90,1095,40,1109,53) then
				click(x,y)				
			end
		end 
		--关闭福利窗口/日常/日常活动窗口
		if DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(300)		
		elseif DmFindPic('x_weizhi.bmp',90,1095,40,1109,53) then
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
	if DmFindPic('simcard.bmp',80,320,612,347,645) then
		click(x,y)			
	elseif DmFindPic('cuowu.bmp',90,548,228,563,240) and DmFindPic('qhzh.bmp',90,252,497,266,508) and DmFindPic('ljsb.bmp',90,637,435,652,447)  then
		logDebug('ljsb_con')	
		click(x,y)
--[[		local file,l,f,jiy,peny,ourline
		file = io.open("/var/touchelf/scripts/avf"..i..".txt","r")
		ourline = tonumber(file:read())		
		delete(ourline,i)		--]]	
		appKill(packagename[i])
	--用户在线
	elseif DmFindPic('yhzx.bmp',90,360,463,368,472,i) then	
		click(x,y)		logDebug('yhzx')
	elseif DmFindPic('rename_sure.bmp',90,637,433,650,445)	then
		click(x,y)  logDebug('baochishuju')
	--切换账号
	elseif DmFindPic('qhzh.bmp',90,252,497,266,508) then
		reload(i)
	elseif DmFindPic('jin.bmp',90,840,501,851,513) then
		click(x,y)	 logDebug('jin')
	elseif DmFindPic('jinru.bmp',90,546,577,560,588) then
		click(x,y) logDebug('jinru')
	--选择服务器
	elseif DmFindPic('x_xzfwq.bmp',90,990,30,1006,45) then
		click(x,y) logDebug('x_xzfwq')
	--公告
	elseif DmFindPic('x_gonggao.bmp',85,1023,47,1037,62) then
		click(x,y)
	--登录异常
	elseif DmFindPic('dlyc.bmp',90,542,490,553,502) then
		click(x,y)
	--封号确定
	elseif DmFindPic('fenghaoqueding.bmp',90,539,488,553,500)  then
		click(x,y)
	--登录按钮
	elseif DmFindPic('x_load.bmp',85,1067,29,1084,43) then
		click(x,y)
	elseif DmFindPic('denglu.bmp',90,840,292,854,307) then 		
		click(x,y) logDebug('denglu')
	--领取恶魔广场奖励
	elseif DmFindPic('lqjl.bmp',90,525,571,538,585) then
		click(x,y)	logDebug('lqjl')	 
	--切屏出现登录界面延迟
	elseif DmFindPic('zhwk.bmp',90,544,363,605,412) then
		click(x,y)
	else
		mSleep(200)
		--[[restoreAvf()--]]
	end
end

function isMoving()
	local a,b,c,fig
	fig=1
	a = getColor(371,40)
	b = getColor(249,439)
	c = getColor(849,496)
	mSleep(300);
	fig=fig+1
	if  DmFindPic('bag.bmp',90,831,615,842,628) == false then
	   return false
	elseif a==getColor(371,40) and b==getColor(249,439) then 
		return true
	elseif b==getColor(249,439) and c == getColor(849,496) then 
		return true
	elseif a==getColor(371,40) and c == getColor(849,496) then 
		return true
	else
		mSleep(200)
	end				
end


--关闭窗口
function closewin()
	for j = 1,3 do
		--连接断开立即重连与立即刷新
		if DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	mSleep(500)
		--任务对话窗口
		elseif DmFindPic('x_dialog.bmp',90,1004,222,1017,236) then
			click(x,y) mSleep(500)
		--人物栏窗口关闭
		elseif DmFindPic('x_person.bmp',90,1095,36,1112,52) then
			click(x,y) mSleep(500)
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(500)
		--日常/日常活动窗口
		elseif DmFindPic('x_richang.bmp',90,1096,41,1110,54) then
			click(x,y)mSleep(500)
		--复活石
		elseif DmFindPic('x_fuhuoshi.bmp',90,802,86,816,95) then
			click(x,y) mSleep(500)
		elseif DmFindPic('x_fuhuoshi1.bmp',90,802,124,817,135) then
			click(x,y) mSleep(500)		
		--兑换魔晶 /地图
		elseif DmFindPic('x_mojing.bmp',90,1087,42,1102,53) then
			click(x,y) mSleep(500)
		--商城
		elseif DmFindPic('x_shangcheng.bmp',90,1102,29,1118,40) then
			click(x,y) mSleep(500)
		--材料不足
		elseif DmFindPic('x_cailiao.bmp',90,752,79,766,89) then
			click(x,y)		
		--召唤宠物面板
		elseif DmFindPic('x_pet.bmp',85,1100,35,1112,50) then
			click(x,y)
		--竞技场界面	
		elseif DmFindPic('x_jjc.bmp',85,1045,51,1059,63) then
			click(x,y)
		--我的军衔
		elseif DmFindPic('x_junxian.bmp',85,1087,42,1100,55) then
			click(x,y)
		else
			mSleep(200)
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

function MulcolorNoOffset(t,sim,x1,y1,x2,y2)
		keepScreen(true)
		x,y = findMultiColorInRegionFuzzy(t,sim,x1,y1,x2,y2)
		if x~= -1 and y ~=-1 then
			keepScreen(false)
			return true
		else
			keepScreen(false)
			return false
		end	
end

-----------------------------------------------------工具函数
	function Mulcolor(t,sim,x1,y1,x2,y2)
			keepScreen(true)
			x,y = findMultiColorInRegionFuzzy(t,sim,x1-5,y1-5,x2-5,y2-5)
			if x~= -1 and y ~=-1 then
				keepScreen(false)
				return true
			else
				keepScreen(false)
				return false
			end
	end

	function DmFindPic(pic,per,x1,y1,x2,y2)
			keepScreen(true)
			x, y = findImageInRegionFuzzy(PIC_PATH..pic, per, x1-5,y1-5,x2-5,y2-5)
			if x~=-1 and y~=-1 then	
				keepScreen(false)	
				return true		
			else
				keepScreen(false)
				return false
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
	function DmFindPicFuzzy(pic,per,x1,y1,x2,y2,color)
			keepScreen(true)
			x, y = findImageInRegionFuzzy(PIC_PATH..pic,per,x1-5,y1-5,x2-5,y2-5,color)
			if x~=-1 and y~=-1 then
				keepScreen(false)
				return true		
			else
				keepScreen(false)
				return false
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