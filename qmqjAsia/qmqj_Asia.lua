PIC_PATH = '/var/touchelf/scripts/qmqj/'
PKG_NAME='com.siamgame.en.qjmu'
-- 点击函数封装
function click(x, y)--随机小幅度点击
    touchDown(0, x + math.random(-2, 2), y + math.random(-2, 2))
    mSleep(math.random(15,50))
    touchUp(0)
    mSleep(math.random(300,500))
end

--日志函数
function jdwlLog(contents)
	logDebug(contents)
end

--提示函数
function notifyMsg(msg)
	notifyMessage(msg)mSleep(2000)
end

--启动app
function run()
	appRun(PKG_NAME)
end
--关闭app
function kill()
	appKill(PKG_NAME)
end

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
	os.remove(path.."/Audio")
	os.remove(path.."/Equip/FS_wing_01.unity3d")
	os.remove(path.."/Equip/FS_wing_02.unity3d")
	os.remove(path.."/Equip/FS_wing_03.unity3d")
	os.remove(path.."/Equip/FS_wing_04.unity3d")
	os.remove(path.."/Equip/ZS_wing_01.unity3d")
	os.remove(path.."/Equip/ZS_wing_02.unity3d")
	os.remove(path.."/Equip/ZS_wing_03.unity3d")
	os.remove(path.."/Equip/ZS_wing_04.unity3d")
	os.remove(path.."/Equip/MJS_wing_01.unity3d")
	os.remove(path.."/Equip/MJS_wing_02.unity3d")
	os.remove(path.."/Equip/MJS_wing_03.unity3d")
	os.remove(path.."/Equip/MJS_wing_04.unity3d")
	os.remove(path.."/Monster")
	os.remove(path.."/Decoration")
--[[	os.remove(path.."/Data/Raw/Decoration/HLB.unity3d")	
	os.remove(path.."/Data/Raw/Decoration/JG_lianji_01.unity3d")	
	os.remove(path.."/Data/Raw/Decoration/DYH_lianji_01.unity3d")	
	os.remove(path.."/Data/Raw/Decoration/ZZZH_FZZR_01.unity3d")	
	os.remove(path.."/Data/Raw/Decoration/ZZZH_ZZCJ_01.unity3d")	--]]
end	

function io.list7()
	for l in io.popen("ls ".."var/mobile/Applications/"):lines() do
		file=io.open("var/mobile/Applications/" ..l .."/ios.app/Info.plist")
		if file~=nil then
			path="var/mobile/Applications/" ..l .."/Documents"
			youxiyouhua()
		end
	end
end
version="2016/05/30_1"
connectcs=0

function ver()
	notifyMsg(version)
end

function main()
	mSleep(2000)
	unlock()
	ver()
	rotateScreen(90)
	emgcms()
end

--恶魔广场模式
function emgcms()
	while true do
		denglu()
		--shezhi()
		zhuxian()
		guding()
		beibao()
		beibao()
		--出售掉玛雅晶石
		shiyong()
		jiangli()
		qifu()
		zhandouli()
		beibao()
		shiyong()
		if getShiqu() == "no" then
			shiqu()
		end
		emgc()
		hecheng()
		mSleep(5000)
		beibao("no")
		if bubangding()==1 then
			geidongxi()
		end
		tuichu()
	end
end

--亚服登录
function loadGame()
	jdwlLog("loadGame")
	while true do
		
	end
end



--获取拾取文档
function getShiqu()
	local file,ret
	flag = ftpGet("ftp://192.168.1.200/lua/shiqu.txt", "/var/touchelf/scripts/shiqu.txt", "jdwl", "jdwl2014") -- 将FTP服务器192.168.1.100上路径为/a.txt的文件下载到/var/touchelf/a.txt
	if flag then
		file = io.open("/var/touchelf/scripts/shiqu.txt","r")
		ret=file:read()
		return ret
	else
		return "no"
	end
end

--收钱模式
function shouqian()
	while true do
		denglu()
		yaodian()
		shou()
	end
end

--交易
function geidongxi()
	yaodian()
	jiaoyi()
end

--在古战场做的事情
function zhandouli()
	hushenfu()
	jineng()
	wuqi()
	xianglian()
	--jingling()
	chibang()
	--chengjiu()
end
--领取奖励
function jiangli()
	leiji()
	dengji()
	--lianxu()
	--meiri()
	--youjian()
end

--出售掉玛雅晶石
function hecheng()
	jdwlLog("合成果实")
	local isok=0
	local start=os.time()
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435)or DmFindPic('dx.bmp',85,519,422,530,438) then
			click(x,y)
		elseif os.difftime(os.time(),start)>180 then
			jdwlLog("合成果实超时")
			kill()
			isok=0
			start=os.time()
		--强化完成
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('合成果实完成')
			break
		elseif isok==1 and DmFindPic('x_hecheng.bmp',85,1095,36,1111,50) then
			click(x,y)
		--点击炼炉
		elseif DmFindPic('hecheng.bmp',85,446,52,459,66)  then
			click(x,y)
		--点击果实一栏
		elseif DmFindPic("guoshi.bmp",80,73,179,90,195) then
			click(x,y)
		--去掉勾子
		elseif DmFindPic("gouzi.bmp",80,274,467,295,481) then
			click(x,y)
		--点击合成
		elseif DmFindPic("liangguoshi.bmp",80,73,175,90,190) and DmFindPic("gouzi.bmp",80,274,467,295,481)==false and DmFindPic("hechenganniu.bmp",80,440,580,459,593) then
			click(x,y)mSleep(400)
		--菜单栏回缩
		elseif DmFindPic('hecheng.bmp',85,446,52,459,66)==false and DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPic('head.bmp',85,12,46,21,57) then
			click(x,y)mSleep(500)
			if DmFindPic('hecheng.bmp',85,446,52,459,66) then
				click(x,y)mSleep(1000)
			end
		--材料不够
		elseif DmFindPic('x_cailiao.bmp',85,732,80,746,95) then
			click(x,y)
			isok=1
		else
			mSleep(500)
			connect()
		end
	end
end

--解除锁屏
function unlock()
	jdwlLog('解除锁屏')
	local dd = 0
	if (DmFindPic('black.bmp',95,318,514,339,534) or DmFindPic("black1.bmp",95,301,477,319,501) or appRunning(PKG_NAME)==false )then
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
				os.execute("reboot")
			--sim卡
			elseif DmFindPic('simcard.bmp',80,320,612,347,645) or DmFindPic("simcard1.bmp",80,309,608,344,646) then
				click(x,y)				
				dd = 1
			else
				appRun('com.apple.calculator')
				mSleep(200)
			end
		end
	end
end

--登录游戏
function denglu()
	jdwlLog('登录游戏')
	local count=0
	local start=os.time()
	local isarea=0
	while true do
		if DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('登录完成')
			break
		--排队
--[[		elseif DmFindPic("paidui.bmp",85,550,430,569,443) then
			notifyMsg("排队")
			start=os.time()--]]
		elseif os.difftime(os.time(),start) > 180 then
			kill()
			jdwlLog('登录超时')
			start=os.time()
		elseif DmFindPic('meijuese.bmp',85,115,217,131,233) then
			click(x,y)
		--游客模式
		elseif DmFindPic("youke.bmp",85,963,583,978,602) then
			click(x,y)
		elseif DmFindPic("youkequeding.bmp",85,465,428,478,443) then
			click(x,y)mSleep(3000)
		--不允许通知 
		elseif DmFindPic("buyunxu.bmp",85,387,430,420,462)	 then
			click(x,y)
		--没有网络重启
		elseif DmFindPic("nowifi.bmp",85,404,270,427,291) and DmFindPic("nowifiqueding.bmp",85,634,428,649,440) then
			click(x,y)
			--[[os.execute("reboot")--]]
			local index=1
			for index=1,10 do
				notifyMsg("网络连接异常")
			end
			
		--名字有问题
		elseif (DmFindPic('chuangjian.bmp',85,888,567,901,581) or DmFindPic('chuangjian1.bmp',85,886,569,898,584)) and DmFindPic('mingziqueding.bmp',85,638,431,649,442) then
			click(x,y)mSleep(1000)
				click(566,572)
				inputText('\b\b\b\b\b\b\b\b\b\b')
				local name = randomstring(7)
				inputText(name)
				isarea=0
		--什么鬼确定
		elseif DmFindPic('smqueding.bmp',85,640,431,651,442) then
			click(x,y)
		--社么鬼确定
		elseif DmFindPic('smgqueding.bmp',85,637,430,649,443)	 then
			click(x,y)
		elseif DmFindPic('smqd.bmp',85,638,430,653,442) then
			click(x,y)		
		--自动选区
--[[		elseif isarea==0 and DmFindPic("qiehuanqu.bmp",80,723,394,742,411) then
			click(x,y)mSleep(1000)--]]
		elseif --[[isarea==1 and--]] DmFindPic("quyujinru.bmp",80,956,587,974,603) then
			click(x,y)
		elseif DmFindPic("tuijie.bmp",80,132,584,147,600) then
			click(x,y)mSleep(1500)
		elseif DmFindPic("zuoxiatuijie.bmp",80,131,580,142,596) then
			click(878,597)mSleep(1000)
		elseif DmFindPic("fuwuqi.bmp",80,498,37,514,54) and (DmFindPic("1.bmp",80,184,330,205,370) or DmFindPic("jianpantanqi.bmp",80,879,259,915,296)) then
			local areas=getArea()	
			notifyMsg(areas)
			inputText(areas)
			isarea=1
			if DmFindPic("1.bmp",80,184,330,205,370) or DmFindPic("jianpantanqi.bmp",80,879,259,915,296)  then
				click(913,281)
			end
		--登录界面进入游戏
		elseif isarea==1 and (DmFindPic('denglujinru2.bmp',85,811,501,828,515) or DmFindPic("denglujinru1.bmp",85,807,501,823,512)) then
			click(x,y)
			isarea=0
			mSleep(3000)
--[[		--选区
		elseif DmFindPic("xuanzequ.bmp",85,723,393,743,413) then
			click(x,y)--]]
		--有角色直接进入游戏
		elseif DmFindPic('juesejinru.bmp',85,519,572,532,583) or DmFindPic('juesejinru1.bmp',85,516,572,530,587)  then
			click(x,y)					
		--选择魔法师角色
		elseif DmFindPic('chuangjian.bmp',85,888,567,901,581) and DmFindPic('huimofa.bmp',85,155,293,166,305) then
			click(x,y)
		elseif DmFindPic('chuangjian1.bmp',85,886,569,898,584) and DmFindPic('huimofa1.bmp',85,155,294,167,306) then
			click(x,y)			
		--确认选中之后创建
		elseif DmFindPic('hongmofa.bmp',85,158,289,170,301) and DmFindPic('chuangjian.bmp',85,888,567,901,581) then
			click(x,y)
		elseif DmFindPic('hongmofa1.bmp',85,155,296,170,305) and DmFindPic('chuangjian1.bmp',85,886,569,898,584)then
			click(x,y)			
		--创建角色之后弹出个不认识的框
		elseif DmFindPic('burenshi.bmp',85,549,226,561,237) and DmFindPic('burenshiqueding.bmp',85,639,429,651,437) then
			click(x,y)
		elseif DmFindPic('kaishizhengcheng.bmp',85,821,460,834,474) and count>5 then	
			kill()
			jdwlLog("开始征程卡住了")
			count=0
		--开始征程
		elseif DmFindPic('kaishizhengcheng.bmp',85,821,460,834,474) then
			click(x,y)
			count=count+1
			mSleep(1000)
		--登录时候的广告
		elseif DmFindPic('close.bmp',85,1063,599,1086,612) or DmFindPic('close1.bmp',85,1063,599,1077,613) then
			click(x,y)
		--键盘弹起
		elseif DmFindPic('return.bmp',85,966,598,981,616) or DmFindPic('return1.bmp',85,966,597,980,616) then
			click(x,y)
		elseif DmFindPic('huanhang.bmp',85,967,593,985,609)	then
			click(x,y)
		--键盘弹起
		elseif DmFindPic('diqiu.bmp',85,179,596,194,610) or DmFindPic('diqiu1.bmp',85,152,596,167,613) then--975,601
			click(x+796,y+5)			
		elseif DmFindPic("done.bmp",85,887,263,910,292) then
			click(x,y)
		--电池启动
		elseif DmFindPic('dianchi.bmp',85,20,68,31,77) then
			run()	
		--登录异常
		elseif DmFindPic("dengluyichang.bmp",85,550,488,563,498) or DmFindPic("dengluyichang1.bmp",80,547,487,562,500) then
			click(x,y)mSleep(1000)
			kill()
			iGrimace()
			start=os.time()
		--不允许通知	
		elseif DmFindPic("buyunxu.bmp",85,387,430,420,462) then	
			click(x,y)
		--灰色同意按钮
		elseif DmFindPic("huisetongyi.bmp",85,548,561,561,574) and DmFindPic("zuo.bmp",85,193,441,209,454) then
			click(x,y)mSleep(1000)
		elseif DmFindPic("huisetongyi.bmp",85,548,561,561,574) and DmFindPic("you.bmp",85,658,438,678,453) then
			click(x,y)mSleep(1000)	
		--绿色同意
		elseif DmFindPic("lvsetongyi.bmp",85,548,562,564,575) then
			click(x,y)
		--进度条
		elseif DmFindPic("baifenhao.bmp",85,390,608,411,634) then
			notifyMsg("游戏更新请稍等")mSleep(10000)
			start=os.time()
		elseif DmFindPic("percent1.bmp",85,813,609,863,633) or DmFindPic("percent.bmp",85,813,609,863,633) then
			notifyMsg("游戏更新请稍等")mSleep(10000)
			start=os.time()
		elseif DmFindPicFuzzy("simcard2.bmp",85,602,305,647,344,0xffffff) then
			click(x,y)
		elseif DmFindPic('x_duihua.bmp',85,1004,219,1016,232) then			
			click(x,y)
		elseif DmFindPic('x_fuli.bmp',85,1092,44,1106,56) then
			click(x,y)	
		else
			mSleep(500)
		end
	end
end

function getArea()
	local file
	file = io.open("/var/touchelf/scripts/area.txt","r")
	if file ~= nil then	
		local areas=file:read()
		return areas
	else
		notifyMsg("缺少area.txt文档")
	end
end

