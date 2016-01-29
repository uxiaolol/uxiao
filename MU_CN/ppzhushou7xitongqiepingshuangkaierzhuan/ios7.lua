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
packagename = {'com.tianmashikong.qmqj.pp','com.tianmashikong.qmqj.pp.pp.1'}
--计算器包名 com.apple.calculator 

--游戏优化部分
function io.list8(App)
	for l in io.popen("ls ".."var/mobile/Containers/Bundle/Application/"):lines() do
		file=io.open("var/mobile/Containers/Bundle/Application/" ..l .."/pp.app/Info.plist")
		if file~=nil then
			path="var/mobile/Containers/Bundle/Application/" ..l .."/pp.app"
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
		file=io.open("var/mobile/Applications/" ..l .."/pp.app/Info.plist")
		if file~=nil then
			path="var/mobile/Applications/" ..l .."/pp.app"
			youxiyouhua()
		end
	end
end

--台服奇迹自动选区
function auto()
	for l in io.popen("ls ".."/var/mobile/Applications/"):lines() do
		a = io.open("/var/mobile/Applications/" ..l .."/pp.app")	
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
		mid = string.gsub(mid,'%d+',area+1,1)
		local tail = string.sub(data,k-5)
		
		file = io.open('/var/touchelf/scripts/log.xml','w')
		file:write(head..mid..tail)
		file:close()
		os.copy('/var/touchelf/scripts/log.xml','/var/touchelf/scripts/com.tianmashikong.qmqj.pp.plist')
		os.copy('/var/touchelf/scripts/com.tianmashikong.qmqj.pp.plist',path..'com.tianmashikong.qmqj.pp.plist')
		
		
		os.copy('/var/touchelf/scripts/log.xml','/var/touchelf/scripts/com.tianmashikong.qmqj.pp.pp.1.plist')
		os.copy('/var/touchelf/scripts/com.tianmashikong.qmqj.pp.pp.1.plist',path..'com.tianmashikong.qmqj.pp.pp.1.plist')
		
		os.copy('/var/touchelf/scripts/log.xml','/var/touchelf/scripts/com.tianmashikong.qmqj.pp.pp.11.plist')
		os.copy('/var/touchelf/scripts/com.tianmashikong.qmqj.pp.pp.11.plist',path..'com.tianmashikong.qmqj.pp.pp.11.plist')
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
	{'InputBox{}', 'area',    '区:' },
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
	auto()
	while true do
		load()
		if allow() == 0 then
			levelup()
		end
		if allow() == 1 then
			bag(1)
			bag(2)
			using(1)
			using(2)
			uparc()		
			potion()
			battle()	
		end	
		bag(1)
		bag(2)		
		using(1)
		using(2)		
		if isDeal() then
			bingfenggu()
			dealbysaytwo(1)
			dealbysaytwo(2)
		end
		exit()
		router() 
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
	local count={0,0}
	logDebug('load')
	nowifi = 0
	while (i < 3) do
		changeApp(i)
		if os.difftime(os.time(),tt[i]) > 200 then
			appKill(packagename[i])
			tt[i]=os.time()
			logDebug('load'..i..'超时')
			logDebug('kill'..':'..packagename[i])		
			isok[i] = 0
			account = 0
			pwd = 0
			isfinish[i]=0
		elseif isfinish[1] == 1 and isfinish[2] == 1 then
			break
		--安全提示
		elseif DmFindPic('x_anquan.bmp',85,971,29,985,41) then
			click(x,y) 
		elseif DmFindPic('bag.bmp',90,831,615,842,628) then
			logDebug('登录完成'..i)
			tt[i]=os.time()
			isfinish[i] = 1
			--[[os.execute('reboot')--]]
		--跳转登录
		elseif DmFindPic('tiaozhuan.bmp',85, 598,388,632,420) then
			click(x,y)
		elseif DmFindPic('x_dialog.bmp',90,1004,222,1017,236) then
			click(x,y) 
		--关闭福利窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) or DmFindPic('x_fuli1.bmp',85,1084,48,1102,61) then
			closewin(i) 
		--选择服务器
		elseif DmFindPic('x_xzfwq.bmp',90,1102,34,1117,49) then
			click(x,y) logDebug('x_xzfwq')
		--公告
		elseif DmFindPic('x_gonggao.bmp',85,1023,47,1037,62) then
			click(x,y) 
		--服务器连接失败
		elseif DmFindPic('cuowu.bmp',90,548,228,563,240) and DmFindPic('qhzh.bmp',90,252,497,266,508) and DmFindPic('ljsb.bmp',90,637,435,652,447)   then
			click(x,y) logDebug('ljsb')
			isok[i] = 0
		--禁止登陆
		elseif DmFindPic('cuowu.bmp',90,548,228,563,240) and DmFindPic('ljsb.bmp',90,637,435,652,447) then
			click(x,y)
			notifyMessage('账号被封')mSleep(2000)
			if DmFindPic('goback.bmp',85,164,567,179,582) then
				click(x,y)
			end
			local file,l,f,jiy,peny,ourline
			file = io.open("/var/touchelf/scripts/avf"..i..".txt","r")
			ourline = tonumber(file:read())		
			delete(ourline,i)			
			isok[i]=0
		--老号没有角色直接换号
		elseif DmFindPic('create.bmp',90,882,566,893,581) and DmFindPic('mofa.bmp',90,171,297,182,306) and DmFindPic('goback.bmp',85,164,567,179,582) then	
			click(x,y)  
			notifyMessage('空号')mSleep(2000)
			local file,l,f,jiy,peny,ourline
			file = io.open("/var/touchelf/scripts/avf"..i..".txt","r")
			ourline = tonumber(file:read())		
			delete(ourline,i)			
			isok[i]=0
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
		elseif DmFindPic('mofahong.bmp',90,176,295,186,304) and DmFindPic('create.bmp',90,882,566,893,581) and DmFindPic('goback.bmp',85,164,567,179,582) then				
			click(x,y) 
			isok[i]=0
			modifyTxt(i)		
		elseif DmFindPic('jinru.bmp',90,546,577,560,588) then
			click(x,y)  
		elseif DmFindPic('start.bmp',90,801,464,810,475) then
			click(x,y)
		--服务器验证999
		elseif DmFindPic('999.bmp',85,705,183,720,206) and DmFindPic('999queding.bmp',85,544,490,555,504) then
			click(x,y)
			router()
			isok[i]=0
		--账号封停
		elseif DmFindPic('fenghao.bmp',85,514,177,534,194) and DmFindPic('yjft.bmp',90,543,491,554,499) and isok[i]==1 then		
			click(x,y)
			notifyMessage('账号被封')mSleep(2000)
			local file,l,f,jiy,peny,ourline
			file = io.open("/var/touchelf/scripts/avf"..i..".txt","r")
			ourline = tonumber(file:read())		
			delete(ourline,i)			
			isok[i]=0	
		elseif DmFindPic('fenghao.bmp',85,514,177,534,194) and DmFindPic('yjft.bmp',90,543,491,554,499) then
			click(x,y) 
		--登录异常
		elseif DmFindPic('dlyc.bmp',90,542,490,553,502) then
			click(x,y)  
			isname[i]=0
		--切换账号
		elseif DmFindPic('qhzh.bmp',90,252,497,266,508) then
			click(x,y) 
		elseif (DmFindPic('denglu.bmp',85,572,398,586,411) or DmFindPic('denglu1.bmp',85,576,400,589,411)) and isok[i]==1 then
			click(x,y)
			local aa =os.time()
			local is=0
			while os.difftime(os.time(),aa)< 5 do
				if count[i] > 2 then
					notifyMessage('账号不存在')mSleep(2000)
					local file,l,f,jiy,peny,ourline
					file = io.open("/var/touchelf/scripts/avf"..i..".txt","r")
					ourline = tonumber(file:read())		
					delete(ourline,i)			
					isok[i]=0					
					count[i]=0
				elseif (DmFindPic('yhbcz.bmp',85,672,199,686,212) or DmFindPic('mimacuowu.bmp',85,691,299,702,310)) and is==0 then
					notifyMessage('账号不存在或者密码错误')
					isok[i]=0
					count[i]=count[i]+1
					is = 1
					tt[i]=os.time()
				end
			end
		--pp助手图标
		elseif (DmFindPic('denglu.bmp',85,572,398,586,411) or DmFindPic('denglu1.bmp',85,576,400,589,411)) and isok[i]==0 then --724,199 740,297
			mSleep(3000)
			click(x+150,y-200) mSleep(800)
			account = dedaozhanghao(i)
			inputText('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')mSleep(1000)
			inputText(account)mSleep(1000)
			click(x+150,y-100) mSleep(500)
			inputText('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')mSleep(1000)
			inputText('qwer1876')mSleep(500)
			click(921,191)
			isok[i]=1
		--换行
		elseif DmFindPic('huanhang.bmp',90,563,556,575,569,i) or DmFindPic('return.bmp',80,555,558,570,567,i) then
			click(x,y)
		--账号不能为空
		elseif DmFindPic('zhwk.bmp',90,544,363,605,412) then
			click(x,y) 
		else
			anchorApp(i)
			mSleep(200)
		end
		i = i + 1
		if i > 2 then
			i = 1
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
	local count={0,0}
	logDebug('reload')
	nowifi = 0
	while (i < 3) do
		changeApp(i)
		if os.difftime(os.time(),tt[i]) > 200 then
			appKill(packagename[i])
			tt[i]=os.time()
			logDebug('reload'..i..'超时')
			logDebug('kill'..':'..packagename[i])		
			isok[i] = 0
			account = 0
			pwd = 0
			isfinish[i]=0
		elseif isfinish[i] == 1  then
			break
		--安全提示
		elseif DmFindPic('x_anquan.bmp',85,971,29,985,41) then
			click(x,y) 
		elseif DmFindPic('bag.bmp',90,831,615,842,628) then
			logDebug('登录完成'..i)
			tt[i]=os.time()
			isfinish[i] = 1
		--跳转登录
		elseif DmFindPic('tiaozhuan.bmp',85, 598,388,632,420) then
			click(x,y)			
			--[[os.execute('reboot')--]]
		elseif DmFindPic('x_dialog.bmp',90,1004,222,1017,236) then
			click(x,y) 
		--关闭福利窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) or DmFindPic('x_fuli1.bmp',85,1084,48,1102,61)then
			closewin(i) 
		--选择服务器
		elseif DmFindPic('x_xzfwq.bmp',90,1102,34,1117,49) then
			click(x,y) logDebug('x_xzfwq')
		--公告
		elseif DmFindPic('x_gonggao.bmp',85,1023,47,1037,62) then
			click(x,y) 
		--服务器连接失败
		elseif DmFindPic('cuowu.bmp',90,548,228,563,240) and DmFindPic('qhzh.bmp',90,252,497,266,508) and DmFindPic('ljsb.bmp',90,637,435,652,447)   then
			click(x,y) logDebug('ljsb')
			isok[i] = 0
		--禁止登陆
		elseif DmFindPic('cuowu.bmp',90,548,228,563,240) and DmFindPic('ljsb.bmp',90,637,435,652,447) then
			click(x,y)
			notifyMessage('账号被封')mSleep(2000)
			if DmFindPic('goback.bmp',85,164,567,179,582) then
				click(x,y)
			end
			local file,l,f,jiy,peny,ourline
			file = io.open("/var/touchelf/scripts/avf"..i..".txt","r")
			ourline = tonumber(file:read())		
			delete(ourline,i)			
			isok[i]=0
		--老号没有角色直接换号
		elseif DmFindPic('create.bmp',90,882,566,893,581) and DmFindPic('mofa.bmp',90,171,297,182,306) and DmFindPic('goback.bmp',85,164,567,179,582) then	
			click(x,y)  
			notifyMessage('空号')mSleep(2000)
			local file,l,f,jiy,peny,ourline
			file = io.open("/var/touchelf/scripts/avf"..i..".txt","r")
			ourline = tonumber(file:read())		
			delete(ourline,i)			
			isok[i]=0
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
		elseif DmFindPic('mofahong.bmp',90,176,295,186,304) and DmFindPic('create.bmp',90,882,566,893,581) and DmFindPic('goback.bmp',85,164,567,179,582) then				
			click(x,y) 
			isok[i]=0
			modifyTxt(i)		
		elseif DmFindPic('jinru.bmp',90,546,577,560,588) then
			click(x,y)  
		elseif DmFindPic('start.bmp',90,801,464,810,475) then
			click(x,y)
		--服务器验证999
		elseif DmFindPic('999.bmp',85,705,183,720,206) and DmFindPic('999queding.bmp',85,544,490,555,504) then
			click(x,y)
			router()
			isok[i]=0
		--账号封停
		elseif DmFindPic('fenghao.bmp',85,514,177,534,194) and DmFindPic('yjft.bmp',90,543,491,554,499) and isok[i]==1 then		
			click(x,y)
			notifyMessage('账号被封')mSleep(2000)
			local file,l,f,jiy,peny,ourline
			file = io.open("/var/touchelf/scripts/avf"..i..".txt","r")
			ourline = tonumber(file:read())		
			delete(ourline,i)			
			isok[i]=0	
		elseif DmFindPic('fenghao.bmp',85,514,177,534,194) and DmFindPic('yjft.bmp',90,543,491,554,499) then
			click(x,y) 
		--登录异常
		elseif DmFindPic('dlyc.bmp',90,542,490,553,502) then
			click(x,y)  
			isname[i]=0
		--切换账号
		elseif DmFindPic('qhzh.bmp',90,252,497,266,508) then
			click(x,y) 
		elseif (DmFindPic('denglu.bmp',85,572,398,586,411) or DmFindPic('denglu1.bmp',85,576,400,589,411)) and isok[i]==1 then
			click(x,y)
			local aa =os.time()
			local is=0
			while os.difftime(os.time(),aa)< 5 do
				if count[i] > 2 then
					notifyMessage('账号不存在')mSleep(2000)
					local file,l,f,jiy,peny,ourline
					file = io.open("/var/touchelf/scripts/avf"..i..".txt","r")
					ourline = tonumber(file:read())		
					delete(ourline,i)			
					isok[i]=0					
					count[i]=0
				elseif DmFindPic('yhbcz.bmp',85,672,199,686,212) and is==0 then
					isok[i]=0
					count[i]=count[i]+1
					is = 1
					tt[i]=os.time()
				end
			end
		--pp助手图标
		elseif (DmFindPic('denglu.bmp',85,572,398,586,411) or DmFindPic('denglu1.bmp',85,576,400,589,411)) and isok[i]==0 then --724,199 740,297
			mSleep(3000)
			click(x+150,y-200) mSleep(800)
			account = dedaozhanghao(i)
			inputText('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')mSleep(1000)
			inputText(account)mSleep(1000)
			click(x+150,y-100) mSleep(500)
			inputText('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')mSleep(1000)
			inputText('qwer1876')mSleep(500)
			click(921,191)
			isok[i]=1
		--换行
		elseif DmFindPic('huanhang.bmp',90,563,556,575,569,i) or DmFindPic('return.bmp',80,555,558,570,567,i) then
			click(x,y)
		--账号不能为空
		elseif DmFindPic('zhwk.bmp',90,544,363,605,412) then
			click(x,y) 
		else
			anchorApp(i)
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
	local wf=1
	while wf<=2 do
		if DmFindPic('x_lsjl.bmp',85,388,431,396,443,1) then
			click(x+3,y+3)
		elseif DmFindPic("xiala.bmp", 90,382,394,393,402,i) and wf==1 then
		   click(x+5,y+5)
		   wf=2
		else
		   break
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
--[[	if f>35 then
		jiy=35
	else
	    jiy=f
	end --]]
	
	if tonumber(ourline)>f then
		local file,hello