--设置流程优先
function shezhi()
	jdwlLog("设置选项")
	local start=os.time()
	local isok=0
	while true do
		if os.difftime(os.time(),start) > 120 then
			kill()
			jdwlLog("设置超时")
			start=os.time()
		elseif DmFindPic('x_fuli.bmp',85,1092,44,1106,56) then
			click(x,y)		
		--开始征程
		elseif DmFindPic('kaishizhengcheng.bmp',85,821,460,834,474) then
			click(x,y)
		--屏蔽玩家
		elseif DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438) then
			click(x,y)	
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPic("x_shezhi.bmp",85,823,116,836,126)==false then
			jdwlLog("设置完成")
			break
		elseif DmFindPic('x_duihua.bmp',85,1004,219,1016,232) then
			click(x,y)
		--设置完成
		elseif (DmFindPic("xuanzhong.bmp",85,488,371,502,386) or DmFindPic("xuanzhong1.bmp",85,489,374,500,388) ) and DmFindPic("x_shezhi.bmp",85,823,116,836,126) then
			click(x,y)
			isok=1
		--点击画面选项
		elseif DmFindPic("heihuamian.bmp",85,767,173,783,189) then
			click(x,y)
		--流畅优先
		elseif DmFindPic("huamian.bmp",85,765,168,781,187) and DmFindPic("liuchangyouxian.bmp",85,489,374,502,385) then
			click(x,y)
		--点击系统设置
		elseif DmFindPic('xitongshezhi.bmp',85,845,167,856,177) then
			click(x,y)			
		elseif  DmFindPic('fuli.bmp',85,652,40,662,48)==false and DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPic('head.bmp',85,12,46,21,57) then
			click(x,y)
			mSleep(1500)
		--点击功能按钮
		elseif DmFindPic('gongneng.bmp',85,805,63,818,74) then
			click(x,y)
		elseif DmFindPic('x_duihua.bmp',85,1004,219,1016,232) then			
			click(x,y)
		else
			mSleep(300)
			connect()
		end
	end
end

--升级
function zhuxian()
	jdwlLog('主线任务')
	local clktime=os.time()
	local start=os.time()
	local cnt=0
	local lq=0
	local qw=0
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438) then
			click(x,y)	
		elseif os.difftime(os.time(),start) > 240 or lq>15 or qw>15  then
			kill()
			jdwlLog("主线任务超时")
			clktime=os.time()
			start=os.time()
			lq=0
			qw=0
			cnt=0
		--开始征程
		elseif DmFindPic('kaishizhengcheng.bmp',85,821,460,834,474) then
			click(x,y)			
		--世界地图打开了
		elseif DmFindPic('x_sjdt.bmp',85,1091,39,1104,51) then	
			click(x,y)mSleep(1000) 
		--接受领取任务
		elseif DmFindPic('lingqu.bmp',85,859,475,870,488) then
			click(x,y) 
			start=os.time() cnt=0
			lq=lq+1
		--副本任务
		elseif DmFindPic('lijijinru.bmp',85,859,472,869,485) then
			click(x,y) 
			start=os.time() cnt=0
			qw=qw+1
		--剧情跳过
		elseif DmFindPic('juqingtiaoguo.bmp',85,956,557,962,568) then
			click(x,y) cnt=0
			lq=0
			qw=0
		--佩带装备
		elseif DmFindPic('peidai.bmp',85,712,507,724,519) or DmFindPic('peidai1.bmp',85,712,472,725,482) then
			click(x,y)
			lq=0
			qw=0
		--背包满了
		elseif DmFindPic('beibaoman.bmp',80,919,292,932,305) or DmFindPic('beibaoman1.bmp',80,932,295,942,305) then
			beibao()
		elseif DmFindPic('x_duihua.bmp',85,1004,219,1016,232) and DmFindPic("huangzi.bmp",80,505,372,521,389) then
			click(x+5,y+5)
		--任务卡顿之后对话框
		elseif DmFindPic('lingqu.bmp',85,859,475,870,488)==false and DmFindPic('x_duihua.bmp',85,1004,219,1016,232) then
			click(x,y)			
		elseif isMoveing()==false and cnt > 10 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog("没事走两步")
			local i=1
			for i=1,3 do
			touchDown(0,118,557)
			mSleep(400)
			touchUp(0)
			end
			cnt=0
		--自动寻路/自动战斗
		elseif (DmFindPic('zidongxunlu.bmp',85,499,163,508,171) or DmFindPic('zidongzhandou.bmp',85,503,161,510,169)) and os.difftime(os.time(),clktime) <20 then
			mSleep(2000)
		--到达一转80
		elseif DmFindPicFuzzy('1zhuan80.bmp',90,10,229,58,248,0xffffff) and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('到达一转80')
			break
		--到达1转1级继续
		elseif DmFindPicFuzzy('1zhuan1.bmp',90,9,230,53,251,0xffffff) and DmFindPic('beibao.bmp',85,846,614,858,626) then
			--click(933,294)
			jdwlLog('到达100级')
			break
		--打boss
		elseif DmFindPic('liangbai.bmp',85,338,50,359,61) then
			if DmFindPic('kaishiguaji.bmp',85,944,452,958,460) then
				click(x,y)
			end
			lq=0
			qw=0
		--点击主线任务
		elseif isMoveing()==false and DmFindPicFuzzy('1zhuan.bmp',90,10,232,36,249,0xffffff)==false and DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPicFuzzy('zhuxian.bmp',90,10,200,33,226,0xffffff) then
			click(33,256)
			clktime=os.time()
			cnt=cnt+1
--[[		--主线任务暂时断掉
		elseif isMoveing() == false and (DmFindPicFuzzy('richang.bmp',90,99,301,117,322,0xffffff) or DmFindPicFuzzy('richang1.bmp',90,9,302,27,322,0xffffff)) and DmFindPic('beibao.bmp',85,846,614,858,626) then
			click(100,326)
			clktime=os.time()--]]
		--手指对话框
		elseif DmFindPic('shouzhi.bmp',85,564,527,581,541) then
			click(1057,565)
			lq=0
			qw=0
		elseif DmFindPic("shouzhi1.bmp",85,565,530,580,542) then
			click(1057,565)
			lq=0
			qw=0
		--黄字转生
--[[		elseif DmFindPic('huangzhuansheng.bmp',80,410,436,423,446) then
			click(x,y)--]]

		--翅膀跳过
		elseif DmFindPic('tiaoguocb.bmp',85,970,567,975,579) then
			click(x,y)
			lq=0
			qw=0
		--屏幕变暗
		elseif DmFindPic('heibeibao.bmp',85,845,615,856,626) then
			click(x,y)	
			lq=0
			qw=0		
		--佩戴翅膀
		elseif DmFindPic('peidaicb.bmp',85,541,333,554,343) then
			click(x,y)mSleep(1000)
		--翅膀佩戴完成
		elseif (DmFindPic('xiexia.bmp',85,577,331,593,339) or DmFindPic('xiexia1.bmp',85,543,330,558,343) )and (DmFindPic('x_cb.bmp',85,1097,39,1110,52) or DmFindPic('x_cb1.bmp',85,1095,38,1112,53) )then
			click(x,y)
		--章节奖励
		elseif DmFindPic('zhangjie.bmp',85,546,492,559,502) or DmFindPic('zhangjie1.bmp',85,544,487,556,497) then
			click(x,y)
			lq=0
			qw=0
		elseif DmFindPic('anniuzhuansheng.bmp',85,859,578,873,592) and DmFindPic('x_zhuansheng.bmp',85,1091,42,1102,53) then		
			click(x,y)			
		--前往转身
--[[		elseif DmFindPic('qianwangzhuansheng.bmp',85,438,397,451,408) then
			click(x,y)--]]
--[[		--转生关闭窗口不见了
		elseif DmFindPic('xuqiudengji.bmp',80,792,438,802,457) and DmFindPic('x_zhuansheng.bmp',85,1091,42,1102,53) then		
			click(x,y)
		elseif DmFindPic('xuqiudengji.bmp',80,792,438,802,457) and DmFindPic('x_zhuansheng.bmp',85,1091,42,1102,53)==false then
			kill()
		--转生成功
		elseif DmFindPic('zhuanshengchenggong.bmp',85,545,509,558,521) then
			click(x,y)
		--转生按钮
		elseif DmFindPic('anniuzhuansheng.bmp',85,859,578,873,592) then
			click(x,y)		--]]
		--一键满星
		elseif DmFindPic('yijianmanxing.bmp',85,1005,494,1017,513) then
			click(x,y)
		--日常前往	
		elseif DmFindPic('richangqianwang.bmp',85,958,583,968,594) then
			click(x,y)
		--日常任务完成
		elseif DmFindPic('richangwancheng.bmp',85,724,583,734,593) then
			click(x,y)			
		--回城复活
		elseif DmFindPic("huichengfuhuo.bmp",85,500,363,516,377) then
			click(x,y)	mSleep(5000)
			maiyao()
		--离开恶魔广场确定
		elseif DmFindPic("likaima.bmp",80,579,345,591,369) and DmFindPic("likaiqueding.bmp",80,459,391,472,409) then
			click(x,y)
		--任务恶魔广场
		elseif DmFindPic("mingxiang.bmp",80,383,519,395,533) and DmFindPic("emoditu.bmp",80,996,18,1008,29) and DmFindPic("likaiemo.bmp",80,902,31,914,48) then
			click(x,y)	
		else
			mSleep(300)
			connect()
		end
	end
end

--判断是否能够进入古战场
function yunxu()
	jdwlLog('判断是否能够进入古战场')
	local count=0
	local isok=0
	local cnt=0
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438) then
			click(x,y)			
		elseif isok>0 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			if isok==1 then
				jdwlLog('可以进入古战场')
				return true
			elseif isok==2 then
				jdwlLog('进不了古战场')
				return false
			elseif isok==3 then
				jdwlLog('在古战场了')
				return true
			end
		--已经在古战场
		elseif DmFindPic('likaiguzhanchang.bmp',85,903,35,917,46) then
			isok=3
		elseif isok>0 and DmFindPic('x_huodong.bmp',85,1095,42,1108,55) then
			click(x,y)
		--屏蔽玩家
		elseif DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438) then
			click(x,y)	
		--点击活动
		elseif DmFindPic('huodong.bmp',85,732,151,745,160) then
			click(x,y)
		elseif count > 4 and DmFindPic('huiguzhanchang.bmp',85,76,388,99,408) then
			isok=2
		--活动打开之后点击灰色古战场栏
		elseif DmFindPic('huiguzhanchang.bmp',85,76,388,99,408) then
			click(x,y)
			count=count + 1
		--选中古战场之后出现进入按钮则表示可以进入
		elseif DmFindPic('liangguzhanchang.bmp',85,78,390,97,408) and DmFindPic('jinruguzhanchang.bmp',85,958,569,969,582) then
			isok=1
		--活动图标都没出来
		elseif cnt>3 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			isok=2
		--菜单栏回缩
		elseif DmFindPic('huodong.bmp',85,732,151,745,160)==false and DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPic('head.bmp',85,12,46,21,57) then
			click(x,y)mSleep(1000)
			cnt=cnt+1
		else
			mSleep(500)
			connect()
		end
	end
end

--古战场挂机
function guzhanchang()
	jdwlLog('古战场挂机')
	local ismove=0
	local isok=0
	local ts=0
	local zb = {{440,209},{416,217},{368,253},{364,284},{329,308},{376,383},{418,427},{458,436},{489,483},{540,437},{595,370},{481,253},{524,267},{497,299},{537,309}}
	math.randomseed(tostring(os.time()):reverse():sub(1,6))		
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438) then
			click(x,y)	
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('古战场完结')
			break
		--地图倒三角
		elseif DmFindPic('daosanjiao.bmp',85,1113,23,1125,32) then
			click(x,y)mSleep(1000)
		--背包满了
		elseif DmFindPic('beibaoman.bmp',80,919,292,932,305) or DmFindPic('beibaoman1.bmp',80,932,295,942,305) then
			beibao()			
		--点击活动
		elseif DmFindPic('map_gu.bmp',85,1022,17,1036,31)==false and DmFindPic('huodong.bmp',85,732,151,745,160) then
			click(x,y)		
			ismove = 0			
		--前往挂机地点
		elseif DmFindPic('zidongxunlu.bmp',85,499,163,508,171) then
			ismove = 1
		elseif ismove == 1 and DmFindPic('zidongxunlu.bmp',85,499,163,508,171) ==false and DmFindPic('kaishiguaji.bmp',85,944,452,958,460) then
			click(x,y)mSleep(1000)
		--正在挂机中
		elseif DmFindPic('map_gu.bmp',85,1022,17,1036,31) and DmFindPic('zidongzhandou.bmp',85,503,161,510,169) then
			if ts==0 then
				zhandouli()
				ts=1
			end
		--地图栏显示已经在古战场
		elseif DmFindPic('map_gu.bmp',85,1022,17,1036,31) then--1036,126
			click(x+14,y+110)
		--菜单栏回缩
		elseif DmFindPic('huodong.bmp',85,732,151,745,160)==false and DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPic('head.bmp',85,12,46,21,57) then
			click(x,y)mSleep(1000)		
		--活动打开之后点击灰色古战场栏
		elseif DmFindPic('huiguzhanchang.bmp',85,76,388,99,408) then
			click(x,y)		
		elseif isok==1 and DmFindPic('x_huodong.bmp',85,1095,42,1108,55) then
			click(x,y)
		--古战场时间耗尽
		elseif DmFindPic('over.bmp',85,397,575,412,595) and DmFindPic('jinruguzhanchang.bmp',85,958,569,969,582) then
			isok=1
		--选中古战场之后出现进入按钮则表示可以进入
		elseif DmFindPic('liangguzhanchang.bmp',85,78,390,97,408) and DmFindPic('jinruguzhanchang.bmp',85,958,569,969,582) then
			click(x,y)
		--古战场地图打开之后
		elseif DmFindPic('quyuliang.bmp',85,63,173,81,191) and DmFindPic('datitu.bmp',85,534,43,548,57) then
			local xx = zb[math.random(1,15)]
			click(xx[1],xx[2])mSleep(1000)
			ismove=1
			--关闭地图
			if DmFindPic('x_ditu.bmp',85,1090,41,1100,54) then
				click(x,y)
			end
		--点到天使圣殿
		elseif DmFindPic('x_shengwang.bmp',85,779,157,793,172) or DmFindPic('x_tianshi.bmp',85,1094,44,1107,58) then
			click(x,y)
		else
			mSleep(500)
			connect()
		end
	end
end

--挂机等待进入恶魔广场
function emgc()
	jdwlLog('开始恶魔广场')
	local isguwu = 0
	local isboss = 0
	local bosstime=os.time()
	local start=os.time()
	local cs=os.time()
	local count=0
	local clk=0
	local guwucs=0
	local kz=0
	while true do
		local sj,ms=emtime()
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438) then
			click(x,y)		cs=os.time()
		elseif DmFindPic("emfh1.bmp",80,502,364,516,378) or DmFindPic("emfh.bmp",80,499,230,513,247) then
			click(x,y)
		elseif kz > 30 and ((sj >=30 and sj <43) or (sj >0 and sj <13)) and DmFindPic('fbxx.bmp',85,996,21,1012,30) and DmFindPic('beibao.bmp',85,846,614,858,626) then
			os.execute("reboot")
		elseif ((sj >=30 and sj <43) or (sj >0 and sj <13)) and DmFindPic('fbxx.bmp',85,996,21,1012,30) and DmFindPic('beibao.bmp',85,846,614,858,626) then
			kz=kz+1
			mSleep(1000)
		--进入恶魔广场	
		elseif ((sj>=15 and sj <17) or (sj>=45 and sj<47)) and DmFindPic('fbxx.bmp',85,996,21,1012,30)==false and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jinru()
			isguwu = os.time()
			isboss=0
			bosstime=0
			cs=os.time()
		--点击鼓舞	
		elseif os.difftime(os.time(),isguwu) > 122 and DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPic('guwu.bmp',85,950,351,960,360) then
			click(x,y)
			cs=os.time()
			guwucs=guwucs+1
			kz=0
		--鼓舞确定
		elseif DmFindPic('guwuqueding.bmp',85,548,421,562,431) or DmFindPic("guwuqueding1.bmp",80,461,396,474,410)	then
			click(x,y)
			isguwu = os.time()
			cs=os.time()
		--鼓舞还有
		elseif DmFindPic('guwuquxiao.bmp',85,635,394,646,409) then
			click(x,y)	
			cs=os.time()		
		elseif clk>10 and DmFindPic('fbxx.bmp',85,996,21,1012,30) and DmFindPic('kaishiguaji.bmp',85,944,452,958,460) then
			kill()
			clk=0
			jdwlLog("卡死了")
		elseif isboss==0 and DmFindPic('fbxx.bmp',85,996,21,1012,30) and DmFindPic('kaishiguaji.bmp',85,944,452,958,460) then
			click(x,y)
			isguwu=os.time()
			cs=os.time()
			clk=clk+1
			mSleep(1000)
		elseif isboss == 1 and DmFindPic('fbxx.bmp',85,996,21,1012,30) and DmFindPic('quxiaoguaji.bmp',85,961,453,972,462)  then
			local wait=0
			bosstime=os.time()
			for wait = 1,5 do
				mSleep(1000)
			end
			if DmFindPic('fbxx.bmp',85,996,21,1012,30) and DmFindPic('quxiaoguaji.bmp',85,961,453,972,462) then
				click(x,y)
			end		
			cs=os.time()	
		elseif isboss == 1 and DmFindPic('fbxx.bmp',85,996,21,1012,30) and DmFindPic('beibao.bmp',85,846,614,858,626) then
			--释放技能
			if DmFindPic('diyihuo.bmp',85,1065,352,1075,362) or DmFindPic('jiguang.bmp',85,1066,447,1078,459) or DmFindPic('heilongbo.bmp',85,952,559,963,570) then
				click(x,y)mSleep(300)
			end
			if DmFindPic('baluoke.bmp',85,339,48,357,62) == false and os.difftime(os.time(),bosstime) > 60 then
				mSleep(3000)
				quanquan(300)
				quanquan(500)
				bosstime = bosstime - 10
			end	
			cs=os.time()
		--巴洛克出现
		elseif DmFindPic('baluoke.bmp',85,339,48,357,62) then	
			isboss = 1
			cs=os.time()
		--判断是否还有次数
		elseif os.difftime(os.time(),start) > 60 and DmFindPic('fbxx.bmp',85,996,21,1012,30)==false then
			if jinru()==false then
				jdwlLog('次数没了')
				break
			end
			start = os.time()
			isboss = 0
			cs=os.time()
		--进恶魔点到	地图
		elseif DmFindPic('emo.bmp',85,576,49,589,60) and DmFindPic('x_em.bmp',85,1088,41,1103,52) then
			click(x,y)	mSleep(500)
			cs=os.time()	
		--超时
		elseif os.difftime(os.time(),cs)> 180 or count >8 then
			kill()
			jdwlLog("恶魔广场超时")
			isguwu = 0
			isboss = 0
			bosstime=os.time()
			start=os.time()
			cs=os.time()
			count=0
		--领取恶魔广场奖励
		elseif DmFindPic('lingqujiangli.bmp',85,524,570,538,581) then
			click(x,y)		
			count=count+1
			mSleep(2000)				
		--原地复活
		elseif DmFindPic("yuandifuhuo.bmp",85,496,234,508,246) or DmFindPic("fuhuo.bmp",85,498,232,509,245) then
			mSleep(500)
			click(x,y)
		--回城复活
		elseif DmFindPic("huichengfuhuo.bmp",85,500,363,516,377) then
			click(x,y)
		else
			mSleep(300)
			connect()
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

--转圈圈
function quanquan(yanshi)
--157,486
--186,501
--195,526
--185,550
--158,565
--129,554
--117,525
--131,499
local t={{157,486},{186,501},{195,526},{185,550},{158,565},{129,554},{117,525},{131,499}}
	local i=0
	for i=1,8 do
		touchDown(0,t[i][1],t[i][2])
		mSleep(yanshi)
		touchUp(0)
		mSleep(100)
	end
end

--判断时间是否到达恶魔广场时间
function emtime()
	local tt = os.date('*t',t)
	local mins = tt.min
	local sec = tt.sec
	return mins,sec	
end

--进入恶魔广场
function jinru()
	jdwlLog('进入恶魔广场')
	local start=os.time()
	while true do

		if os.difftime(os.time(),start) > 150 then
			kill()
			jdwlLog("进入恶魔广场超时")
			start=os.time()
		--屏蔽玩家
		elseif DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)				
		--已经在恶魔广场
		elseif DmFindPic('fbxx.bmp',85,996,21,1012,30) then
			jdwlLog('身在恶魔广场')
			return true
		--点击活动
		elseif DmFindPic('huodong.bmp',85,732,151,745,160) then
			click(x,y)mSleep(1000)
		--菜单栏回缩
		elseif DmFindPic('huodong.bmp',85,732,151,745,160)==false and DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPic('head.bmp',85,12,46,21,57) then
			click(x,y)mSleep(1000)	
		--打开活动之后点击恶魔广场
		elseif DmFindPic('emoguangchang.bmp',85,254,109,272,124) then--315,255
			click(x+60,y+146)mSleep(1000)
		--恶魔次数用尽
		elseif DmFindPic('hongsan.bmp',85,537,437,549,456) and DmFindPic('jinruemo.bmp',85,909,593,921,606) then--1103,38
			click(1103,38)
			return false
		--恶魔凭证红色/进入恶魔广场按钮
		elseif DmFindPic('hsempz.bmp',85,149,222,164,237) and DmFindPic('jinruemo.bmp',85,909,593,921,606) then
			--购买恶魔凭证
			if goumai()	== 0 then
				jdwlLog("没钱买恶魔凭证")
				return false
			end
		--满足条件进入
		elseif DmFindPic('sanci.bmp',85,537,436,549,457) and DmFindPic('jinruemo.bmp',85,909,593,921,606) then
			click(x,y)
			local tt=os.time()
			while os.difftime(os.time(),tt) < 5 do
			--如果还停留在恶魔进入界面则关闭
				if DmFindPic('x_emo.bmp',85,1096,43,1106,55) then
					click(x,y)mSleep(500)
				end
			end
			jdwlLog('成功进入')
			return true
		else
			mSleep(300)
			connect()
		end
	end
end

--购买药品
function maiyao()
	jdwlLog("买药")
	local isok=0
	local lan=0
	local hong=0
	local start=os.time()
	local zd=0
	while true do
		if os.difftime(os.time(),start) > 120 then
			jdwlLog("买药超时")
			isok=0
			lan=0
			hong=0
			zd=0
			start=os.time()
			kill()
		--屏蔽玩家
		elseif DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438) then
			click(x,y)		
		elseif isok==1 and DmFindPic("x_maiyao.bmp",85,1089,42,1106,55) then
			click(x,y)
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog("买药完成")
			break
		--打开背包
		elseif DmFindPic('beibao.bmp',85,846,614,858,626) then
			click(x,y)
		--点击货币
		elseif DmFindPic('zhengli.bmp',85,1010,586,1023,597) and DmFindPic('huobi.bmp',85,77,220,95,232) then
			click(x,y)
		--金币前往
		elseif DmFindPic("jinbiqianwang.bmp",85,960,211,971,225) then
			click(x,y)mSleep(3000)
		elseif hong==0 and DmFindPic("hongyao.bmp",85,88,157,99,169) then
			click(x,y)
			hong=1
		elseif lan== 0 and DmFindPic("lanyao.bmp",85,373,261,382,276) then
			click(x,y)
			lan=1
		elseif zd==0 and DmFindPic("zuiduo.bmp",85,706,415,718,427) then
			click(x,y)
			zd=1
		elseif DmFindPic("maiyao.bmp",85,825,459,836,471) then
			click(x,y)
			if lan==1 then
				isok=1
			end
			zd=0
		else
			mSleep(300)
			connect()
		end
	end
end

--购买一个恶魔凭证
function goumai()
	jdwlLog('购买恶魔凭证')
	local count = 0
	local cnt=0
	local isok=0
	local start=os.time()
	local sctime=os.time()
	local qian=0
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438) then
			click(x,y)	
		elseif DmFindPic('juesejinru.bmp',85,519,572,532,583) or DmFindPic('juesejinru1.bmp',85,516,572,530,587) then			
			click(x,y)
		elseif os.difftime(os.time(),start) > 180 then
			kill()
			jdwlLog("购买恶魔凭证超时")
			count=0
			nt=0
			isok=0
			qian=0
			start=os.time()
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('恶魔凭证购买完成')
			return qian			
		elseif isok==1 and DmFindPic('x_shangcheng.bmp',85,1092,35,1104,47) then
			click(x,y)
		--如果还停留在恶魔进入界面则关闭
		elseif DmFindPic('x_emo.bmp',85,1096,43,1106,55) then
			click(x,y)
		--打开背包
		elseif DmFindPic('beibao.bmp',85,846,614,858,626) then
			click(x,y)
		--点击货币
		elseif DmFindPic('zhengli.bmp',85,1010,586,1023,597) and DmFindPic('huobi.bmp',85,77,220,95,232) then
			click(x,y)
		--绑钻前往
		elseif DmFindPic('bangzuanqianwang.bmp',85,964,392,974,402) then
			click(x,y)		
		elseif os.difftime(os.time(),sctime) > 30 and DmFindPic('x_shangcheng.bmp',85,1092,35,1104,47) then
			click(x,y)
			sctime=os.time()			
		--商店绑钻类未选中
		elseif DmFindPic('huibangzuan.bmp',85,829,101,850,114) then
			click(x,y)			
		elseif DmFindPic('empz.bmp',75,357,139,433,534) then
			click(x,y)
		elseif count > 3 and DmFindPic('bangzuanlei.bmp',85,764,104,779,115) then--1100,45
			click(x+336,y-60)
			count = 0
		--确定在绑钻类页面
		elseif DmFindPic('bangzuanlei.bmp',85,764,104,779,115) then
			myMove_UD(853,433,846,336,10)mSleep(1000)
			count= count+1
		elseif cnt>0 and DmFindPic('x_gm.bmp',85,789,117,799,128) then
			click(x,y)
			isok=1
		--没钱
		elseif DmFindPicFuzzy("15.bmp",90,501,463,525,482,0xffffff)	and DmFindPic('gmpz.bmp',85,824,457,836,470) then
			click(x,y)
			cnt=cnt+1
			qian=0
			isok=1
		--购买按钮
		elseif DmFindPicFuzzy("15.bmp",90,501,463,525,482,0xffffff)==false and DmFindPic('gmpz.bmp',85,824,457,836,470) then
			click(x,y)
			cnt=cnt+1
			isok=1
			qian=1
		--购买恶魔凭证灰关闭窗口
		elseif DmFindPic('x_heishangcheng.bmp',85,1094,33,1109,48) then
			click(x,y)			
		else
			mSleep(300)
			connect()
		end
	end
end

--前往仙踪林
function xianzonglin()
	jdwlLog("前往仙踪林")
	local isok = 0
	local start=os.time()
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)
		elseif DmFindPic('x_duihua.bmp',85,1004,219,1016,232) then 
			click(x,y)
		elseif os.difftime(os.time(),start) > 180 then
			kill()
			jdwlLog("前往仙踪林超时")
			start=os.time()	
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog("已经在仙踪林")
			break
		elseif DmFindPic("xian.bmp",85,1013,18,1029,32) then
			isok=1
		--地图倒三角
		elseif DmFindPic('daosanjiao.bmp',85,1113,23,1125,32) then
			click(x,y)mSleep(1000)	
		--打开地图
		elseif DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPic('sanjiao.bmp',85,1112,20,1120,33) then
			click(1039,120)mSleep(1000)		
		--点击世界地图
		elseif DmFindPic('sjdt.bmp',85,92,103,111,123) then
			click(x,y)
		--点击地图上的仙踪林
		elseif DmFindPic('xzl.bmp',85,366,432,377,449) then
			click(x,y)mSleep(2000)
			--关闭地图
			local tt=os.time()
			while os.difftime(os.time(),tt) <3 do
				if DmFindPic('x_sjdt.bmp',85,1091,39,1104,51) then
					click(x,y)
				end
			end
		else
			mSleep(300)
			connect()
		end
	end
end

--前往冰风谷
function bingfenggu()
	jdwlLog('前往冰风谷')
	local isok=0
	local start=os.time()
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)
		elseif os.difftime(os.time(),start) > 180 then
			kill()
			jdwlLog("前往冰风谷超时")
			start=os.time()
		--到冰风谷了                                                               
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('到达冰风谷')
			break		
		--地图倒三角
		elseif DmFindPic('daosanjiao.bmp',85,1113,23,1125,32) then
			click(x,y)mSleep(1000)
		--到达冰风谷
		elseif DmFindPic('bingfenggu.bmp',85,1002,17,1018,33) then
			isok=1
		--点击世界地图上的冰风谷
		elseif DmFindPic('bfg.bmp',85,360,254,372,267) then
			click(x,y)mSleep(1000)
						--关闭地图
			local tt=os.time()
			while os.difftime(os.time(),tt) <3 do
				if DmFindPic('x_sjdt.bmp',85,1091,39,1104,51) then
					click(x,y)
				end
			end
		--打开地图
		elseif DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPic('sanjiao.bmp',85,1112,20,1120,33) then
			click(1039,120)mSleep(1000)
		--点击世界地图
		elseif DmFindPic('sjdt.bmp',85,92,103,111,123) then
			click(x,y)
		elseif DmFindPic('x_duihua.bmp',85,1004,219,1016,232) then	
			click(x,y)
		else
			mSleep(300)
			connect()
		end
	end
end