--[[		if tonumber(ourline)<=35 and peny==1 then 
			register(bao)
		elseif tonumber(ourline) > 35 then --]]
			file = io.open("/var/touchelf/scripts/avf"..bao..".txt","r")
			ourline = tonumber(file:read())
			file:close()
			file = io.open("/var/touchelf/scripts/avf"..bao..".txt","w")
			file:write(1)
			file:close()
			file = io.open("/var/touchelf/scripts/avf"..bao..".txt","r")
			ourline = tonumber(file:read())
			file:close()
--[[		end--]]
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
--[[	if tt.hour ==0 and ourline == 1 then
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
	end--]]
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
	local isallow = 0
	local isfinish={0,0}
	local i = 1
	local count={0,0}
	logDebug('levelup')
	while (i<3) do
		changeApp(i)
		if os.difftime(os.time(),time_table[i]) > 240 then
			for dd =1,5 do
				notifyMessage(i..'超时')mSleep(1000)
			end	
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
		--安全提示
		elseif DmFindPic('x_anquan.bmp',85,971,29,985,41) then
			click(x,y)			
		--领取补偿
		elseif DmFindPic('huoqu.bmp',90,483,486,491,494,i) then
			clickone(x+20,y+10)	
		elseif DmFindPic('buchang.bmp',90,518,389,527,398,i) then
			clickone(x,y) 
		-- 跳过提示
		elseif DmFindPic('tiaoguo.bmp',90,982,570,991,579) then
			clickone(x,y)
		elseif DmFindPic('jump.bmp',90,921,555,926,574) then
			clickone(x,y) 	
		--回城复活
		elseif DmFindPic('hcfh.bmp',90,505,369,521,380) then
			clickone(x,y)
		--屏蔽其他玩家
		elseif DmFindPic('eye.bmp',90,1035,216,1045,227) then
			clickone(x,y)  
		--佩戴装备
		elseif DmFindPic('peidai.bmp',90,712,507,722,518) or DmFindPic('peidai1.bmp',85,709,470,721,485) then
			clickone(x,y)
		--整理背包
		elseif os.difftime(os.time(),bag_table[i]) >480 and DmFindPic('bag.bmp',90,831,615,842,628) then
			click(x,y) mSleep(1500)
			if DmFindPic('person.bmp',90,586,44,602,56) then	
				bag(i)
				bag_table[i] = os.time()
			end			
		--防止寒冰皇后卡住，进入副本看见boss之后不再点击主线任务
		elseif DmFindPic('liangbai.bmp',85,338,47,358,62)  then		 	
			if DmFindPic('ksgj.bmp',90,534,485,542,495,i) then
				click(x,y)
			end
		elseif count[i] > 15 and isMoving() and DmFindPic('bag.bmp',90,831,615,842,628) then
			click(64,583)
			count[i] = 0
		--确定两个窗口都能进入之后去古战场
		elseif isallow== 1 then
			break
		--2个窗口主线都完成了之后检查是否能进入古战场
		elseif isfinish[1] == 1 and isfinish[2] == 1 then
			if allow() == 1 then
				isallow = 1
			end
		--主线做完了要转身
		elseif (DmFindPicFuzzy('zhuan90.bmp',85,91,229,131,250,0xffffff) or DmFindPicFuzzy('1zhuan80.bmp',90,81,233,131,249,0xffffff) or DmFindPicFuzzy('3zhuan1.bmp',90,82,232,117,250,0xffffff)) and DmFindPic('bag.bmp',90,831,615,842,628) then
			notifyMessage('到达一转a') mSleep(2000) 
			logDebug('到达一转1')	
			isfinish[i] = 1
		--3zhuan50
		elseif (DmFindPicFuzzy('3zhuan50.bmp',90,81,231,131,252,0xffffff) or DmFindPicFuzzy('3zhuan.bmp',90,81,232,111,249,0xffffff)) and DmFindPic('bag.bmp',90,831,615,842,628) then
			notifyMessage('到达一转a') mSleep(2000) 
			logDebug('到达一转1')	
			isfinish[i] = 1			
		elseif (DmFindPicFuzzy('3zhuan80.bmp',90,82,232,131,249,0xffffff) or DmFindPicFuzzy('2zhuan60.bmp',90,.82,233,130,248,0xffffff) or DmFindPicFuzzy('2zhuan50.bmp',90,81,233,131,249,0xffffff)) and DmFindPic('bag.bmp',90,831,615,842,628) then
			notifyMessage('到达一转a') mSleep(2000) 
			logDebug('到达一转1')	
			isfinish[i] = 1
		elseif (DmFindPicFuzzy('zhuan90.bmp',85,91,229,131,250,0xffffff) or DmFindPicFuzzy('1zhuan80.bmp',90,81,233,131,249,0xffffff)) and DmFindPic('bag.bmp',90,831,615,842,628) then
			time_table[i]=os.time() 			
		--任务停止移动之后点击主线任务	
		elseif isMoving() and DmFindPic('bag.bmp',90,831,615,842,628) and DmFindPicFuzzy('renwu.bmp',90,11,202,35,228,0xffffff) then--37,251
			click(x+25,y+50)
			count[i]=count[i]+1
		--前往副本
		elseif DmFindPic('qianwang.bmp',90,862,475,872,489) then
			clickone(x,y) 
			time_table[i] = os.time()
		--章节奖励点击确定
		elseif DmFindPic('zhangjie.bmp',90,546,488,558,500) then
			clickone(x,y)
			time_table[i] = os.time() 
		--跳出技能战盟等提示
		elseif DmFindPic('hei.bmp',85,33,100,41,108) then --39,120
			clickone(x+6,y+20) 
		--弹出对话框黑色
		elseif DmFindPic('shouzhi.bmp',90,565,530,581,544) then
			clickone(x,y)
		--佩戴翅膀
		elseif DmFindPic('peidaicb.bmp',90,541,334,556,347) then
			clickone(x,y) 
		--关闭翅膀窗口--人物栏叉子通用
		elseif DmFindPic('x_person.bmp',90,1095,36,1112,52) then
			clickone(x,y) 
		--领取任务	
		elseif DmFindPic('ling.bmp',90,859,473,869,487) then
			clickone(x,y)
			time_table[i] = os.time()
			count[i] = 0
		--转生图标
		elseif DmFindPic('zhuansheng.bmp',80,530,383,538,390,i) or DmFindPic('zhuansheng1.bmp',80,526,385,534,393,i) then
			click(x,y)			
		--黄字转生
		elseif DmFindPic('huangzs.bmp',85,427,435,439,448) then
			click(x+5,y+5)
		--不够转生
		elseif DmFindPic('xuqiudengji.bmp',85,448,472,458,480,i) and DmFindPic('x_zs.bmp',85,614,249,623,256,i) then
			--关闭转生窗口
			click(x,y)		
		--关闭窗口之后将另外的窗口超时的起始时间置为0	
		elseif DmFindPic('lvzs.bmp',85,859,580,873,596) and DmFindPic('xuqiudengji.bmp',85,805,440,830,457) and DmFindPic('x_zs.bmp',90,1093,41,1106,55)== false then
			appKill(packagename[i])
			time_table[1]=os.time()
			time_table[2]=os.time()
			logDebug('转生关闭窗口消失')
		--一转暂时不升级二转
		elseif DmFindPic('erzhuan.bmp',85,544,292,554,304,i) and DmFindPic('x_zs.bmp',85,614,249,623,256,i) then
			click(x,y)
		--绿色转生
		elseif DmFindPic('lvzs.bmp',85,859,580,873,596) then
			click(x,y)  
		--转生成功
		elseif DmFindPic('zscg.bmp',85,307,509,316,519,i) then
			click(x,y)   
		--任务对话框
		elseif DmFindPic('x_dialog.bmp',90,1004,222,1017,236) then
			clickone(x,y)  
		--立即转生
		elseif DmFindPic('lijizhuansheng.bmp',85,249,443,257,452,i) then
			click(x,y)  
			--[[time_table[i] = time_table[i] - 30			--]]
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) or DmFindPic('x_fuli1.bmp',85,1084,48,1102,61)then
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
		i = i + 1
		if i > 2 then
			i = 1
		end		
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
			if os.difftime(os.time(),time_table) > 120 then
				appKill(packagename[i])				
				time_table=os.time()
				logDebug('kill'..':'..packagename[i])				
				logDebug('bag'..i..'超时')
			--连接断开立即重连与立即刷新
			elseif DmFindPic('dxl.bmp',90,512,422,521,431)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
				clickone(x,y)
			--屏蔽其他玩家
			elseif DmFindPic('eye.bmp',90,1035,216,1045,227) then
				clickone(x,y)  				
			--登录异常
			elseif DmFindPic('dlyc.bmp',90,542,490,553,502) then
				click(x,y)				
			elseif DmFindPic('bag.bmp',90,831,615,842,628) then
				click(x,y)  mSleep(1500) pack(i) 
			elseif DmFindPic('peidai.bmp',90,712,507,722,518) or DmFindPic('peidai1.bmp',85,709,470,721,485) then
				click(x,y) 				
			elseif DmFindPic('x_dialog.bmp',90,1004,222,1017,236) then
				click(x,y) 	
			elseif DmFindPic('x_zhuoyue.bmp',90,793,169,810,181) then
				click(x,y)
			elseif DmFindPic('huishou.bmp',85,688,587,701,598) or DmFindPic('zbhuishou.bmp',90,669,586,684,601) then
				click(x,y) 
			--勾选			
			elseif DmFindPic('person.bmp',90,586,44,602,56) and DmFindPic('lvzhuang.bmp',85,284,509,298,521) then
				click(x,y)  mSleep(500)
			elseif DmFindPic('person.bmp',90,586,44,602,56) and DmFindPic('lanzhuang.bmp',85,403,507,417,522) then
				click(x,y) mSleep(500)
			elseif DmFindPic('person.bmp',90,586,44,602,56) and DmFindPic('zizhuang.bmp',85,527,509,542,521) then
				click(x,y) mSleep(500)
			--回收确定	
			elseif DmFindPic('hsqueding.bmp',90,260,462,269,470,i) then
				click(x,y) 	mSleep(500)
			elseif count > 2 then
				local tt = os.time()
				while os.difftime(os.time(),tt) < 2 do
					if DmFindPic('zhengli.bmp',80,1007,588,1019,602) and iszl == 0 then
						click(x,y)
						iszl=1
					end
				end				
				closewin()
				logDebug('回收魔晶点击超过3次')
				break		
			--贵重物品是否回收
			elseif DmFindPic('gzwp.bmp',85,461,432,473,443) then
				click(x,y)
			--误点其他地方导致卡屏
			elseif DmFindPic('x_all.bmp',90,1096,36,1112,50) then
				click(x,y)
			--立即回收
			elseif DmFindPic('ljhuishou.bmp',85,217,580,227,594) then
				click(x,y) 
				count = count + 1	
				mSleep(1000)
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
		elseif DmFindPic('person.bmp',90,586,44,602,56) then
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
	local wz = 2
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
		--屏蔽其他玩家
		elseif DmFindPic('eye.bmp',90,1035,216,1045,227) then
			clickone(x,y)  			
		--打开背包
		elseif DmFindPic('bag.bmp',90,831,615,842,628) then
			click(x,y)  
			pack(i)	
			if DmFindPic('zhengli.bmp',80,1007,588,1019,602) then
				click(x,y)mSleep(500)
			end		
		--恶魔凭证留着
		elseif DmFindPic('e1.bmp',85,466,241,479,255)  then --793,116
			click(x+330,y-125)
		elseif DmFindPic('e.bmp',80,500,305,510,316) then	--796,155
			click(x+300,y-150)			
		--全部使用
		elseif DmFindPic('qbshiyong.bmp',90,550,484,566,497) then
			click(x,y)		
		--创造晶石
		elseif DmFindPic('cz.bmp',85,460,259,471,269) or DmFindPic('cz1.bmp',85,460,222,472,232) then--795,105
			click(x+335,y-105)
			closewin()
			break
		--彩色羽毛
		elseif DmFindPic('caise.bmp',85,633,166,652,180) then --798,142
			click(x+165,y-24)
			closewin()
			break
		--玛雅晶石
		elseif DmFindPic('maya.bmp',85,464,262,474,271) then--795,143
			click(x+330,y-120)
			closewin()
		elseif DmFindPic('fuhuoshi.bmp',90,459,228,468,238) or DmFindPic('fuhuoshi1.bmp',90,460,267,470,279) then
			closewin()
			logDebug('fuhuoshi'..i)
			break	
		--图鉴部分
		--金币部分
		elseif DmFindPic('jinbi1.bmp',90,430,344,444,353) and DmFindPic('jinbishiyong1.bmp',90,821,424,833,434) then
			click(x,y)
		elseif DmFindPic('jinbi2.bmp',90,431,304,445,316) and 	DmFindPic('jinbishiyong2.bmp',90,821,461,833,473) then
			click(x,y)
		--合成材料部分
		elseif DmFindPic('hecheng.bmp',90,429,344,443,358) and DmFindPic('hechengcs.bmp',90,821,419,832,436) then
			click(x,y) 
		elseif DmFindPic('hecheng1.bmp',90,427,307,443,320) and DmFindPic('hechengcs1.bmp',90,822,457,835,471) then
			click(x,y) 
		--果子部分
		elseif DmFindPic('guoshi.bmp',90,451,308,466,318) and DmFindPic('shiyonggz.bmp',90,820,387,834,397) then
			click(x,y)
		--晶石也卖了
		elseif DmFindPic('jing.bmp',85,465,225,477,236) then--794,105
			click(x+330,y-125)
			closewin()
			break
		--背包有tu
		elseif DmFindPic('jpcs.bmp',90,822,472,834,484) or 
				DmFindPic('jpcs1.bmp',90,819,445,832,459) or 
				DmFindPic('jpcs2.bmp',90,819,435,831,448) or 
				DmFindPic('jpcs3.bmp',90,462,494,473,505,i) then
			click(x,y)
		elseif wz > 25 then
			closewin(i)
			logDebug('25格使用完成')
			if DmFindPic('queding.bmp',85,458,432,473,444) then
				click(x,y)
			end
			break
		elseif DmFindPic('person.bmp',90,586,44,602,56) then
			mSleep(500)
			click(690+a*93,146+b*93)
			wz = wz + 1
		--贵重物品
		elseif DmFindPic('guizhongwuping.bmp',85,637,431,650,445) then
			click(x,y)
		--不存在的物品的X子
		--回收确定	
		elseif DmFindPic('hsqueding.bmp',90,260,462,269,470,i) then
			click(x,y) 		
		--误点其他地方导致卡屏
		elseif DmFindPic('x_all.bmp',90,1096,36,1112,50) then
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
		elseif DmFindPic('peidai.bmp',90,712,507,722,518) or DmFindPic('peidai1.bmp',85,709,470,721,485) or DmFindPic('peidaihsf.bmp',85,402,483,411,491,i) then
			click(x,y)			
		elseif ishave[1]==1 and ishave[2]==1 then
			break
		elseif DmFindPic('huiduihuan.bmp',90,972,201,987,215) then
			ishave[i]=1
			closewin()
		elseif DmFindPic('person.bmp',90,586,44,602,56) and DmFindPic('huobi.bmp',90,74,225,91,238) then
			click(x,y)
		elseif DmFindPic('qianwangmj.bmp',90,974,481,988,496) then
			click(x,y)mSleep(1500)
		elseif DmFindPic('lijiduihuan.bmp',90,976,208,987,222) then
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
	math.randomseed(tostring(os.time()):reverse():sub(1, 6))  
	local time_table={os.time(),os.time()}	
	local isup={0,0}
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
		elseif DmFindPic('person.bmp',90,586,44,602,56) and DmFindPic('jineng.bmp',90,76,374,88,387) then
			click(x,y) mSleep(300)
		elseif isup[1]==1 and isup[2]==1 then
			break
		elseif --[[DmFindPic('x_cailiao.bmp',90,752,79,766,89) or--]] DmFindPic('huishengji.bmp',90,844,541,857,558) then
			isup[i]=1
			closewin()
		elseif DmFindPic('jinengliang.bmp',90,76,376,90,388) then	--随机点击4个技能 199,322 276,318 353,319 429,317
			local wz = {{353,175},{493,175},{620,173},{758,172}}
			local index = math.random(1,4)
			a = wz[index]
			click(wz[index][1],wz[index][2]) mSleep(300)
			local tt = os.time()
			while os.difftime(os.time(),tt) < 4 do
				--绿色升级按钮
				if DmFindPic('shengjijineng.bmp',90,845,542,857,558) then
					clickone(x,y)
				else
					mSleep(50)
				end
			end
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
		i = i + 1
		if i > 2 then
			i  = 1
		end
	end
end
--领奖
function award()
	nowifi = 0
	local i =1
	local time_table={os.time(),os.time()}	
	local count = 0
	local isfinish={0,0}
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
		elseif DmFindPic('fuli.bmp',90,653,65,665,76) then
			click(x,y) 		
		elseif DmFindPic('peidai.bmp',90,712,507,722,518) or DmFindPic('peidai1.bmp',85,709,470,721,485) then
			click(x,y) 				
		elseif DmFindPic('dafuli.bmp',90,598,49,616,63) and DmFindPic('leijidenglu.bmp',90,99,462,116,476) then
			click(x,y)
		elseif isfinish[1]==1 and isfinish[2]==1 then
			break
		elseif (DmFindPic('lingqu1.bmp',85,981,319,995,332) or DmFindPic('lingqu2.bmp',85,979,448,992,460)) and count < 4 then
			click(x,y) mSleep(500)
			count = count + 1				
		elseif DmFindPic('yilingqu.bmp',85,985,452,1002,464) or DmFindPic('weidacheng.bmp',85,988,456,1005,470) then
			isfinish[i]=1		
			closewin()		
		--确定福利打开没得领了		
		elseif DmFindPic('ylingqu.bmp',85,543,474,557,483,i) or DmFindPic('weidacheng.bmp',90,541,476,554,485,i) then
		--人物栏窗口关闭
		elseif DmFindPic('x_person.bmp',90,1095,36,1112,52) then
			click(x,y) mSleep(500)	
		--材料不足
		elseif DmFindPic('x_cailiao.bmp',90,752,79,766,89) then
			click(x,y)
		else
			mSleep(300)
			con(i)
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
		elseif DmFindPic('person.bmp',90,586,44,602,56) and DmFindPic('cb.bmp',90,76,445,93,458) then
			click(x,y) 
		elseif DmFindPic('peidaicb.bmp',90,541,334,556,347) then
			clickone(x,y)			
		elseif isfinish[1]==1 and isfinish[2]==1 then
			break
		elseif DmFindPic('x_cailiao.bmp',90,752,79,766,89) or DmFindPic('er.bmp',85,177,138,193,159) then
			isfinish[i]=1
			closewin()
		--如果发现为1阶段翅膀则先买火种
		elseif DmFindPic('liangcb.bmp',90,75,445,91,459) and DmFindPic('yijie.bmp',90,177,138,190,159) and b[i] == 0 then
			buyseed(i)
			b[i] = 1
		--自动提升
		elseif DmFindPic('zdts.bmp',90,790,572,804,586) or DmFindPic('zdjj.bmp',90,787,566,800,583) then
			click(x,y)
		elseif DmFindPic('daojutisheng.bmp',90,788,492,802,506) or DmFindPic('daojutisheng1.bmp',90,787,492,803,506) then
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
		if os.difftime(os.time(),time_table[i]) > 120 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('kill'..':'..packagename[i])
			logDebug('uparc'..i..'超时')
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		elseif DmFindPic('bag.bmp',90,831,615,842,628) then
			click(x,y) pack(i) 
		elseif DmFindPic('person.bmp',90,586,44,602,56) and DmFindPic('huobi.bmp',90,74,225,91,238) then
			click(x,y)
		elseif DmFindPic('qwchengjiu.bmp',90,975,569,989,585) then
			click(x,y)
		elseif isfinish[1]==1 and isfinish[2]==1 then
			break
		--灰色提升
		elseif DmFindPic('heitisheng.bmp',90,922,209,935,223) then
			isfinish[i]=1
			closewin()
		elseif DmFindPic('tschengjiu.bmp',90,920,208,933,223) then
			click(x,y)
		elseif DmFindPic('queding.bmp',85,458,432,473,444) then
			click(x,y)
		--误点其他地方导致卡屏
		elseif DmFindPic('x_all.bmp',90,1096,36,1112,50) then
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
		if os.difftime(os.time(),time_table[i]) > 150 then
			appKill(packagename[i])
			time_table[i]=os.time()
			logDebug('allow'..i..'超时')
			logDebug('kill'..':'..packagename[i])
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)
		--误点天使圣殿
		elseif DmFindPic('tian.bmp',90,782,118,792,128) and DmFindPic('x_richang.bmp',90,1096,41,1110,54) then
			click(x,y)	
		--屏蔽其他玩家
		elseif DmFindPic('eye.bmp',90,1035,216,1045,227) then
			clickone(x,y)  
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
		elseif DmFindPic('dahuodong.bmp',90,593,46,607,60) and DmFindPic('guzc.bmp',85,62,388,83,408) then
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
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) or DmFindPic('x_fuli1.bmp',85,1084,48,1102,61) then
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
		elseif DmFindPic('person.bmp',90,586,44,602,56) and DmFindPic('huobi.bmp',90,74,225,91,238) then
			click(x,y)
		elseif DmFindPic('zsqianwang.bmp',90,976,391,988,404) then
			click(x,y)
		elseif DmFindPic('empz.bmp',75,371,141,421,541) then
			click(x,y)
		elseif count > 4 then
			closewin()
			count = 0
		elseif DmFindPic('bzlei.bmp',90,828,110,842,122) then
			myMove_UD(716,493,716,146,2)mSleep(500)
			count = count + 1
		elseif DmFindPic('gmhong.bmp',90,821,464,835,476) then--638,417
			click(x-180,y-50)mSleep(100)
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
		elseif count > 4 then
			logDebug('买药完成')
			break
		elseif count < 3 and DmFindPic('hong.bmp',90,369,163,381,174) then
			click(x,y)
		elseif count < 5 and DmFindPic('lan.bmp',90,372,266,386,277) then
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
		i = i + 1
		if i > 2 then
			i =  1
		end				
	end