--判断背包是否有东西
function bubangding()
	jdwlLog('判断背包是否有东西')
	local isok=0
	local start=os.time()
	local you=0
	while true do
		if os.difftime(os.time(),start) > 180 then
			kill()
			jdwlLog("判断背包超时")
			you=0
			isok=0
			start=os.time()
		elseif DmFindPic('x_liaotian.bmp',85,1090,39,1104,52)	then
			click(x,y)
		--屏蔽玩家
		elseif DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)	
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('判断背包是否有东西完成')
			return you
		elseif isok==1 and (DmFindPic('x_cb.bmp',85,1097,39,1110,52) or DmFindPic('x_cb1.bmp',85,1095,38,1112,53))then
			click(x,y)
		--打开背包
		elseif DmFindPic('beibao.bmp',85,846,614,858,626) then		
			click(x,y)
		elseif DmFindPic('zhengli.bmp',85,1010,586,1023,597) then
			notifyMsg('开始检查背包')mSleep(2000)
			local  tt=os.time()
			while os.difftime(os.time(),tt) < 10 do
				if xunzhao() then
					notifyMsg('有东西')
					you=1
					isok=1
					break
				elseif DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
					click(x,y)
				elseif DmFindPic('jiaoyitishi.bmp',85,462,429,475,441) then--658,434
					click(658,434)					
				end
			end
			isok=1
		else
			mSleep(300)
			connect()
		end
	end
end

--前往固定地方
function guding()
	xianzonglin()
	jdwlLog("前往固定地方")
	local isok=0
	local start=os.time()
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)	
		elseif os.difftime(os.time(),start)	> 120 then
			kill()
			start=os.time()
			jdwlLog("前往固定地方")
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('前往固定地方')
			break
		elseif isok==1 and DmFindPic('x_sjdt.bmp',85,1091,39,1104,51) then
			click(x,y)mSleep(500)
		--地图倒三角
		elseif DmFindPic('daosanjiao.bmp',85,1113,23,1125,32) then
			click(x,y)	mSleep(1000)
		--打开小地图找npc
		elseif DmFindPic("xian.bmp",85,1013,18,1029,32)then
			click(1039,120)
		--药店老板莱亚
		elseif DmFindPic('bzd.bmp',85,856,312,873,332) or DmFindPic('bzd1.bmp',85,857,308,872,328) then
			click(x+5,y+5)mSleep(1500)
			
		--到达莱亚
		elseif DmFindPic('x_laiya.bmp',85,1003,224,1014,234) then
			click(x,y)
			isok=1

		else
			mSleep(500)
			connect()
		end
	end		
end

--前往勇者大陆药店交易
function yaodian()
	bingfenggu()
	jdwlLog('前往勇者药店')
	local isok=0
	local start=os.time()
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)	
		elseif os.difftime(os.time(),start)	> 120 then
			kill()
			start=os.time()
			jdwlLog("前往勇者药店超时")
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('到达勇者药店')
			break
		elseif isok==1 and DmFindPic('x_sjdt.bmp',85,1091,39,1104,51) then
			click(x,y)mSleep(500)
		--地图倒三角
		elseif DmFindPic('daosanjiao.bmp',85,1113,23,1125,32) then
			click(x,y)	mSleep(1000)
		--打开小地图找npc
		elseif DmFindPic('bingfenggu.bmp',85,1002,17,1018,33) then
			click(1039,120)
		--药店老板莱亚
		elseif DmFindPic('laiya.bmp',85,901,420,914,438) or DmFindPic('laiya1.bmp',85,896,415,909,434) then
			click(x+5,y+5)mSleep(500)
			
		--到达莱亚
		elseif DmFindPic('x_laiya.bmp',85,1003,224,1014,234) then
			click(x,y)
			isok=1
--[[		--走到福利官
		elseif DmFindPic('fuliguan.bmp',85,861,534,880,548) or DmFindPic('fuliguan1.bmp',85,863,531,882,542) then
			click(x+5,y+5)mSleep(500)
		--到达莱亚
		elseif DmFindPic('x_fuliguan.bmp',85,1001,222,1017,231) then
			click(x,y)
			isok=1	--]]
		--走到一个npc
--[[		elseif DmFindPic('npc.bmp',85,853,313,869,328) or DmFindPic('npc1.bmp',85,854,310,868,324) then
			click(x+5,y+5)mSleep(500)
		--到达莱亚
		elseif DmFindPic('x_fuliguan.bmp',85,1001,222,1017,231) then
			click(x,y)
			isok=1	--]]		
		else
			mSleep(500)
			connect()
		end
	end
end

--等待对方给东西
function shou()
	jdwlLog('开始收钱')
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)	
		--打开聊天
		elseif DmFindPic('liaotian.bmp',85,751,590,777,601) then
			click(x,y)	
		--选择私聊频道
		elseif DmFindPic('fasong.bmp',85,953,586,971,600) and DmFindPic('siliaopingdao.bmp',85,101,393,111,406) then
			click(x,y)
		--查看密语
		elseif DmFindPic('fasong.bmp',85,953,586,971,600) and DmFindPicFuzzy('siliao.bmp',85,246,408,291,535,0xffffff) then--329,422
			click(x+83,y+14)mSleep(1500)
		--对方面板打开交易对方
		elseif DmFindPic('jiaoyiduifang.bmp',85,891,548,906,558) then
			click(x,y)mSleep(1000)
		--点击锁定
		elseif DmFindPic('suoding.bmp',85,153,574,169,588) then
			click(x,y)
		--点击交易
		elseif DmFindPic('jiaoyianniu.bmp',85,436,575,452,587) then
			click(x,y)mSleep(1000)
		elseif DmFindPic('x_weizhijiaoyi.bmp',85,1096,37,1109,51) then
			click(x,y)			
		elseif DmFindPic('x_zhuangbei.bmp',85,785,33,800,44) then
			click(x,y)
		else
			mSleep(300)
			connect()
		end	
	end
end

--私聊交易
function jiaoyi()
	jdwlLog('私聊交易')
	local isok=0
	local issay=0
	local isdeal=0
	local cnt=0
	local fs=0
	local count=0
	local start=os.time()
	local jy=0
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)	
		--电池启动
		elseif DmFindPic('dianchi.bmp',85,20,68,31,77) then
			run()			
		elseif os.difftime(os.time(),start) > 300 and DmFindPic('dajiaoyi.bmp',85,595,51,613,62)==false then
			kill()
			jdwlLog("交易超时")
			isok=0
			issay=0
			cnt=0
			fs=0
			start=os.time()
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('交易完成')
			break
		elseif isok==1 and DmFindPic('x_liaotian.bmp',85,1090,39,1104,52) then
			click(x,y)
		elseif isok==1 and DmFindPic('jiaoyitishi.bmp',85,462,429,475,441) then--658,434
			click(658,434)	
		elseif fs > 20 and 	DmFindPic('x_liaotian.bmp',85,1090,39,1104,52) then
			click(x,y)
			fs=0
			fanhuijuese()
		elseif cnt > 5 and DmFindPic('x_liaotian.bmp',85,1090,39,1104,52) then
			click(x,y)
			if bubangding() == 0 then
				isok=1	
			end
			cnt=0
		elseif count >=1 and DmFindPic('x_liaotian.bmp',85,1090,39,1104,52) then
			click(x,y)
			if bubangding() == 0 then
				isok=1				
			else
				count=0
			end	
		--打开聊天
		elseif DmFindPic('liaotian.bmp',85,751,590,777,601) then
			click(x,y)
		--说话
		elseif issay==0 and DmFindPic('fasong.bmp',85,953,586,971,600) then--816,591
			local shuohua=math.random(3,6)
			for j=1,shuohua do
				mSleep(1000)
			end
			if DmFindPic('fasong.bmp',85,953,586,971,600) then
				click(x-137,y+5)mSleep(1000)
				local name = getname()
				if name~=nil then
					inputText(name.." zai")
					issay=1
				else
					notifyMsg("name error")
				end
				start=os.time()
			end	
		--发送说话
		elseif issay==1 and DmFindPic('fasong.bmp',85,953,586,971,600) then
			click(x,y)
			issay = 0
			mSleep(5000)
			fs=fs+1
			jy=0
		elseif count>1 and DmFindPic('jiaoyitishi.bmp',85,462,429,475,441) then
			click(658,434)
			if bubangding() == 0 then
				isok=1
			else
				count=0
			end	
		--取消交易
		elseif cnt<=6 and isdeal>1 and DmFindPic('jiaoyitishi.bmp',85,462,429,475,441) then--658,434
			click(658,434)
			if bubangding() == 0 then
				isok=1
			else
				cnt=0
				isdeal=0			
			end
		--弹出交易提示
		elseif DmFindPic('jiaoyitishi.bmp',85,462,429,475,441) then
			click(x,y)
			isdeal = 0
		--网络延时导致交易卡住
		elseif jy>20 and DmFindPic('dajiaoyi.bmp',85,595,51,613,62) and DmFindPic("x_jiaoyi.bmp",85,1093,43,1107,56) then
			click(x,y)
			jdwlLog("交易卡住了")
			isok=0
			issay=0
			isdeal=0
			cnt=0
			fs=0
			count=0
			jy=jy-5		
		--交易界面弹开
		elseif DmFindPic('dajiaoyi.bmp',85,595,51,613,62) then
			mSleep(2000)
			if isdeal==0 and DmFindPic('dajiaoyi.bmp',85,595,51,613,62) then
				cnt = give()
				--money()
				isdeal=isdeal + 1
				count=count+1
			--锁定
			elseif DmFindPic('suoding.bmp',85,153,574,169,588) and isdeal>0 then
				click(x,y)
			--交易按钮
			elseif DmFindPic('jiaoyianniu.bmp',85,436,575,452,587) and isdeal > 0 then
				click(x,y)mSleep(1000)
				jy=jy+1
			end
		--键盘弹起
		elseif DmFindPic('diqiu.bmp',85,179,596,194,610) or DmFindPic('diqiu1.bmp',85,152,596,167,613) then--975,601
			click(x+796,y+5)
		elseif DmFindPic("done.bmp",85,887,263,910,292) then
			click(x,y)
		else
			mSleep(500)
			connect()
		end
	end
end

--返回角色
function fanhuijuese()
	jdwlLog('返回角色')
	local start=os.time()
	while true do
		if os.difftime(os.time(),start) > 120 then
			jdwlLog("返回角色超时")
			kill()
			start=os.time()
		--屏蔽玩家
		elseif DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)			
		--点击系统设置
		elseif DmFindPic('xitongshezhi.bmp',85,845,167,856,177) then
			click(x,y)		
		elseif DmFindPic('x_liaotian.bmp',85,1090,39,1104,52) then
			click(x,y)
			
		elseif DmFindPic('juesejinru.bmp',85,519,572,532,583) or DmFindPic('juesejinru1.bmp',85,516,572,530,587) then
			jdwlLog('返回角色完成')
			break
		elseif DmFindPic('jiaoyitishi.bmp',85,462,429,475,441) then--658,434
			click(658,434)			
		--返回角色选择
		elseif DmFindPic('fanhuijuese.bmp',85,502,363,515,374) then
			click(x,y)
		--退出项未选中
		elseif DmFindPic('tuichuhei.bmp',85,363,163,378,176) then
			click(x,y)
		--点击功能按钮
		elseif DmFindPic('gongneng.bmp',85,805,63,818,74) then
			click(x,y)
		--菜单栏回缩
		elseif DmFindPic('fuli.bmp',85,652,40,662,48)==false and DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPic('head.bmp',85,12,46,21,57) then
			click(x,y)mSleep(1000)		
		--登录时候的广告
		elseif DmFindPic('close.bmp',85,1063,599,1086,612) or DmFindPic('close1.bmp',85,1063,599,1077,613) then
			click(x,y)	
		--到达莱亚
		elseif DmFindPic('x_laiya.bmp',85,1003,224,1014,234) then
			click(x,y)				
		--电池启动
		elseif DmFindPic('dianchi.bmp',85,20,68,31,77) then
			run()	
		--关闭福利
		elseif DmFindPic('x_fuli.bmp',85,1092,44,1106,56) then
			click(x,y)	
		--什么鬼确定
		elseif DmFindPic('smqueding.bmp',85,640,431,651,442) then
				click(x,y)
		--社么鬼确定
		elseif DmFindPic('smgqueding.bmp',85,637,430,649,443)	 then
				click(x,y)		
		elseif DmFindPic('smqd.bmp',85,638,430,653,442) then
			click(x,y)					
		--登录界面进入游戏
		elseif DmFindPic('denglujinru2.bmp',85,811,501,828,515) or DmFindPic("denglujinru1.bmp",85,807,501,823,512) then
			click(x,y)
		elseif DmFindPic("dengluyichang.bmp",85,550,488,563,498) or DmFindPic("dengluyichang1.bmp",80,547,487,562,500)	then
			click(x,y)
			kill()
			iGrimace()
			emgcms()
		else
			mSleep(300)
		end
	end
end

--获取当前时
function hours()
	local tm=os.date("*t")
	return tm.hour,tm.min
end

--获取名字
function getname()
	local file,l
	flag = ftpGet("ftp://192.168.1.200/lua/name.txt", "/var/touchelf/scripts/name.txt", "jdwl", "jdwl2014") -- 将FTP服务器192.168.1.100上路径为/a.txt的文件下载到/var/touchelf/a.txt
    if flag then
        notifyMessage("下载成功")
		file = io.open("/var/touchelf/scripts/name.txt","r")
			if file then
				for l in file:lines() do
					local name=Split(l,",")
					local index=tonumber(name[2])
					local tm,tmin=hours()
					if (tm >= 0 and tm<1) and index==1 then
						return name[1]
					elseif (tm >= 1 and tm <2) and index==2 then
						return name[1]
					elseif (tm >=2  and tm <3) and index==3 then
						return name[1]
					elseif (tm >=3 and tm <4) and index==4 then
						return name[1]
					elseif (tm >=4 and tm <5) and index==5 then
						return name[1]
					elseif (tm >=5 and tm <6) and index==6 then
						return name[1]
					elseif (tm >=6 and tm <7) and index==7 then
						return name[1]
					elseif (tm >=7 and tm <8) and index==8 then
						return name[1]
					elseif (tm >=8 and tm <9) and index==9 then
						return name[1]
					elseif (tm >=9 and tm <10) and index==10 then
						return name[1]	
					elseif (tm >=10 and tm <11) and index==11 then
						return name[1]		
					elseif (tm >=11 and tm <12) and index==12 then
						return name[1]		
					--二十四小时制		
					elseif (tm >=12 and tm <13) and index==13 then
						return name[1]		
					elseif (tm >=13 and tm <14) and index==14 then
						return name[1]		
					elseif (tm >=14 and tm <15) and index==15 then
						return name[1]		
					elseif (tm >=15 and tm <16) and index==16 then
						return name[1]			
					elseif (tm >=16 and tm <17) and index==17 then
						return name[1]		
					elseif (tm >=17 and tm <18) and index==18 then
						return name[1]		
					elseif (tm >=18 and tm <19) and index==19 then
						return name[1]		
					elseif (tm >=19 and tm <20) and index==20 then
						return name[1]		
					elseif (tm >=20 and tm <21) and index==21 then
						return name[1]		
					elseif (tm >=21 and tm <22) and index==22 then
						return name[1]		
					elseif (tm >=22 and tm <23) and index==23 then
						return name[1]		
					elseif (tm >=23 and tm <0) and index==24 then
						return name[1]		
					end	
				end	
			else
				return "muyou"
			end	
    else
        notifyMessage("下载失败")
		return "muyo"
    end
	
	--[[sname = file:read()
	return sname--]]