end


--进入古战场
function battle()
	local i = 1
	nowifi = 0
	local zb = {{440,209},{416,217},{368,253},{364,284},{329,308},{376,383},{418,427},{458,436},{489,483},{540,437},{595,370},{481,253},{524,267},{497,299},{537,309}}
	local ismove1= {0,0}
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
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	
			ismove1[i]=0
		--屏蔽其他玩家
		elseif DmFindPic('eye.bmp',90,1035,216,1045,227) then
			clickone(x,y) 
		--修理装备
		elseif DmFindPic('huaile.bmp',85,927,257,935,265) then
			click(x,y)
		--立即修理
		elseif DmFindPic('lijixiuli.bmp',85,438,391,449,404) then
			click(x,y)
		elseif isfinish[1]==1 and isfinish[2]==1 then
			break
		elseif DmFindPic('over.bmp',90,382,576,406,594) then			
			isfinish[i]=1
			closewin()
		elseif os.difftime(os.time(),beibao[i]) > 360 and DmFindPic('bag.bmp',90,831,615,842,628) then
			bag(i)
			beibao[i]=os.time()
		--地图不见了
		elseif DmFindPic('daosanjiao.bmp',90,1118,17,1128,29) then
			click(x,y)
		--误点天使圣殿
		elseif DmFindPic('tian.bmp',90,782,118,792,128) and DmFindPic('x_richang.bmp',90,1096,41,1110,54) then
			click(x,y)			
		-- 被打死了							
		elseif DmFindPic('hcfh.bmp',90,505,369,521,380) then
			click(x,y)	
			ft[i]=os.time()		
		--开启挂机
		elseif ismove1[i] == 1 and DmFindPic('xunlu.bmp',90,521,162,531,173) == false and DmFindPic('map_gu.bmp',85,1012,18,1026,32) and  DmFindPic('ksgj.bmp',85,950,467,961,480) then
			click(x,y)					
		--找不到古战场找得到活动则打开活动		
		elseif DmFindPic('map_gu.bmp',85,1012,18,1026,32)==false and DmFindPic('huodong.bmp',85,732,151,746,159) then--419,300
			click(x+10,y-8) 
		elseif DmFindPic('xunlu.bmp',90,521,162,531,173) then			
			ismove1[i]= 1
			isboss[i] = 0
		--挂机
		elseif DmFindPic('zhandou.bmp',90,520,163,532,174) then
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
		elseif DmFindPic('dahuodong.bmp',90,593,46,607,60) and DmFindPic('guzc.bmp',85,62,388,83,408) then
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
		--回收确定	
		elseif DmFindPic('hsqueding.bmp',90,260,462,269,470,i) then
			click(x,y) 			
		--点到天使神殿的声望
		elseif DmFindPic('x_shengwang.bmp',85,796,160,812,173) then
			click(x,y+5)
		--药品
		elseif DmFindPic('x_yaoping.bmp',85,800,99,817,111) then
			click(x,y)
		--人物栏窗口关闭
		elseif DmFindPic('x_person.bmp',90,1095,36,1112,52) then
			click(x,y) mSleep(500)
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
		--登录异常
		elseif DmFindPic('dlyc.bmp',90,542,490,553,502) then
			click(x,y)			
		elseif DmFindPic('fhdl.bmp',90,526,239,543,253) then
			click(x,y)
		elseif isfinish[1]==1 and isfinish[2]==1 then
			modifyTxt(1)
			modifyTxt(2)		
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
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(500)				
		--聊天窗口
		elseif DmFindPic('x_liaotian.bmp',90,1104,28,1117,41) then
			click(x,y)
		else
			mSleep(300)
		end
		i = i + 1
		if i > 2 then
			i =  1
		end		
	end	
end

--退出游戏
function exitone(i)
	nowifi = 0
	local dlx = 0
	local tt = {os.time(),os.time()}
	local isfinish={0,0}
	logDebug('exitone')	
	while (i<3) do
		changeApp(i)
		if DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	
		elseif os.difftime(os.time(),tt[i]) > 180 	then
			appKill(packagename[i])
			tt[i]=os.time()
			logDebug('exitone'..i..'超时')
			logDebug('kill'..':'..packagename[i])	
		--登录异常
		elseif DmFindPic('dlyc.bmp',90,542,490,553,502) then
			click(x,y)			
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
		appRun(packagename[i]) mSleep(2000)
	else
		appRun(packagename[i])mSleep(10000)
	end	
	if DmFindPic('baterry.bmp',85,21,68,31,77) then
		appRun(packagename[i])mSleep(2000)
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
		if os.difftime(os.time(),time_table[i]) > 200 then
			appKill(packagename[i])				
			time_table[i]=os.time()
			logDebug('kill'..':'..packagename[i])				
			logDebug('bingfenggu'..i..'超时')
		--连接断开立即重连与立即刷新
		elseif DmFindPic('dxl.bmp',90,512,422,521,431)  or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)	
		--屏蔽其他玩家
		elseif DmFindPic('eye.bmp',90,1035,216,1045,227) then
			clickone(x,y)  			
		elseif DmFindPic('xunlu.bmp',90,521,162,531,173) then		
		
		elseif isfinish[1]==1 and isfinish[2]==1 then
			break
		--到莱亚了
		elseif DmFindPic('x_laiya.bmp',90,1016,211,1028,225) then	
			click(x,y)
			isfinish[i]=1
		--地图不见了
		elseif DmFindPic('daosanjiao.bmp',90,1118,17,1128,29) then
			click(x,y+5)
		--走到莱亚
		elseif DmFindPic('daditu.bmp',90,595,50,611,63) and (DmFindPic('laoban.bmp',90,852,423,869,441) or DmFindPic('laoban1.bmp',85,853,421,870,439)) then
			click(x,y+10)mSleep(500)
			isbfg[i] = 1