end


--寻找背包不绑定的材料
function xunzhao()
	jdwlLog('xunzhao')
	local wz,nz=0,1
	local a,b=0,0	
	local count = 0	
	while wz<=20 do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)	
		end
		--遍历背包
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
		if find_Onequyu(0x9433B8,85,658+a*93,172+b*93,668+a*93,178+b*93) then
			notifyMsg(wz)
			return true
		elseif find_Onequyu(0xA81B75,85,658+a*93,172+b*93,668+a*93,178+b*93) then
			notifyMsg(wz)	
			return true
		elseif find_Onequyu(0x992398,85,658+a*93,172+b*93,668+a*93,178+b*93) then
			notifyMsg(wz)	
			return true
		elseif find_Onequyu(0xAE31AE,85,658+a*93,172+b*93,668+a*93,178+b*93) then
			notifyMsg(wz)	
			return true
		--果实部分
		--652,102,733,183 --744,102,825,183
		--652,195,733,275
		elseif DmFindPic("tili.bmp",85,652+a*93,102+b*93,733+a*93,183+b*93) then
			notifyMsg(wz)	
			return true
		elseif DmFindPic("minjie.bmp",85,652+a*93,102+b*93,733+a*93,183+b*93) then
			notifyMsg(wz)	
			return true
		elseif DmFindPic("zhili.bmp",85,652+a*93,102+b*93,733+a*93,183+b*93) then
			notifyMsg(wz)	
			return true
		elseif DmFindPic("liliang.bmp",85,652+a*93,102+b*93,733+a*93,183+b*93) then
			notifyMsg(wz)	
			return true
		--以下4/19更改	
--[[		if find_Onequyu(0xB03DCE,85,658+a*93,172+b*93,668+a*93,178+b*93) then --0x912AAE 0xB03DCE
			wz=wz+1
			return true--]]
--[[		--亮闪闪晶石
		elseif find_Onequyu(0x9F34C8,85,658+a*93,172+b*93,668+a*93,178+b*93) then
			wz=wz+1	
			click(x,y)
			return true
		--亮闪闪其他职业武器
		elseif find_Onequyu(0xA62698,85,658+a*93,172+b*93,668+a*93,178+b*93) then
			wz=wz+1	
			click(x,y)
			return true	--]]			
		elseif DmFindPic('jiaoyitishi.bmp',85,462,429,475,441) then--658,434
			click(658,434)			
		else
			wz=wz+1
		end
	end	
	return false
end

--交易的时候给出不绑定材料
function give()
	jdwlLog('交易:给出不绑定材料')
	local wz,nz=0,1
	local a,b=0,0	
	local count = 0
	while wz<=20 do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435)or DmFindPic('dx.bmp',85,519,422,530,438) then
			click(x,y)	
		--有角色直接进入游戏
		elseif DmFindPic('juesejinru.bmp',85,519,572,532,583) or DmFindPic('juesejinru1.bmp',85,516,572,530,587)  then
			click(x,y)				
		end
		--键盘弹起
		if DmFindPic('diqiu.bmp',85,179,596,194,610) or DmFindPic('diqiu1.bmp',85,152,596,167,613) then--975,601
			click(x+796,y+5)
		elseif DmFindPic("done.bmp",85,887,263,910,292) then
			click(x,y)
		end
		--遍历背包
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
		--修改之后只交易亮闪闪的东西给对方 4/19修改
		if find_Onequyu(0x9433B8,80,658+a*93,172+b*93,668+a*93,178+b*93) then
			click(x+20,y-20)
			wz=wz+1
			nz=2
		elseif find_Onequyu(0xA81B75,80,658+a*93,172+b*93,668+a*93,178+b*93) then
			click(x+20,y-20)
			wz=wz+1
			nz=2		
		elseif find_Onequyu(0x992398,80,658+a*93,172+b*93,668+a*93,178+b*93) then
			click(x+20,y-20)
			wz=wz+1
			nz=2		
		elseif find_Onequyu(0xAE31AE,80,658+a*93,172+b*93,668+a*93,178+b*93) then
			click(x+20,y-20)
			wz=wz+1
			nz=2		
		elseif find_Onequyu(0x782D96,80,658+a*93,172+b*93,668+a*93,178+b*93) then
			click(x+20,y-20)
			wz=wz+1
			nz=2	
		--果实部分
		--652,102,733,183 --744,102,825,183
		--652,195,733,275
		elseif DmFindPic("tili.bmp",85,652+a*93,102+b*93,733+a*93,183+b*93) then
			click(x+20,y-20)
			wz=wz+1
			nz=2	
		elseif DmFindPic("minjie.bmp",85,652+a*93,102+b*93,733+a*93,183+b*93) then
			click(x+20,y-20)
			wz=wz+1
			nz=2	
		elseif DmFindPic("zhili.bmp",85,652+a*93,102+b*93,733+a*93,183+b*93) then
			click(x+20,y-20)
			wz=wz+1
			nz=2	
		elseif DmFindPic("liliang.bmp",85,652+a*93,102+b*93,733+a*93,183+b*93) then
			click(x+20,y-20)
			wz=wz+1
			nz=2			
		--以下4/19更改	
		--亮闪闪本职业武器	
--[[		if find_Onequyu(0xB03DCE,85,658+a*93,172+b*93,668+a*93,178+b*93) then--0xB03DCE  0x912AAE
			click(x+20,y-20)
			wz=wz+1
			nz=2	--]]
		--亮闪闪晶石
--[[		elseif find_Onequyu(0x9F34C8,85,658+a*93,172+b*93,668+a*93,178+b*93) then
			click(x+20,y-20)
			wz=wz+1
			nz=2		
		--亮闪闪其他职业武器
		elseif find_Onequyu(0xA62698,85,658+a*93,172+b*93,668+a*93,178+b*93) then
			click(x+20,y-20)
			wz=wz+1
			nz=2	--]]											
		else
			wz=wz+1
			nz=1
		end
		mSleep(100)
		if nz==2 then
			--放入/装备
			if DmFindPic('fangruzhuangbei.bmp',80,804,483,873,565) or DmFindPic('fangruzhuangbei.bmp',80,946,485,988,553) then
				click(x,y)
				count = count + 1
			--放入堆叠创造玛雅羽毛灵魂祝福
			elseif DmFindPic('fangru1.bmp',85,823,326,835,335) then
				click(x,y)
				count = count + 1
			--放入堆叠生命
			elseif DmFindPic('fangru2.bmp',85,822,317,837,326) then
				click(x,y) 
				count = count + 1
			--放入单个创造玛雅羽毛灵魂祝福
			elseif DmFindPic('fangru3.bmp',85,820,289,833,297) then
				click(x,y) 
				count = count + 1
			--放入单个生命
			elseif DmFindPic('fangru4.bmp',85,820,276,832,288) then
				click(x,y) 	
				count = count + 1
			--放入单个果实
			elseif DmFindPic("fangru5.bmp",85,822,349,836,359) then
				click(x,y)
				count = count + 1
			--放入多个果实
			elseif DmFindPic("fangru6.bmp",85,823,381,839,395) then
				click(x,y)
				count = count + 1
			elseif DmFindPic('x_weizhijiaoyi.bmp',85,1096,37,1109,51) then
				click(x,y)
			end
			if count < 7 then
				wz=wz-1
			end
		end	
		
		if DmFindPic('x_weizhijiaoyi.bmp',85,1096,37,1109,51) then
			click(x,y)
		end
		mSleep(200)
	end
	jdwlLog("东西给完了")
	return count
end

function haiyouma()
	local wz,nz=0,1
	local a,b=0,0	
	local count = 0	
	while wz<=20 do
		--遍历背包
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
--[[		if find_Onequyu(0x9433B8,80,658+a*93,172+b*93,668+a*93,178+b*93) then
			wz=wz+1
			return true
		elseif find_Onequyu(0xA81B75,80,658+a*93,172+b*93,668+a*93,178+b*93) then
			wz=wz+1	
			return true
		elseif find_Onequyu(0x992398,80,658+a*93,172+b*93,668+a*93,178+b*93) then
			wz=wz+1
			return true
		elseif find_Onequyu(0xAE31AE,80,658+a*93,172+b*93,668+a*93,178+b*93) then
			wz=wz+1
			return true			
		elseif find_Onequyu(0x782D96,80,658+a*93,172+b*93,668+a*93,178+b*93) then
			wz=wz+1		
			return true	--]]		
		if find_Onequyu(0x912AAE,85,658+a*93,172+b*93,668+a*93,178+b*93) then
			wz=wz+1
			return true
		--亮闪闪晶石
		elseif find_Onequyu(0x9F34C8,85,658+a*93,172+b*93,668+a*93,178+b*93) then
			wz=wz+1	
			return true
		--亮闪闪其他职业武器
		elseif find_Onequyu(0xA62698,85,658+a*93,172+b*93,668+a*93,178+b*93) then
			wz=wz+1	
			return true			
		else
			wz=wz+1
		end	
	end
	return false
end

function money()
	local fier,yans=1,1
	jdwlLog("给钱")
	while (true) do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435)or DmFindPic('dx.bmp',85,519,422,530,438) then
			click(x,y)	
		elseif yans>=30 then 
			jdwlLog('钱给完了')
			return false
		elseif DmFindPic('jiaoyianniu.bmp',85,436,575,452,587) and fier==2 then 
			jdwlLog('钱给完了')
			return true
		--换行
		--键盘弹起
		elseif DmFindPic('diqiu.bmp',85,179,596,194,610) or DmFindPic('diqiu1.bmp',85,152,596,167,613) then--975,601
			click(x+796,y+5)
			fier=2
		elseif DmFindPic("done.bmp",85,887,263,910,292) then
			click(x,y)
			fier=2
		elseif DmFindPic('jiaoyianniu.bmp',85,436,575,452,587) then --451,373
			click(x+20,y-200)mSleep(1000)
			inputText("11111111")
			mSleep(300)
		elseif DmFindPic('x_weizhijiaoyi.bmp',85,1096,37,1109,51) then
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

--升级成就
function chengjiu()
	jdwlLog('升级成就')
	local isok=0
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)			
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('升级成就完成')
			break
		--打开背包
		elseif DmFindPic('beibao.bmp',85,846,614,858,626) then
			click(x,y)
		--点击货币
		elseif DmFindPic('zhengli.bmp',85,1010,586,1023,597) and DmFindPic('huobi.bmp',85,77,220,95,232) then
			click(x,y)
		--选中货币之后点击成就
		elseif DmFindPic('huobiliang.bmp',85,77,218,93,230) and DmFindPic('qianwangchengjiu.bmp',85,977,566,987,581) then
			click(x,y) mSleep(1000)
		--关闭成就界面	
		elseif isok==1 and DmFindPic('x_chengjiu.bmp',85,1092,43,1106,54) then
			click(x,y)
		--绿色提升
		elseif DmFindPic('chengjiutisheng.bmp',85,916,208,930,220) then
			click(x,y)
		--灰色提升
		elseif DmFindPic('huitisheng.bmp',85,952,207,963,220) then
			isok=1
		else
			mSleep(500)
			connect()
		end
	end
end

--升级翅膀
function chibang()
	jdwlLog('升级翅膀')
	local isok=0
	local isbuy=0
	local start=os.time()
	local count=0
	local cnt=0
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)			
		elseif os.difftime(os.time(),start)>180 then
			kill()
			jdwlLog("翅膀超时")
			isok=0
			isbuy=0
			count=0
			start=os.time()
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('升级翅膀完成')
			break
		--关闭翅膀
		elseif isok==1 and (DmFindPic('x_cb.bmp',85,1097,39,1110,52) or DmFindPic('x_cb1.bmp',85,1095,38,1112,53))then
			click(x,y)
		--到达二阶段
		elseif count>1 and DmFindPic("erjie.bmp",85,179,139,192,159) then
			isok=1
		--佩戴翅膀
		elseif DmFindPic('peidaicb.bmp',85,541,333,554,343) then
			click(x,y)			
		--打开背包
		elseif DmFindPic('beibao.bmp',85,846,614,858,626) then
			click(x,y)
		--点击翅膀
		elseif DmFindPic('zhengli.bmp',85,1010,586,1023,597) and DmFindPic('chibang.bmp',85,74,437,95,454) then
			click(x,y)mSleep(3000)
		elseif cnt > 2 and DmFindPic('yijie.bmp',80,179,139,189,158) then
			isok=1
		--翅膀一阶需要购买火种
		elseif isbuy==0 and DmFindPic('yijie.bmp',80,179,139,189,158) then
			huozhong()
			isbuy=1
			cnt=cnt+1
		--自动提升
		elseif isok==0 and (DmFindPic('zidongtisheng.bmp',85,778,566,787,578) or DmFindPic('zidongtisheng1.bmp',85,787,571,799,581))then
			click(x+10,y)
		--道具提升
		elseif isok==0 and (DmFindPic('daoju.bmp',85,784,491,795,503) or DmFindPic('daoju1.bmp',85,782,490,798,501)) then
			click(x+10,y)
		--材料不够
		elseif DmFindPic('x_cailiao.bmp',85,732,80,746,95) then
			click(x,y)
			count=count+1
			isbuy=0
		else
			mSleep(500)
			connect()
		end
	end
end

--一阶翅膀需要购买火种
function huozhong()
	jdwlLog('购买火种')
	local isok=0
	local one=0
	local three=0
	local isbuy=0
	local start=os.time()
	local sctime=os.time()
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)		
		elseif os.difftime(os.time(),start)	> 120 then
			kill()
			jdwlLog("购买火种超时")
			break
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('购买火种完成')
			break
		--打开背包
		elseif DmFindPic('beibao.bmp',85,846,614,858,626) then
			click(x,y)			
		--点击货币
		elseif DmFindPic('huobi.bmp',85,77,220,95,232) then
			click(x,y)		
		--绑钻前往
		elseif DmFindPic('bangzuanqianwang.bmp',85,964,392,974,402) then
			click(x,y)
		--商店绑钻类未选中
		elseif DmFindPic('huibangzuan.bmp',85,829,101,850,114) then
			click(x,y)
		--关闭商店
		elseif isok==1 and DmFindPic('x_shangcheng.bmp',85,1092,35,1104,47) then
			click(x,y)
		elseif isok==1 and DmFindPic('x_huozhong.bmp',85,790,100,802,112) then
			click(x,y)			
		--点击火种
		elseif isbuy ==0 and ( --[[DmFindPic("bangzuan.bmp",85,763,102,780,117) and--]] DmFindPic('huozhong1.bmp',85,939,518,956,531) )then
			click(x,y)
		--点击数量
		elseif isbuy==0 and DmFindPic('zuida.bmp',85,706,429,718,441) then--589,433
			click(x-120,y+5)
		--点击1
		elseif one==0 and (DmFindPic('one.bmp',85,447,276,466,305) or DmFindPic('one1.bmp',85,446,279,463,299) )then
			click(x,y)
			one=1
		--点击3
		elseif three == 0 and (DmFindPic('three.bmp',85,636,276,653,305) or DmFindPic('three1.bmp',85,635,278,653,303) ) then
			click(x,y)
			three = 1
		elseif isbuy == 1 and (DmFindPic('gm.bmp',85,825,474,838,485) or DmFindPic('gm1.bmp',85,827,473,840,485) )then
			click(x,y)
			isok=1
			mSleep(2000)
			sctime=os.time()
		--点击购买
		elseif (DmFindPic('goumai.bmp',85,742,459,757,474) or DmFindPic('goumai1.bmp',85,718,453,731,470) )then
			click(x,y)mSleep(2000)
			if (DmFindPic('goumai.bmp',85,742,459,757,474) or DmFindPic('goumai1.bmp',85,718,453,731,470))then
				click(x,y)
			end
			isbuy =1
		elseif os.difftime(os.time(),sctime) > 30 and  DmFindPic('x_shangcheng.bmp',85,1092,35,1104,47) then
			click(x,y)
			sctime=os.time()
		else
			mSleep(500)
			connect()
		end
	end
end

--兑换护身符
function hushenfu()
	jdwlLog('兑换护身符')
	local isok=0
	local dk=0
	local yjdh=0
	local start=os.time()
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)
		elseif os.difftime(os.time(),start)	> 180 then
			kill()
			jdwlLog("护身符超时")
			isok=0
			dk=0
			yjdh=0
			start=os.time()
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('兑换护身符完成')
			break	
		elseif isok==1 and (DmFindPic('x_cb.bmp',85,1097,39,1110,52) or DmFindPic('x_cb1.bmp',85,1095,38,1112,53) or DmFindPic('x_mojing.bmp',85,1093,39,1106,53))then
			click(x,y)
		--佩带装备
		elseif DmFindPic('peidai.bmp',85,712,507,724,519) or DmFindPic('peidai1.bmp',85,712,472,725,482) then
			click(x,y)	
			isok=1
		--打开背包
		elseif DmFindPic('beibao.bmp',85,846,614,858,626) then
			click(x,y)mSleep(1500)
		--背包亮了
		elseif dk==0 and DmFindPic('beibaoliang.bmp',85,45,299,65,313) then
			dk=1
		elseif dk==1 and DmFindPic('beibaoliang.bmp',85,45,299,65,313) and DmFindPic('hushenfu.bmp',85,559,143,571,156) then
			isok=1
		elseif yjdh==1 and DmFindPic('huobi.bmp',85,77,220,95,232) then
			click(x,y)
		elseif dk==1 and DmFindPic('beibaoliang.bmp',85,45,299,65,313) and DmFindPic('hushenfu.bmp',85,559,143,571,156)==false then
			yjdh=1
		--魔晶前往
		elseif DmFindPic('mojingqianwang.bmp',85,972,478,985,490) then
			click(x,y)
		--兑换
		elseif DmFindPic('duihuan.bmp',85,970,206,982,220) then
			click(x,y)mSleep(1000)
		--黑兑换
		elseif DmFindPic('heiduihuan.bmp',85,972,203,985,217) then
			isok=1
		else
			mSleep(500)
			connect()
		end
	end
end

--升级技能
function jineng()
	jdwlLog('升级技能')
	local isok=0
	local start=os.time()
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435)or DmFindPic('dx.bmp',85,519,422,530,438) then
			click(x,y)	
		elseif os.difftime(os.time(),start) > 180 then
			jdwlLog("升级技能超时")
			kill()
			start=os.time()
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('升级技能完成')
			break
		--佩带装备
		elseif DmFindPic('peidai.bmp',85,712,507,724,519) or DmFindPic('peidai1.bmp',85,712,472,725,482) then
			click(x,y)				
		elseif isok==1 and (DmFindPic('x_cailiao.bmp',85,732,80,746,95) or DmFindPic('x_cb.bmp',85,1097,39,1110,52) or DmFindPic('x_cb1.bmp',85,1095,38,1112,53)) then
			click(x,y)
		--打开背包
		elseif DmFindPic('beibao.bmp',85,846,614,858,626) then
			click(x,y)			
		--点击技能
		elseif DmFindPic('huijineng.bmp',85,43,369,59,387) then
			click(x,y)
		--技能选中
		elseif DmFindPic('liangjineng.bmp',85,43,369,60,386) and DmFindPic('jinengshengji.bmp',85,844,543,856,557) then
			local xx ={{351,167},{485,168},{621,170},{759,168},{892,169}}
			local index=math.random(1,5)
			click(xx[index][1],xx[index][2])
			click(x,y)
		--升级变灰
		elseif DmFindPic('huijinengtisheng.bmp',85,845,542,857,557) or DmFindPic('x_cailiao.bmp',85,732,80,746,95) then
			isok=1
		else
			mSleep(500)
			connect()
		end
	end
end

--强化武器
function wuqi()
	jdwlLog('强化武器')
	local isok=0
	local isfr=0
	local count=0
	local start=os.time()
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435)or DmFindPic('dx.bmp',85,519,422,530,438) then
			click(x,y)
		elseif os.difftime(os.time(),start)>180 then
			jdwlLog("强化武器超时")
			kill()
			isok=0
			isfr=0
			count=0
			start=os.time()
		--强化完成
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('强化武器完成')
			break
		elseif isok==1 and DmFindPic('x_duanlu.bmp',85,1091,39,1106,51) then
			click(x,y)
		--点击炼炉
		elseif DmFindPic('duanlu.bmp',85,308,64,321,76) or DmFindPic('duanlu1.bmp',85,381,64,393,79) then
			click(x,y)
		--菜单栏回缩
		elseif DmFindPic('duanlu.bmp',85,308,64,321,76)==false and DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPic('head.bmp',85,12,46,21,57) then
			click(x,y)mSleep(500)
			if DmFindPic('duanlu.bmp',85,308,64,321,76) or DmFindPic('duanlu1.bmp',85,381,64,393,79) then
				click(x,y)mSleep(1000)
			end
		--强化按钮
		elseif count > 7 and DmFindPic('qianghua.bmp',85,417,583,428,595) then
			isok=1
		elseif isfr==1 and DmFindPic('qianghua.bmp',85,417,583,428,595) then
			click(x,y)mSleep(500)
			count = count + 1
		--确认在炼炉界面
		elseif DmFindPic('dalianlu.bmp',85,551,51,568,62) and find_Onequyu(0x8A2EC0,85,831,242,841,253) then
			click(x+20,y-20)
			isfr = 1
		--没有紫色武器
		elseif DmFindPic('dalianlu.bmp',85,551,51,568,62) and find_Onequyu(0x8A2EC0,85,831,242,841,253) ==false then
			isok=1
		--材料不够
		elseif DmFindPic('x_cailiao.bmp',85,732,80,746,95) then
			click(x,y)
			isok=1
		else
			mSleep(500)
			connect()
		end
	end
end

--强化项链
function xianglian()
	jdwlLog('强化项链')		
	local isok=0
	local isfr=0
	local count=0
	local cnt=0
	local start=os.time()
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)
		elseif os.difftime(os.time(),start)>180 then
			kill()
			jdwlLog("强化项链超时")
			isfr=0
			count=0
			cnt=0
			start=os.time()
		--强化完成
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('强化项链完成')
			break
		elseif isok==1 and DmFindPic('x_duanlu.bmp',85,1091,39,1106,51) then
			click(x,y)
		--点击炼炉
		elseif DmFindPic('duanlu.bmp',85,308,64,321,76) or DmFindPic('duanlu1.bmp',85,381,64,393,79) then
			click(x,y)
		--菜单栏回缩
		elseif DmFindPic('duanlu.bmp',85,308,64,321,76)==false and DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPic('head.bmp',85,12,46,21,57) then
			click(x,y)mSleep(500)
			if DmFindPic('duanlu.bmp',85,308,64,321,76) or DmFindPic('duanlu1.bmp',85,381,64,393,79) then
				click(x,y)mSleep(1000)
			end
		--强化按钮
		elseif count > 7 and DmFindPic('qianghua.bmp',85,417,583,428,595) then
			isok=1
		elseif isfr==1 and DmFindPic('qianghua.bmp',85,417,583,428,595) then
			click(x,y)mSleep(500)
			count = count + 1
		--确认在炼炉界面
		elseif DmFindPic('dalianlu.bmp',85,551,51,568,62) and find_Onequyu(0x9031AE,85,829,354,843,369) then
			click(x+20,y-20)
			isfr = 1
		--没有紫色武器
		elseif DmFindPic('dalianlu.bmp',85,551,51,568,62) and find_Onequyu(0x9031AE,85,831,242,841,253) ==false and cnt > 3 then
			isok=1
		--项链需要滑动
		elseif DmFindPic('dalianlu.bmp',85,551,51,568,62) then	
			myMove_UD(872,558,873,327,10)mSleep(1000)
			cnt=cnt+1
		--材料不够
		elseif DmFindPic('x_cailiao.bmp',85,732,80,746,95) then
			click(x,y)
			isok=1
		else
			mSleep(500)
			connect()
		end
	end
end

--抽取精灵
function jingling()
	jdwlLog('抽取精灵')
	local isok=0
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435)or DmFindPic('dx.bmp',85,519,422,530,438) then
			click(x,y)	
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('抽取精灵完成')
			break		
		elseif isok==1 and DmFindPic('x_chouqu.bmp',85,1092,46,1106,59) then
			click(x,y)
		elseif DmFindPic('jingling.bmp',85,908,67,917,78) then			
			click(x,y)mSleep(500)
		--菜单栏回缩
		elseif DmFindPic('jingling.bmp',85,908,67,917,78)==false and DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPic('head.bmp',85,12,46,21,57) then
			click(x,y)mSleep(500)	
			if DmFindPic('jingling.bmp',85,908,67,917,78) then
				click(x,y)mSleep(1000)
			end
		--猎取
		elseif DmFindPic('liequ.bmp',85,685,217,698,227) then
			click(x,y)
		--点击抽取
		elseif DmFindPic('chouqu.bmp',85,368,599,384,611) then
			click(x,y)
		--钻石不够
		elseif DmFindPic('x_cailiao.bmp',85,732,80,746,95) then
			click(x,y)
			isok=1		
		--召唤确定
		elseif DmFindPic('zhaohuanqueding.bmp',85,903,586,913,600) then
			click(x,y)
		else
			mSleep(500)
			connect()
		end
	end
end

--祈福
function qifu()
	jdwlLog('祈福')
	local isok=0
	local iscl=0
	local count = 0
	local start=os.time()
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435)or DmFindPic('dx.bmp',85,519,422,530,438) then
			click(x,y)
		--有角色直接进入游戏
		elseif DmFindPic('juesejinru.bmp',85,519,572,532,583) or DmFindPic('juesejinru1.bmp',85,516,572,530,587)  then
			click(x,y)				
		elseif os.difftime(os.time(),start)	>180 then
			jdwlLog("祈福超时")
			kill()
			isok=0
			iscl=0
			count=0
			start=os.time()
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('祈福完成')
			break	
		elseif isok==1 and (DmFindPic('x_cangku.bmp',85,1093,41,1108,51) or DmFindPic('x_qifu.bmp',85,1091,46,1103,56)) then
			click(x,y)
		--打开背包
		elseif DmFindPic('beibao.bmp',85,846,614,858,626) then
			click(x,y)	
		elseif DmFindPic('huobi.bmp',85,77,220,95,232) then
			click(x,y)
		--钻石前往
		elseif DmFindPic('zuanshiqianwang.bmp',85,975,300,990,312) then
			click(x,y)mSleep(1000)
		--祈福
		elseif iscl==0 and DmFindPic('qifu.bmp',85,374,595,386,608) then
			click(x,y)
		--祈福确定
		elseif DmFindPic('qifuqueding.bmp',85,896,567,909,579) or DmFindPic('qifuqueding1.bmp',85,826,568,840,581) then
			click(x,y)
		elseif DmFindPic('x_cailiao.bmp',85,732,80,746,95) then
			click(x,y)
			iscl=1
		--拿出祈福仓库的物品
		elseif DmFindPic('zuanshiqifu.bmp',85,381,596,395,609) and (DmFindPic('cangku.bmp',85,976,55,987,67) or DmFindPic('cangku1.bmp',85,960,52,976,70))then
			click(x,y)mSleep(1000)
		--佩带装备
		elseif DmFindPic('peidai.bmp',85,712,507,724,519) or DmFindPic('peidai1.bmp',85,712,472,725,482) then
			click(x,y)		
		elseif count > 3 and DmFindPic('cangkudakai.bmp',85,157,553,171,567) then--89,140
			isok=1
		--祈福仓库打开
		elseif DmFindPic('cangkudakai.bmp',85,157,553,171,567) then--89,140
			click(x-68,y-413)
			count = count + 1
			mSleep(1000)
		else
			mSleep(300)
			connect()
		end
	end
end

--累计登陆
function leiji()
	jdwlLog('累计登陆')
	local count=0
	local isok=0
	local start=os.time()
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)		
		elseif os.difftime(os.time(),start)	 > 180 then
			kill()
			jdwlLog("累计登陆奖励超时")
			isok=0
			count=0
			start=os.time()
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('累计登陆奖励完成')
			break
		elseif isok==1 and DmFindPic('x_fuli.bmp',85,1092,44,1106,56) then
			click(x,y)
		--佩带装备
		elseif DmFindPic('peidai.bmp',85,712,507,724,519) or DmFindPic('peidai1.bmp',85,712,472,725,482) then
			click(x,y)
		--菜单栏回缩
		elseif DmFindPic('fuli.bmp',85,652,40,662,48)==false and DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPic('head.bmp',85,12,46,21,57) then
			click(x,y)mSleep(1000)		
		--点击福利
		elseif DmFindPic('fuli.bmp',85,652,40,662,48) then
			click(x,y)	
		--点击累计登录
		elseif DmFindPic('leiji.bmp',85,91,384,109,403) then
			click(x,y)mSleep(1000)
		--领取累计
		elseif DmFindPic('lingquleiji.bmp',80,954,302,991,624) then
			click(x,y)
		elseif count > 2 and DmFindPic('leijiliang.bmp',85,90,383,109,406) then
			isok=1
		--滑动
		elseif DmFindPic('leijiliang.bmp',85,90,383,109,406) then
			myMove_UD(921,583,919,388,10)mSleep(500)
			count = count + 1
		--点到祝福晶石
		elseif DmFindPic("x_zhufu.bmp",80,783,142,797,158) or DmFindPic("x_zhufujingshi1.bmp",80,784,140,799,154) then
			click(x,y)
		--领奖灰关闭窗口