--[[			closewin()--]]
		elseif DmFindPic('bing.bmp',90,1011,17,1023,32) == false and DmFindPic('sanjiao.bmp',90,1113,22,1126,33) then--1036,129
			click(x-80,y+100)
		elseif DmFindPic('daditu.bmp',90,595,50,611,63) and DmFindPic('sjdt.bmp',90,52,112,66,126) and isbfg[i] == 0 then
			click(x,y)
		--传送到冰风谷
		elseif DmFindPic('bfg.bmp',90,359,255,371,267) then
			click(x,y)
		--冰风谷走路
		elseif DmFindPic('bing.bmp',90,1011,17,1023,32) and DmFindPic('sanjiao.bmp',90,1113,22,1126,33) then--588,298
			click(x-80,y+100)
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(500)			
		else
			mSleep(300)
			anchorApp(i)
			con(i)
		end
		i = i + 1
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
		elseif os.difftime(os.time(),tt[1]) > 300 and os.difftime(os.time(),tt[2]) > 300 then
			break
		elseif os.difftime(os.time(),tt[i]) > 240 then
			closewin()
		elseif DmFindPic('liaotian.bmp',90,757,591,778,601) then
			click(x,y)
		elseif isfinish[1]==1 and isfinish[2]==1 then
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
		--已经交易了
		elseif DmFindPic('quxiao.bmp',85,636,435,653,447) and isdeal[i] > 1 then
			click(x,y)
			closewin(i)
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
				mSleep(300)
				failed(i)	
			end
		--关闭福利窗口/日常/日常活动窗口
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(300)		 
		--兑换魔晶 /地图
		elseif DmFindPic('x_mojing.bmp',90,1087,42,1102,53) then
			click(x,y)mSleep(300) 
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
		--到莱亚了
		elseif DmFindPic('x_laiya.bmp',90,1016,211,1028,225) then	
			click(x,y)				
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
		--兑换魔晶 /地图
		elseif DmFindPic('x_mojing.bmp',90,1087,42,1102,53) then
			click(x,y)mSleep(300) 
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
		if DmFindPic('dxl.bmp',90,512,422,521,431) or DmFindPic('ljsh.bmp',90,296,458,304,467,i) then
			clickone(x,y)		
		elseif yans>=30 then 
			notifyMessage('钱给完了')
			logDebug('钱给完了'..i)
			return false
		elseif DmFindPic('deal.bmp',90,432,572,446,584) and fier==2 then 
			logDebug('钱给完了'..i)
			return true
		--换行
		elseif DmFindPic('huanhang1.bmp',85,965,601,985,617) or DmFindPic('return1.bmp',85,955,598,981,613) then
			click(x,y)		
			fier=2			
		elseif DmFindPic('huanhang.bmp',90,967,605,987,623) or DmFindPic('return.bmp',80,953,594,982,616) then
			click(x,y)
			fier=2
		elseif DmFindPic('deal.bmp',90,432,572,446,584) then --518,372
			click(x+90,y-200)mSleep(1000)
			inputText("11111111")
			mSleep(300)
		elseif DmFindPic("x_jingshi.bmp",80,800,140,815,152) or DmFindPic("x_jingshi1.bmp", 80,799,103,811,116) then
			click(x+3,y+3)	
		--误点其他地方导致卡屏
		elseif DmFindPic('x_all.bmp',90,1096,36,1112,50) then
			click(x,y)				
		elseif DmFindPic('x_weizhi.bmp',90,1095,40,1109,53) then
			click(x,y)			
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
		mSleep(200)
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
		if find_Onequyu(0x8B2BC6,85,658+a*93,172+b*93,668+a*93,178+b*93)then 
			mSleep(200)
			click(x+20,y-20)mSleep(300)
			wz=wz+1
			nz=2
		else
			wz=wz+1
			nz=1
		end
		if nz==2 then 
			if DmFindPic("fangru.bmp", 80,823,309,834,321) or DmFindPic("fangru1.bmp", 80,821,325,836,337) or DmFindPic('fangru2.bmp',80,821,276,832,289) or DmFindPic('fangru3.bmp',80,820,290,835,303) then
				click(x,y)
			--放入不绑定的活动材料
			elseif DmFindPic('fangrulr.bmp',85,820,412,836,425) then
				click(x,y)
			elseif DmFindPic("x_jingshi.bmp",80,800,140,815,152) or DmFindPic("x_jingshi1.bmp", 80,799,103,811,116) then
				click(x+5,y+5)
			--误点其他地方导致卡屏
			elseif DmFindPic('x_all.bmp',90,1096,36,1112,50) then
				click(x,y)				
			elseif DmFindPic('x_weizhi.bmp',90,1095,40,1109,53) then
				click(x,y)
			end
		end 
		--关闭福利窗口/日常/日常活动窗口
		if DmFindPic('x_fuli.bmp',90,1095,40,1108,53) then
			click(x,y) mSleep(300)		
		--误点其他地方导致卡屏
		elseif DmFindPic('x_all.bmp',90,1096,36,1112,50) then
			click(x,y)				
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
	elseif DmFindPic('jin.bmp',90,840,501,851,513) then
		reload(i)
	elseif DmFindPic('jinru.bmp',90,546,577,560,588) then
		click(x,y) logDebug('jinru')
	--选择服务器
	elseif DmFindPic('x_xzfwq.bmp',90,1102,34,1117,49) then
		click(x,y) logDebug('x_xzfwq')
	--公告
	elseif DmFindPic('x_gonggao.bmp',85,1023,47,1037,62) then
		click(x,y)
	--登录异常
	elseif DmFindPic('dlyc.bmp',90,542,490,553,502) then
		click(x,y)
	elseif DmFindPic('yjft.bmp',90,543,491,554,499) then
		click(x,y)
	--登录按钮
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
	a = getColor(986,123)
	b = getColor(1010,184)
	c = getColor(1082,130)
	mSleep(300);
	fig=fig+1
	if  DmFindPic('bag.bmp',90,831,615,842,628) == false then
	   return false
	elseif a==getColor(986,123) and b==getColor(1010,184) then 
		return true
	elseif b==getColor(1010,184) and c == getColor(1082,130) then 
		return true
	elseif a==getColor(986,123) and c == getColor(1082,130) then 
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
		elseif DmFindPic('x_fuli.bmp',90,1095,40,1108,53)or DmFindPic('x_fuli1.bmp',85,1084,48,1102,61) then
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