--[[		elseif DmFindPic('x_heifuli.bmp',85,1096,40,1111,51) then
			click(x,y)	--]]		
		else
			mSleep(500)
			connect()
		end
	end
end

--福利等级奖励
function dengji()
	jdwlLog('等级奖励')
	local isok=0
	local count = 0
	local start=os.time()
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)		
		elseif os.difftime(os.time(),start)	> 180 then
			kill()
			jdwlLog("等级奖励超时")
			isok=0
			count=0
			start=os.time()
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('等级奖励完成')
			break
		elseif isok==1 and DmFindPic('x_fuli.bmp',85,1092,44,1106,56) then
			click(x,y)
		--菜单栏回缩
		elseif DmFindPic('fuli.bmp',85,652,40,662,48)==false and DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPic('head.bmp',85,12,46,21,57) then
			click(x,y)mSleep(1000)		
		--点击福利
		elseif DmFindPic('fuli.bmp',85,652,40,662,48) then
			click(x,y)
		--点击等级奖励
		elseif DmFindPic('dengji.bmp',85,107,249,123,267) then
			click(x,y)mSleep(1500)
		--点击领取
		elseif DmFindPic('lingqudengji.bmp',80,954,324,992,602) then
			click(x,y)
		--领完了
		elseif DmFindPic('lingqudengjihui.bmp',80,982,303,1017,618) then
			isok=1	
		elseif count > 3 then
			isok=1
		elseif DmFindPic('dengjiliang.bmp',85,103,246,124,269) then
			myMove_UD(652,520,875,420,10)mSleep(1000)
			count = count + 1
		--点到祝福晶石
		elseif DmFindPic("x_zhufu.bmp",80,783,142,797,158) or DmFindPic("x_zhufujingshi.bmp",80,785,142,797,156) then
			click(x,y)			
		--领奖灰关闭窗口
--[[		elseif DmFindPic('x_heifuli.bmp',85,1096,40,1111,51) then
			click(x,y)	--]]		
		else
			mSleep(500)
			connect()
		end
	end
end

--连续登录
function lianxu()
	jdwlLog('连续登录')
	local isok=0
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)			
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('连续登录完成')
			break
		elseif isok==1 and DmFindPic('x_fuli.bmp',85,1092,44,1106,56) then
			click(x,y)	
		--菜单栏回缩
		elseif DmFindPic('fuli.bmp',85,652,40,662,48)==false and DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPic('head.bmp',85,12,46,21,57) then
			click(x,y)mSleep(1000)		
		--点击福利
		elseif DmFindPic('fuli.bmp',85,652,40,662,48) then
			click(x,y)
		--点击连续登录
		elseif DmFindPic('lianxu.bmp',85,89,314,109,336) then
			click(x,y)mSleep(1000)
		--领取连续
		elseif DmFindPic('lingqulianxu.bmp',85,861,447,876,464) then
			click(x,y)mSleep(5000)
		--已领取
		elseif DmFindPic('lianxuyilingqu.bmp',85,221,355,238,369) then
			isok=1
		else
			mSleep(500)
			connect()
		end
	end
end

--每日在线
function meiri()
	jdwlLog('每日在线')
	local isok=0
	local start=os.time()
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)		
		elseif os.difftime(os.time(),start)	> 180 then
			jdwlLog("每日在线奖励超时")
			kill()
			start=os.time()
			isok=0
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('每日在线完成')
			break
		elseif isok==1 and DmFindPic('x_fuli.bmp',85,1092,44,1106,56) then
			click(x,y)	
		--菜单栏回缩
		elseif DmFindPic('fuli.bmp',85,652,40,662,48)==false and DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPic('head.bmp',85,12,46,21,57) then
			click(x,y)mSleep(1000)		
		--点击福利
		elseif DmFindPic('fuli.bmp',85,652,40,662,48) then
			click(x,y)	
		--点击每日在线
		elseif DmFindPic('meiri.bmp',85,49,453,65,470) then
			click(x,y)
		--领取每日在线
		elseif DmFindPic('lingqumeiri.bmp',85,847,447,861,464) then
			click(x,y)mSleep(4000)
		--每日在线已经领取
		elseif DmFindPic('meiriok.bmp',85,383,369,396,380) then
			isok=1
		--领奖灰关闭窗口
--[[		elseif DmFindPic('x_heifuli.bmp',85,1096,40,1111,51) then
			click(x,y)		--]]	
		else
			mSleep(500)
			connect()
		end
	end
end

--提取系统邮件
function youjian()
	jdwlLog('提取系统邮件')
	local isok=0
	local cnt=0
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)	
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('邮件领取完成')
			break
		elseif isok==1 and DmFindPic('x_email.bmp',85,1094,41,1106,53) then
			click(x,y)mSleep(500)
		--打开邮件
		elseif DmFindPic('youjian.bmp',85,768,168,778,179) then
			click(x,y)
		--点击功能按钮
		elseif DmFindPic('gongneng.bmp',85,805,63,818,74) then
			click(x,y)
		--邮件界面确认打开
		elseif DmFindPic('youxiang.bmp',85,536,46,548,59) and DmFindPic('quanxuan.bmp',85,52,120,71,136) then
			click(x,y)
		elseif cnt>3 and DmFindPic('piliang.bmp',85,134,594,149,606) then--406,597
			click(x+270,y)
			isok=1
		--批量提取
		elseif DmFindPic('piliang.bmp',85,134,594,149,606) then
			click(x,y)mSleep(500)
			cnt=cnt+1
		--菜单栏回缩
		elseif DmFindPic('fuli.bmp',85,652,40,662,48)==false and DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPic('head.bmp',85,12,46,21,57) then
			click(x,y)mSleep(1000)	
		--提示
		elseif DmFindPic('shanchuqueding.bmp',85,457,396,470,408) then
			click(x,y)		
		else
			mSleep(500)
			connect()
		end
	end
end



--断线重连
function connect()

	--登录时候的广告
	if DmFindPic('close.bmp',85,1063,599,1086,612) or DmFindPic('close1.bmp',85,1063,599,1077,613) then
		click(x,y)		
--[[	elseif DmFindPic("",85,) then
		click(x,y)--]]
	--电池启动
	elseif DmFindPic('dianchi.bmp',85,20,68,31,77) then
		run()
	elseif DmFindPic('x_fuli.bmp',85,1092,44,1106,56) then
		click(x,y)
	--领取恶魔广场奖励
	elseif DmFindPic('lingqujiangli.bmp',85,524,570,538,581) then
		click(x,y)
		--材料不够
	elseif DmFindPic('x_cailiao.bmp',85,732,80,746,95) then
		click(x,y)		
	--什么鬼确定
	elseif DmFindPic('smqueding.bmp',85,640,431,651,442) then
		click(x,y)
	--社么鬼确定
	elseif DmFindPic('smgqueding.bmp',85,637,430,649,443)	 then
		click(x,y)		
	elseif DmFindPic('smqd.bmp',85,638,430,653,442) then
		click(x,y)					
	--登录界面进入游戏
	elseif DmFindPic('denglujinru2.bmp',85,811,501,828,515) or DmFindPic("denglujinru1.bmp",85,807,501,823,512) then
		click(x,y)
	--有角色直接进入游戏
	elseif DmFindPic('juesejinru.bmp',85,519,572,532,583) or DmFindPic('juesejinru1.bmp',85,516,572,530,587)  then
		click(x,y)	
		connectcs=0
	elseif connectcs> 5 and (DmFindPic("dengluyichang.bmp",85,550,488,563,498)or DmFindPic("dengluyichang1.bmp",80,547,487,562,500))	then
		click(x,y)
		kill()
		iGrimace()	
		emgcms()
		connectcs=0
	--登录异常刷机
	elseif DmFindPic("dengluyichang.bmp",85,550,488,563,498) or DmFindPic("dengluyichang1.bmp",80,547,487,562,500)	then
		click(x,y)	
		--[[kill()
		iGrimace()	
		emgcms()--]]
		connectcs=connectcs+1
	elseif DmFindPicFuzzy("simcard2.bmp",85,602,305,647,344,0xffffff) then
		click(x,y)
	--游客模式
	elseif DmFindPic("youke.bmp",85,963,583,978,602) then
		click(x,y)
	elseif DmFindPic("youkequeding.bmp",85,465,428,478,443) then
		click(x,y)mSleep(3000)		
--[[	elseif DmFindPic('x_heifuli.bmp',85,1096,40,1111,51) then
			click(x,y)	--]]	
	else
		mSleep(300)
	end
end
--退出游戏
function tuichu()
	jdwlLog('退出游戏')
--[[	local shuru=0
	local cuowu=0
	local start=os.time()
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)			
		elseif os.difftime(os.time(),start) > 180 then
			kill()
			jdwlLog("退出超时")
			shuru=0
			cuowu=0
			start=os.time()
		--没角色了
		elseif DmFindPic('meijuese.bmp',85,115,217,131,233) and (DmFindPic('juesejinru.bmp',85,519,572,532,583) or DmFindPic('juesejinru1.bmp',85,516,572,530,587))then
			jdwlLog('退出完成')
			break
		--删除角色
		elseif DmFindPic('x_juese.bmp',85,300,219,314,233) or DmFindPic('x_juese1.bmp',85,301,220,313,234) then
			click(x,y)			
		elseif DmFindPic('juesejinru.bmp',85,519,572,532,583) or DmFindPic('juesejinru1.bmp',85,516,572,530,587)then
			mSleep(3000)
		elseif DmFindPic('jiaoyitishi.bmp',85,462,429,475,441) then--658,434
			click(658,434)			
		--点击系统设置
		elseif DmFindPic('xitongshezhi.bmp',85,845,167,856,177) then
			click(x,y)
		--返回登录界面
--		elseif DmFindPic('fanhui.bmp',85,526,232,539,244) then
			click(x,y)
		--返回角色选择
		elseif DmFindPic('fanhuijuese.bmp',85,502,363,515,374) then
			click(x,y)
		--退出项未选中
		elseif DmFindPic('tuichuhei.bmp',85,363,163,378,176) then
			click(x,y)
		--点击功能按钮
		elseif DmFindPic('gongneng.bmp',85,805,63,818,74) then
			click(x,y)
		--菜单栏回缩
		elseif DmFindPic('fuli.bmp',85,652,40,662,48)==false and DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPic('head.bmp',85,12,46,21,57) then
			click(x,y)mSleep(1000)	
		--登录界面进入游戏
		elseif DmFindPic('denglujinru2.bmp',85,811,501,828,515) or DmFindPic("denglujinru1.bmp",85,807,501,823,512) then
			jdwlLog('退出游戏完成')			
			break
		--登录时候的广告
		elseif DmFindPic('close.bmp',85,1063,599,1086,612) or DmFindPic('close1.bmp',85,1063,599,1077,613) then
			click(x,y)		
		--电池启动
		elseif DmFindPic('dianchi.bmp',85,20,68,31,77) then
			run()			
		--验证码识别错误重新再来
		elseif cuowu==1 and DmFindPic('x_yanzhengma.bmp',85,810,141,820,151) then
			click(x,y)
			cuowu = 0
		--识别错误
		elseif DmFindPic('shibiecuowu.bmp',85,638,431,652,442) then
			click(x,y)
			shuru = 0
			cuowu =1
		--删除
		elseif shuru == 1 and DmFindPic('scqueding.bmp',85,459,483,472,498) then
			click(x,y)
		--识别验证码
		elseif DmFindPic('yanzhengjiemian.bmp',85,653,372,669,391) then
			notifyMsg('开始识别')mSleep(1000)
			local code=shibie()
			notifyMsg(code)mSleep(1000)
			--if DmFindPic('yanzhengjiemian.bmp',85,653,372,669,391) then--643,434
				click(573,436)mSleep(1000)
				inputText('\b\b\b\b\b\b\b\b\b')
				inputText(code)
			--end
		--键盘弹起
		elseif DmFindPic('diqiu.bmp',85,179,596,194,610) or DmFindPic('diqiu1.bmp',85,152,596,167,613) then--975,601
			click(x+796,y+5)	
			shuru=1		
		elseif DmFindPic("done.bmp",85,887,263,910,292) then
			click(x,y)
			shuru=1
		elseif DmFindPic("dengluyichang.bmp",85,550,488,563,498)	then
			click(x,y)			
			kill()
			iGrimace()
		else
			mSleep(500)
			connect()
		end
	end
--]]
	kill()
	iGrimace()
end

--拾取设置
function shiqu()
	jdwlLog("拾取设置")
	local tt=os.time()
	local isok=0
	while true do
		if os.difftime(os.time(),tt) > 90 then
			kill()
			jdwlLog("拾取设置超时")
			tt=os.time()
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog("拾取设置完成")
			break
		elseif isok==1 and (DmFindPic("x_shiqu.bmp",80,824,79,836,89) or DmFindPic("x_guaji.bmp",80,1098,39,1111,56) )then
			click(x,y)
		elseif DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)	
		--点击挂机设置
		elseif DmFindPic("guajishezhi.bmp",80,932,138,943,149) then
			click(x,y)
		--取消紫装拾取
		elseif DmFindPic("shiquzizhuang.bmp",80,636,242,650,259) then
			click(x,y)mSleep(1000)
		--紫装拾取勾选完毕
		elseif DmFindPic("zizhuang.bmp",80,681,239,698,254) and DmFindPic("heise.bmp",80,636,238,653,256) then
			isok=1
		--点击拾取设置
		elseif DmFindPic("shiqushezhi.bmp",80,738,593,755,606) then
			click(x,y)
		--点击功能按钮
		elseif DmFindPic('gongneng.bmp',85,805,63,818,74) then
			click(x,y)
		--菜单栏回缩
		elseif DmFindPic('fuli.bmp',85,652,40,662,48)==false and DmFindPic('beibao.bmp',85,846,614,858,626) and DmFindPic('head.bmp',85,12,46,21,57) then
			click(x,y)mSleep(1000)			
		else
			connect()
		end
	end
end

--整理背包
function beibao(purple)
	jdwlLog('整理背包')
	local count=0
	local isok=0
	local start=os.time()
	while true do
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435)or DmFindPic('dx.bmp',85,519,422,530,438) then
			click(x,y)		
		elseif os.difftime(os.time(),start)>180 then
			jdwlLog("整理背包超时")
			kill()
			start=os.time()
			count=0
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('整理背包完成')
			break
		elseif DmFindPic('beibao.bmp',85,846,614,858,626) then
			click(x,y)
		--点击回收
		elseif DmFindPic('huishou.bmp',85,692,585,702,597) then
			click(x,y)
		--勾选绿蓝紫三项
		elseif purple==nil and DmFindPic('quxiaohuishou.bmp',85,687,586,699,596) and DmFindPic('xuanxiang.bmp',80,273,497,552,530) then
			click(x,y)mSleep(500)
		elseif purple~=nil and DmFindPic('quxiaohuishou.bmp',85,687,586,699,596) and DmFindPic('xuanxiang.bmp',80,271,495,428,534) then
			click(x,y)mSleep(500)
		elseif count > 3 and (DmFindPic('x_cb.bmp',85,1097,39,1110,52) or DmFindPic('x_cb1.bmp',85,1095,38,1112,53))then
			if DmFindPic('zhengli.bmp',85,1010,586,1023,597) then
				click(x,y)mSleep(1500)
			end
			if DmFindPic('x_cb.bmp',85,1097,39,1110,52) or DmFindPic('x_cb1.bmp',85,1095,38,1112,53) then 
				click(x,y)mSleep(500)
			end
			isok=1
		--立即回收
		elseif DmFindPic('lijihuishou.bmp',85,211,576,226,589) then
			click(x,y)
			count=count + 1
		--回收确定
		elseif DmFindPic('huishouqueding.bmp',85,462,427,471,438) then
			click(x,y)
		--套装属性
		elseif DmFindPic('x_zhuoyue.bmp',85,788,168,800,177) then
			click(x,y)
		elseif DmFindPic('x_duihua.bmp',85,1004,219,1016,232) then
			click(x,y)
		elseif os.difftime(os.time(),start) > 30 and (DmFindPic('x_cb.bmp',85,1097,39,1110,52) or DmFindPic('x_cb1.bmp',85,1095,38,1112,53)) then
			click(x,y)
			start=os.time()
		else
			mSleep(500)
			connect()
		end
	end
end

--使用出售杂物
function shiyong()
	jdwlLog('使用杂物')
	local a = 0
	local b = 0
	local wz = 1
	local isok=0	
	local start=os.time()
	local maya=0
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
		end
		--屏蔽玩家
		if DmFindPic('yanjing.bmp',85,1033,216,1044,226) or DmFindPic('diaoxian.bmp',85,534,424,546,435) or DmFindPic('dx.bmp',85,519,422,530,438)then
			click(x,y)	
		--有角色直接进入游戏
		elseif DmFindPic('juesejinru.bmp',85,519,572,532,583) or DmFindPic('juesejinru1.bmp',85,516,572,530,587)  then
			click(x,y)				
		elseif os.difftime(os.time(),start) > 180 then
			kill()
			jdwlLog("使用物品超时")
			start=os.time()
			a=0
			b=0
			wz=0
			isok=0
		elseif isok==1 and DmFindPic('beibao.bmp',85,846,614,858,626) then
			jdwlLog('使用物品完成')
			break
		elseif isok==1 and (DmFindPic('x_cb.bmp',85,1097,39,1110,52) or DmFindPic('x_cb1.bmp',85,1095,38,1112,53) )then
			click(x,y)
		--打开背包
		elseif DmFindPic('beibao.bmp',85,846,614,858,626) then
			click(x,y)mSleep(1000)	
		elseif wz > 20 and DmFindPic('person.bmp',85,540,49,559,60) then
			isok=1
		--逐格点击背包
		elseif DmFindPic('person.bmp',85,540,49,559,60) then
			click(690+a*93,146+b*93)
			wz = wz + 1
			mSleep(500)
		--出售绑定玛雅	
		elseif DmFindPic("maya.bmp",80,460,220,478,236) and DmFindPic("suo.bmp",80,436,251,447,260) then
			click(833,477)
			maya=1
		--药品
		elseif DmFindPic('yaoping.bmp',85,448,298,470,318) then--795,118
			click(x+347,y-180)
			isok=1
		--出售图鉴
		elseif DmFindPic('chushoutujian.bmp',85,824,485,836,495) or DmFindPic('chushoutujian1.bmp',85,820,448,832,457) then
			click(x,y)
		--出售门票材料
		elseif DmFindPic('chushoumenpiao.bmp',85,824,460,835,473) or DmFindPic('chushoumenpiao1.bmp',85,822,425,836,436) then
			click(x,y)
		--使用果实金币魔晶勋章
		elseif DmFindPic('quanbu.bmp',85,551,483,561,494) then
			click(x,y)
		elseif DmFindPic('shiyong.bmp',85,824,460,836,474) or DmFindPic('shiyong1.bmp',85,825,421,835,432) then
			click(x,y)
		elseif maya==1 and DmFindPic('guizhongwuping.bmp',85,636,429,648,439) then
			click(487,437)
			maya=0
		--点到贵重物品
		elseif DmFindPic('guizhongwuping.bmp',85,636,429,648,439) then
			click(x,y)mSleep(500)
			if DmFindPic('x_weizhi.bmp',85,1095,38,1112,51) then
				click(x,y)
				--isok=1
			end
		--未知物品
		elseif DmFindPic('x_weizhi.bmp',85,1095,38,1112,51) then
			click(x,y)
		else
			mSleep(500)
			connect()
		end		
	end
end

--配置文件相关
function area()
	local file,area
	file = io.open('/var/touchelf/scripts/area.txt','r')
	if file ~=nil then
		area = file:read()
		return area
	elseif file == nil then
		while true do
			notifyMsg("缺少area.txt文件")
		end
	end
end

--是否进入过游戏
function plist()
	local file,l,mukr,pp,localpath
	for l in io.popen("ls ".."/var/mobile/Applications/"):lines() do
		mukr=io.open("/var/mobile/Applications/" ..l .."/ios.app")	
		if mukr~=nil then
			pp=io.open("/var/mobile/Applications/" ..l .."/Library/Preferences")
				if pp~=nil then
					localpath = "/var/mobile/Applications/" ..l .."/Library/Preferences/com.webzen.muorigin.ios.plist"
				elseif pp==nil then
					localpath=0
				end
		end
	end
	return localpath
end

function os.remove(path)
    return os.execute("rm -rf "..path);
end	

--修改指定的区
function autoarea()
	local qu=area()
	local pp=plist()
	notifyMsg(pp)
	local file,l
	file = io.open('/var/touchelf/scripts/log.xml','r')
	if file ~= nil then
		local data = file:read('*a')
		file:close()	
		local i,j = string.find(data,'LastServerInfoID')	 
		local k,h = string.find(data,'MOCAACONFIG')	 
		local head = string.sub(data,0,j+6)
		local mid = string.sub(data,j+7,k-6)
		mid = string.gsub(mid,'%d+',qu,1)
		local tail = string.sub(data,k-5)
		
		file = io.open('/var/touchelf/scripts/log.xml','w')
		file:write(head..mid..tail)
		file:close()
		os.copy('/var/touchelf/scripts/log.xml','/var/touchelf/scripts/com.webzen.muorigin.ios.plist')
		os.copy('/var/touchelf/scripts/com.webzen.muorigin.ios.plist',pp)
	elseif file == nil then
		while true do 
			notifyMessage('缺少登录配置文件')
		end
	end	
end

function os.copy(path,to)
    return os.execute("cp -rf "..path.." "..to);
end

--一键新机
new_iphone = {0x696969,--823,87;
1,0,0x737373,2,0,0x767676,
3,0,0x767676,4,0,0x767676,
2,3,0xCCCCCC,3,3,0xCCCCCC,
4,3,0xCCCCCC,5,3,0xBFBFBF,
6,3,0x000000,}
--退出
icon_exit = {0x000000,--945,157;
1,0,0x161616,2,0,0x1E1E1E,
3,0,0x1E1E1E,2,2,0xCCCCCC,
3,2,0xCCCCCC,2,4,0xCCCCCC,
3,4,0xCCCCCC,4,4,0xA4A4A4,
5,4,0x000000,}
--iPhone的n字
letter_n = {0x007AFF,--146,409;
1,0,0x007AFF,2,0,0x007AFF,
3,0,0x007AFF,1,2,0x007AFF,
2,2,0x007AFF,3,2,0x007AFF,
4,2,0x007AFF,5,2,0x007AFF,
}
--ig一键新机
function iGrimace()
	local isnew = 0
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 80 then
			jdwlLog("IG超时重启")
			os.execute("reboot")
		elseif isnew == 0 and Mulcolor(letter_n,90,146,409,151,511) and Mulcolor(new_iphone,90,823,87,829,90) then
			click(x,y)mSleep(8000)
			isnew = 1
--[[		elseif isnew==1 and Mulcolor(letter_n,90,146,409,151,511) then
			click(945,157)--]]
		elseif isnew == 1 and Mulcolor(icon_exit,90,945,157,950,161) then
			click(x,y)
			break
		else
			appRun('org.ioshack.iGrimace')mSleep(1000)
		end
	end
end

function Mulcolor(t,sim,x1,y1,x2,y2)
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

--识别删除角色的验证码
--验证码范围
--以大漠工具 664,425,738,450
function shibie()
	local code={}
	local i=1
	local x1,y1=0,0
	local ret={}
	local code=""
	for i=1,4 do
		if i==1 then 
		    x1,y1=664,690
		elseif i==2 then 
		    x1,y1=684,704
		elseif i==3 then 
		    x1,y1=699,719
		elseif i==4 then 
		    x1,y1=713,738
		end
		if DmFindPicFuzzy('0.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='0'
		elseif DmFindPicFuzzy('1.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='1'
		elseif DmFindPicFuzzy('2.bmp',85,x1,425,y1,450,0xffffff) then		
			ret[i]='2'
		elseif DmFindPicFuzzy('3.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='3'
		elseif DmFindPicFuzzy('4.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='4'
		elseif DmFindPicFuzzy('4_1.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='4'			
		elseif DmFindPicFuzzy('5.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='5'
		elseif DmFindPicFuzzy('5_1.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='5'		
		elseif DmFindPicFuzzy('5_2.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='5'							
		elseif DmFindPicFuzzy('6.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='6'
		elseif DmFindPicFuzzy('7.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='7'
		elseif DmFindPicFuzzy('7_1.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='7'			
		elseif DmFindPicFuzzy('8.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='8'
		elseif DmFindPicFuzzy('9.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='9'
		elseif DmFindPicFuzzy('9_1.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='9'			
		elseif DmFindPicFuzzy('A.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='A'
		elseif DmFindPicFuzzy('B.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='B'
		elseif DmFindPicFuzzy('B_1.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='B'			
		elseif DmFindPicFuzzy('Q.bmp',80,x1,425,y1,450,0xffffff) then
			ret[i]='Q'			
		elseif DmFindPicFuzzy('C.bmp',90,x1,425,y1,450,0xffffff) then
			ret[i]='C'
		elseif DmFindPicFuzzy('D.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='D'
		elseif DmFindPicFuzzy('E.bmp',90,x1,425,y1,450,0xffffff) then
			ret[i]='E'
		elseif DmFindPicFuzzy('E_1.bmp',90,x1,425,y1,450,0xffffff) then
			ret[i]='E'			
		elseif DmFindPicFuzzy('R.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='R'
		elseif DmFindPicFuzzy('R_1.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='R'						
		elseif DmFindPicFuzzy('P.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='P'
		elseif DmFindPicFuzzy('P_1.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='P'			
		elseif DmFindPicFuzzy('P_2.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='P'				
		elseif DmFindPicFuzzy('G.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='G'
		elseif DmFindPicFuzzy('H.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='H'
		elseif DmFindPicFuzzy('I.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='I'
		elseif DmFindPicFuzzy('J.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='J'
		elseif DmFindPicFuzzy('K.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='K'
		elseif DmFindPicFuzzy('L.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='L'
		elseif DmFindPicFuzzy('M.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='M'
		elseif DmFindPicFuzzy('M_1.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='M'			
		elseif DmFindPicFuzzy('N.bmp',80,x1,425,y1,450,0xffffff) then
			ret[i]='N'
		elseif DmFindPicFuzzy('N1.bmp',80,x1,425,y1,450,0xffffff) then
			ret[i]='N'			
		elseif DmFindPicFuzzy('O.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='O'
		elseif DmFindPicFuzzy('F.bmp',90,x1,425,y1,450,0xffffff) then
			ret[i]='F'			
		elseif DmFindPicFuzzy('S.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='S'
		elseif DmFindPicFuzzy('T.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='T'
		elseif DmFindPicFuzzy('U.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='U'
		elseif DmFindPicFuzzy('V.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='V'
		elseif DmFindPicFuzzy('W.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='W'
		elseif DmFindPicFuzzy('X.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='X'
		elseif DmFindPicFuzzy('X_1.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='X'	
		elseif DmFindPicFuzzy('X_2.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='X'								
		elseif DmFindPicFuzzy('Y.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='Y'
		elseif DmFindPicFuzzy('Y_1.bmp',80,x1,425,y1,450,0xffffff) then
			ret[i]='Y'			
		elseif DmFindPicFuzzy('Z.bmp',85,x1,425,y1,450,0xffffff) then
			ret[i]='Z'
		else
			mSleep(300)
		end
	end
	for i=1,#ret do
		if type(ret[i])=="string" then
			code=code..ret[i]
		end
	end
	return code
end
--人物是否在移动
function isMoveing()
	firstLocation = NewGetColor(315,111)
	secondLocation = NewGetColor(229,398)
	thirdLocation = NewGetColor(757,119)
	fourth  = NewGetColor(850,499)

	mSleep(300)
	nextFirstLocation = NewGetColor(315,111)
	nextSecondLocation = NewGetColor(229,398)
	nextThirdLocation = NewGetColor(757,119)
	nextFourth  = NewGetColor(850,499)

	if  ((firstLocation == nextFirstLocation) or (secondLocation == nextSecondLocation) or (thirdLocation == nextThirdLocation) or (fourth == nextFourth)) then 
		--[[DmFindPic('renwu.bmp',85,944,128,955,139) then--]]
		return false
	else
		return true
	end
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
function NewGetColor(x,y)
	local color = getColor(x-5,y-5)
	return color
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

function FindPic(pic,per,x1,y1,x2,y2)
		keepScreen(true)
		x, y = findImageInRegionFuzzy(PIC_PATH..pic, per, x1,y1,x2,y2)
		if x~=-1 and y~=-1 then	
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
			--logDebug(pic)
			return true		
		else
			keepScreen(false)
			return false
		end	
end

function FindPicFuzzy(pic,per,x1,y1,x2,y2,color)
		keepScreen(true)
		x, y = findImageInRegionFuzzy(PIC_PATH..pic,per,x1,y1,x2,y2,color)
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