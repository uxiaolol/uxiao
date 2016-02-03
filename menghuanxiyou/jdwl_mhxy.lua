PIC_PATH = '/var/touchelf/scripts/mhxy/'
PKG_NAME = 'com.netease.my'
-- 点击函数封装
function click(x, y)--随机小幅度点击
    touchDown(0, x + math.random(-2, 2), y + math.random(-2, 2))
    mSleep(math.random(15,50))
    touchUp(0)
    mSleep(math.random(500,800))
end

UI = {
	{'InputBox{}', 'id',    '宽带编号:' },
}

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

function main()
	mSleep(2000)
	unlock()
	rotateScreen(90)
	richang()
end

--练级模式
function lianji()
	while true do
		rotateScreen(90)	
		one=0
		two = 0
		three = 0
		four = 0
		five = 0	
		denglu()--登录游戏
		levelup()--练级/领取指引/整理背包/提升技能/替换玉面狐狸
		fuli()
		zawu()
		--加帮派
		jiarubp()
		--领双
		shuangbei()
		--随机日常任务
		rand()
		--帮派任务
		if ismj() ==2 then
			bangpairenwu()
		end
		--运镖
		yunbiao()
		--替换马面
		mamian()
		--加帮派
		jiarubp()		
		--使用宝图
		shiyongbaotu()
		--学习技能
		huoli()
		--做药
		zhiyao()
		--福利
		--fuli()
		--卖东西
		zawu()
		chushou()
		--整理装备
		equip()
		--下线
		exit()
		--断网
		router()
		--IG留存
		iGhistory()
	end	
end
--日常模式
function richang()
	while true do
		rotateScreen(90)	
		one=0
		two = 0 
		three = 0
		four = 0
		five = 0	
		denglu()--登录游戏
		zawu()
		fangsheng()
		levelup()--练级/领取指引/整理背包/提升技能/替换玉面狐狸
		fuli()
		zawu()
		--加帮派
		jiarubp()
		--领双
		shuangbei()
		--随机日常任务
		rand()
		--帮派任务
		if ismj()==2 then
			bangpairenwu()
			--学习技能
			huoli()			
		end	
		--运镖
		yunbiao()
		--替换马面
		mamian()
		--加帮派
		jiarubp()		
		--使用宝图
		shiyongbaotu()
		--建造家园
		jiayuan()
		--回家
		huijia()
		--做药
		zhiyao()
		--福利
		--fuli()
		--卖东西
		zawu()
		chushou()
		--整理装备
		equip()
		fangsheng()
		--下线
		exit()
		--断网
		router()
		--IG留存
		iGhistory()
	end	
end

function rand()
	jdwlLog('随机日常任务开始')
	while true do
		local start = math.random(1,5)
		if start == 1 and one==0 then
			shimen()
		elseif start==2 and two==0 then
			fengyao()
		elseif start == 3 and three==0 then
			dati()
		elseif start == 4 and four==0 then
			baotu()
		elseif start == 5 and five==0 then
			mijing()
		end
		
		if  one== 1 and two==1 and three==1 and four==1 and five==1  then
			jdwlLog('随机日常任务结束')
			break
		end
	end	
end

--删除
function delete(count)     
	for i= 1,count do
		inputText ("\b")
		mSleep(50)
    end
end


--解除锁屏
function unlock()
	jdwlLog('解除锁屏')
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

--登录
function denglu()
	jdwlLog('登录')
	local isok=0
	local start=os.time()
	while true do
		if os.difftime(os.time(),start) > 600 then
			jdwlLog('登录超时')
			kill()
			isok=0
			start = os.time()
			--iGhistory()
		--启动游戏
		elseif DmFindPic('dianchi.bmp',85,19,66,31,75) then
			run()			
		--点击网易邮箱
		elseif DmFindPic('wangyiyouxiang.bmp',85,650,345,668,360) then
			click(x,y)
		--绿色登录
		elseif DmFindPic('denglulvse.bmp',85,678,270,691,285) then
			click(x,y)
			isok=1
		--网易游戏图标/输入账号
		elseif DmFindPic('netease.bmp',85,336,206,346,222) and DmFindPic('yi.bmp',85,423,173,434,185) then--872,178
			click(x+450,y)
			mSleep(1000)
			delete(25)
			local list = Split(getAccount(), ",")
			local account = list[1]
			inputText(account)mSleep(500)
		--网易游戏图标/输入密码
		elseif DmFindPic('netease1.bmp',85,343,125,352,142) and DmFindPic('suo.bmp',85,428,184,439,197) then--872,278
			click(x+450,y)
			mSleep(1000)
			delete(25)	
			local list = Split(getAccount(), ",")
			local account = list[2]
			inputText(account)mSleep(500)		
		--公告确定
		elseif DmFindPic('gonggaoqueding.bmp',85,534,579,546,591) then
			click(x,y)
		--切换账号
		elseif DmFindPic('qiehuan.bmp',85,993,26,1008,47) and isok==0 then
			click(x,y)
		--使用其他账号登录
		elseif DmFindPic('shiyongqita.bmp',85,446,465,463,476) then
			click(x,y)
		--松鼠
		elseif DmFindPic('songshu.bmp',85,1092,64,1103,75) and isok==0 then
			click(x,y)
		--用户协议接受
		elseif DmFindPic('jieshou.bmp',85,813,568,825,580) then
			click(x,y)
		--点击选区
		elseif DmFindPic('dianjixuanqu.bmp',85,643,382,653,388) and isok==1 then
			click(x,y)
		--暂时选择八区
		elseif DmFindPic('baqu.bmp',85,218,304,233,318) then
			click(x,y)
		--繁花似锦
--[[		elseif DmFindPic('fanhua.bmp',85,414,105,425,117) then
			click(x,y)--]]
		--浮生若梦
		elseif DmFindPic('fusheng.bmp',85,726,105,743,121) or DmFindPic('fusheng1.bmp',85,391,103,403,117) then
			click(x,y)
		--点击加入角色
		elseif DmFindPic('dianjijiaru.bmp',85,446,197,454,214) then
			click(x,y)
		--点击登录
		elseif DmFindPic('dianjidenglu.bmp',85,503,229,513,240) then
			click(x,y)
		--选择大唐
		elseif DmFindPic('datang.bmp',85,926,314,937,327) then
			click(x,y)
		--输入名字
		elseif DmFindPic('mingzi.bmp',85,1010,468,1022,486) or DmFindPic("mingzi1.bmp",85,989,474,1002,487) then--1069,477
			click(1061,482)
		--名字重复
		elseif DmFindPic('mingzichongfu.bmp',85,475,292,494,313) then--570,373
			click(x+100,y+80)mSleep(500)
			local tt = os.time()
			while os.difftime(os.time(),tt) < 3 do
				if DmFindPic('saizi.bmp',85,1067,457,1080,466) then
					click(x,y)
					break
				else
					mSleep(300)
				end
			end
		--进入游戏
		elseif DmFindPic('jinruyouxi.bmp',85,892,555,907,569) or DmFindPic("jinruyouxi1.bmp",85,890,559,906,571) then
			click(x,y)
		--登录/角色创建完毕
		elseif DmFindPic('touxiang.bmp',85,1093,39,1104,48) then
			jdwlLog('登录/角色创建完毕')
			break
		--开场动画跳过剧情
		elseif DmFindPicFuzzy('tiaoguojuqing.bmp',95,1093,29,1121,51,0xffffff) then
			click(x,y)
			jdwlLog('登录/角色创建完毕')
			break			
		elseif DmFindPicFuzzy('tiaoguojuqing1.bmp',95,1092,31,1120,51,0xffffff) then
			click(x,y)		
			jdwlLog('登录/角色创建完毕')
			break			
		--登录卡住了 服务器加载不完全
		elseif DmFindPic('fuwuqi.bmp',85,509,27,526,43) and DmFindPic('yiyou.bmp',85,264,91,276,104)==false and DmFindPic('x_fuwuqi.bmp',85,1003,31,1016,41) then
			click(x,y)
			os.execute("reboot")
		--关闭福利	
		elseif DmFindPic('x_fulia.bmp',85,958,73,973,84) then
			click(x,y)			
		else
			mSleep(500)
			connect()
		end
	end
end

--主线任务升级
function levelup()
	jdwlLog('levelup')
	local zzok=false
	local ts=0
	local zhuxian=0
	local count=0
	local start=os.time()
	local cnt=0
	while true do
		--主线任务超时
		if os.difftime(os.time(),start) > 240 then
			jdwlLog('levelup超时')
			kill()
			zzok=false
			ts=0
			zhuxian=0
			count=0
			start=os.time()
		elseif DmFindPic('choujiang.bmp',85,572,316,585,330) then
			click(x,y)
		--新手礼包
		elseif DmFindPic('xinshoulibao.bmp',85,956,464,969,480) then
			click(974,515)
		--选择宠物
		elseif DmFindPic('xuanzechongwu.bmp',85,607,164,622,178) then
			local rand=math.random(1,2)
			if rand==1 then
				click(451,329)
			else
				click(702,339)
			end
		--梦甜香使用
		elseif DmFindPic('mengtianxiang.bmp',85,965,466,977,477) then
			click(975,515)mSleep(1500)
		--小竹篮使用
		elseif DmFindPic('xiaozhulan.bmp',85,963,463,979,474) then
			click(975,515)mSleep(1500)
		--兵器谱
		elseif DmFindPic('bingqipu.bmp',85,968,465,978,476) then
			click(975,515)mSleep(1500)
		--影蛊
		elseif DmFindPic('yinggu.bmp',85,977,469,988,483) then
			click(975,515)mSleep(1500)
		--结魄灯
		elseif DmFindPic('jiepodeng.bmp',85,954,469,964,480) then
			click(975,515)mSleep(1500)
		--使用
		elseif DmFindPic('shiyong.bmp',85,982,508,995,521) then
			click(x,y)mSleep(1500) start = os.time()
		--红尘选择宝宝
		elseif DmFindPic("xuanzhe.bmp",85,513,122,536,145) then--428,303
			click(x+85,y+181)
		--到40级开启新剧情
		elseif DmFindPicFuzzy('40.bmp',95,967,205,1007,224,0xffffff) and DmFindPicFuzzy('jueseshengji.bmp',95,993,168,1018,196,0xffffff) then
			notifyMsg('到达40级开启新剧情')
			jdwlLog('到达40级开启新剧情')
			break
		--生死薄
		elseif DmFindPic('shengsibu.bmp',80,910,292,928,313) or DmFindPic("pa.bmp",80,1040,292,1062,314) then
			notifyMsg('生死薄')
			jdwlLog('生死薄')
			break
		--晶晶姑娘打不过
		elseif zhuxian==0 and DmFindPic('jingjing.bmp',85,1016,293,1031,304) then
			notifyMsg('晶晶姑娘打不过主线任务完成')
			jdwlLog('晶晶姑娘打不过主线任务完成')
			zhuxian=1
		elseif count > 5 then
			notifyMsg('主线以及红尘完成')
			jdwlLog('主线以及红尘完成')
			break
		elseif zhuxian==1 and DmFindPicFuzzy('hong.bmp',95,919,164,978,388,0xffffff)==false and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			count=count+1
			mSleep(500)
			start = os.time()
		--已入情缘提升战力再打
		elseif ts==0 and (DmFindPic('xiudechangkuang.bmp',85,872,292,889,306) or DmFindPic('baoli.bmp',80,1007,292,1023,306) or DmFindPic('qiuzhu.bmp',80,993,353,1013,372))then
			equipone()
			jineng()
			huli()
			tihuan()
			ts=1
			start = os.time()
		--点击对话情况下的任务栏
		elseif DmFindPic('baoguo.bmp',85,1086,522,1099,533)==false and DmFindPic('renwulan.bmp',85,835,243,845,480) then
			click(x+20,y) start = os.time()
		--技能引导
		elseif DmFindPic('dakaijineng.bmp',85,1090,509,1102,520) then
			click(1008,589) start = os.time()
		--技能升级
		elseif DmFindPic('dianjishengji.bmp',85,885,515,897,524) then
			click(894,569) start = os.time()
		elseif cnt>3 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog("主线完成：可以做帮派任务了")
			break
		--帮派任务都出来了
		elseif DmFindPic('baoguo.bmp',85,1086,522,1099,533) and DmFindPicFuzzy('xuanwu.bmp',90,920,163,982,452,0xffffff) or DmFindPicFuzzy('zhuque.bmp',90,920,163,982,452,0xffffff) or DmFindPicFuzzy('qinglong.bmp',90,920,163,982,452,0xffffff) and isMoveing()==false	then
			jdwlLog("主线任务完成了")
			cnt=cnt+1
			mSleep(1000)
		--角色升级
		elseif DmFindPic('baoguo.bmp',85,1086,522,1099,533) and DmFindPicFuzzy('jueseshengji.bmp',95,993,168,1018,196,0xffffff) and DmFindPicFuzzy('shimen.bmp',90,926,256,951,280,0xffffff) and  isMoveing() == false then
			click(971,281)
		--红尘 
		elseif DmFindPic('baoguo.bmp',85,1086,522,1099,533) and DmFindPicFuzzy('hong.bmp',95,919,164,978,388,0xffffff) and  isMoveing() == false then
			click(x,y)
		--点击主线任务
		elseif DmFindPic('baoguo.bmp',85,1086,522,1099,533) and DmFindPicFuzzy('jueseshengji.bmp',95,993,168,1018,196,0xffffff)==false and DmFindPic('renwu.bmp',85,944,128,955,139) and isMoveing() == false then
			click(979,201)
		--购买摆摊物品
		elseif DmFindPic('pengren.bmp',85,351,158,363,168) then
			click(x,y) start = os.time()
		elseif DmFindPic('pengren1.bmp',85,352,157,364,171) and DmFindPic('goumaipengren.bmp',85,847,566,860,582) then
			click(x,y) start = os.time()
		--师门购买兵器
		elseif DmFindPic('goumaibingqi.bmp',85,831,511,845,525) then
			click(x,y) start = os.time()
		--师门购买宠物
		elseif DmFindPic('goumaichongwu.bmp',85,886,568,900,580) then
			click(x,y)mSleep(500)
			closewin() start = os.time()
		--上交任务物品/任务物品选择
		elseif DmFindPic('wupingxuanze.bmp',85,926,517,937,525) then
			click(x,y) start = os.time()
		--上交兵器
		elseif DmFindPic('shangjiaobingqi.bmp',85,943,512,954,523) then
			click(x,y) start = os.time()
		--上交宠物
		elseif DmFindPic('shangjiaochongwu.bmp',85,740,520,754,531) then
			click(x,y)		 start = os.time()	
		--选择龟丞相
		elseif DmFindPic('gui.bmp',85,447,506,465,523) then--422,297
			click(x-20,y-210) start = os.time()
		--开场动画跳过剧情
		elseif DmFindPicFuzzy('tiaoguojuqing.bmp',95,1093,29,1121,51,0xffffff) then
			click(x,y) start = os.time()
		elseif DmFindPicFuzzy('tiaoguojuqing1.bmp',95,1092,31,1120,51,0xffffff) then
			click(x,y) start = os.time()
		--点击继续
		elseif DmFindPicFuzzy('dianjijixu.bmp',95,1091,50,1121,72,0xffffff) then
			click(x,y) start = os.time()
		--点击法术
		elseif DmFindPic('dianjifashu.bmp',80,856,218,871,233) then
			click(1099,230) start = os.time()
		--点击破斧
		elseif DmFindPic('dianjipofu.bmp',80,670,305,685,315) then
			click(752,322) start = os.time()
		--点击选择目标
		elseif DmFindPic('dianjimubiao.bmp',80,438,227,450,242) then
			click(308,237) start = os.time()
		--点击技能
		elseif DmFindPic('dianjijineng.bmp',80,1003,134,1017,147) then
			click(1101,137) start = os.time()
		--点击万剑归一
		elseif DmFindPic('dianjiwanjian.bmp',80,785,304,798,318) then
			click(860,317) start = os.time()
		--自动战斗
		elseif DmFindPic('zidongzhandou.bmp',85,1100,605,1114,615) then
			click(x,y)		start = os.time()	
		--我有经验
		elseif DmFindPic('woyoujingyan.bmp',85,478,432,493,444) then
			click(x,y)	start = os.time()	 	
		--0级礼包
		elseif DmFindPic('0jilibao.bmp',85,842,209,854,219) then
			click(x,y) start = os.time()
		--10级礼包
		elseif DmFindPic('10jilibao.bmp',85,842,273,858,284) then
			click(x,y) start = os.time()
		--新手奖励
		elseif DmFindPic('xinshoujiangli.bmp',85,258,418,272,431) then
			click(x,y) start = os.time()
		--领取新手奖励
		elseif DmFindPic('xinshoulingqu.bmp',85,668,536,679,546) then
			click(x,y) start = os.time()
		--战斗失败之后提升战力
		elseif zzok== true and DmFindPic('zhuzhan.bmp',85,623,406,634,418) then
			click(545,514)		
			if DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
				equipone()
			end
			start = os.time()
		elseif  DmFindPic('zhuzhan.bmp',85,623,406,634,418) then
			click(x,y)
			if zhuzhan() then
				--equipone()
				zzok=true
			end
			start = os.time()
		--关闭福利	
		elseif DmFindPic('x_fuli.bmp',85,958,73,973,84) then
			click(x,y) start = os.time()
		--人物技能
		elseif DmFindPic('x_renwujineng.bmp',85,973,42,986,54) then
			click(x,y) start = os.time()
		--助战
		elseif DmFindPic('x_zhuzhan.bmp',85,1001,47,1014,59) then
			click(x,y) start = os.time()
		--拒绝师徒
		elseif DmFindPic('jujue.bmp',85,766,395,782,408) then
			click(x,y)	start = os.time()		
		--对话框遮挡住菜单栏
		elseif DmFindPic('heibeibao.bmp',85,1082,494,1093,506) then
			click(x,y) start = os.time()			
		--战斗界面
		elseif DmFindPic('aixin.bmp',85,25,39,36,50) then
			start = os.time()
		else
			mSleep(500)
			connect()
		end
	end
end

--师门
function shimen()
	jdwlLog('开始师门')
	local ispart=0
	local count = 0
	local isok=0
	local isfind=0
	local joinlocation={0,0,0,0}
	local location={0,0,0,0}	
	local start = os.time()	
	while true do
		--师门超时
		if isMoveing()==false and os.difftime(os.time(),start) > 240 then
			kill()
			jdwlLog('师门任务超时')
			ispart = 0
			count=0
			isok=0
			isfind = 0
			start = os.time()
		--师门完成
		elseif isok == 1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			logDebug('师门完成')
			one = 1
			break
		elseif DmFindPic('choujiang.bmp',85,572,316,585,330) then
			click(x,y)
		--使用
		elseif DmFindPic('shiyong.bmp',85,982,508,995,521) then
			click(x,y)			
			mSleep(1500)		
			start = os.time()	
		--点击对话情况下的任务栏
		elseif DmFindPic('shimenduihua.bmp',85,920,357,939,369) then
			click(x,y)
		elseif DmFindPic('baoguo.bmp',85,1086,522,1099,533)==false and DmFindPic('renwulan.bmp',85,835,243,845,480) then
			click(x+20,y)		
			start = os.time()				
		--点击师门任务字样
		elseif (DmFindPicFuzzy('shimen.bmp',90,921,162,977,408,0xffffff) or DmFindPicFuzzy('shimen1.bmp',90,921,162,977,408,0xffffff)) and isMoveing()==false then
			click(x,y)
			ispart = 1
			count = 0
		--点击活动
		elseif ispart==0 and (DmFindPic('huodong.bmp',80,333,28,343,41) or DmFindPic('huodong1.bmp',85,338,62,348,73)) then
			click(x,y)		
			mSleep(2000)	
			isfind = 0
			start = os.time()
		--自动战斗
		elseif DmFindPic('zidongzhandou.bmp',85,1100,605,1114,615) then
			click(x,y)		 start = os.time()	
		--使用
		elseif DmFindPic('shiyong.bmp',85,982,508,995,521) then
			click(x,y)				start = os.time()
		--日常任务未选中
		elseif DmFindPic('richangrenwu.bmp',85,157,106,177,129) then
			click(x,y) start = os.time()
		--参加师门
		elseif isfind == 1 and DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('canjia.bmp',85,joinlocation[1],joinlocation[2],joinlocation[3],joinlocation[4]) then
			click(x,y)
			ispart = 1	 
		--活动界面宝图10/10
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('canjia.bmp',85,joinlocation[1],joinlocation[2],joinlocation[3],joinlocation[4])==false and  isfind == 1 then
			notifyMsg('活跃完成')
			isok=1
			closewin()		
			start = os.time()
		--查找师门任务任务
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('shimenrenwu.bmp',80,284,88,1009,452) then
			notifyMsg(x..','..y)
			isfind=1
			--计算参加按钮的相对位置
			joinlocation[1]=x+202
			joinlocation[2]=y+21
			joinlocation[3]=x+220
			joinlocation[4]=y+41
			--计算活跃值
			location[1]=x+133
			location[2]=y+40
			location[3]=x+151
			location[4]=y+60
			start = os.time()
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('shimenrenwu.bmp',80,284,88,1009,452)==false then	
			myMove_UD(989,391,989,295,10)	
			start = os.time()
		--购买摆摊物品
		elseif DmFindPic('pengren.bmp',85,351,158,363,168) then
			click(x,y) start = os.time()
		elseif DmFindPic('pengren1.bmp',85,352,157,364,171) and DmFindPic('goumaipengren.bmp',85,847,566,860,582) then
			click(x,y) start = os.time()
		--师门购买兵器
		elseif DmFindPic('goumaibingqi.bmp',85,831,511,845,525) then
			click(x,y) start = os.time()
		--师门购买宠物
		elseif DmFindPic('goumaichongwu.bmp',85,886,568,900,580) then
			click(x,y)mSleep(500)
			closewin() start = os.time()
		--上交任务物品/任务物品选择
		elseif DmFindPic('wupingxuanze.bmp',85,926,517,937,525) then
			click(x,y) start = os.time()
		--上交兵器
		elseif DmFindPic('shangjiaobingqi.bmp',85,943,512,954,523) then
			click(x,y) start = os.time()
		--上交宠物
		elseif DmFindPic('shangjiaochongwu.bmp',85,740,520,754,531) then
			click(x,y)		 start = os.time()	
		--开场动画跳过剧情
		elseif DmFindPicFuzzy('tiaoguojuqing.bmp',95,1093,29,1121,51,0xffffff) then
			click(x,y) start = os.time()
		elseif DmFindPicFuzzy('tiaoguojuqing1.bmp',95,1092,31,1120,51,0xffffff) then
			click(x,y) start = os.time()
		--点击继续
		elseif DmFindPicFuzzy('dianjijixu.bmp',95,1091,50,1121,72,0xffffff) then
			click(x,y)		start = os.time()
		--任务栏没有宝图字样
		elseif count > 15 then
			ispart = 0
			count = 0
		elseif DmFindPic('baoguo.bmp',85,1086,522,1099,533) and DmFindPicFuzzy('shimen.bmp',90,921,162,977,408,0xffffff) ==false then
			count  = count + 1	
			start = os.time()			
		--福利弹出来
		elseif DmFindPic('xinshoujiangli.bmp',85,258,418,272,431) then
			click(x,y)
			start = os.time()
		--领取新手奖励
		elseif DmFindPic('xinshoulingqu.bmp',85,668,536,679,546) then
			click(x,y)
			start = os.time()
		--对话框遮挡住菜单栏
		elseif DmFindPic('heibeibao.bmp',85,1082,494,1093,506) then
			click(x,y)		
			start = os.time()	
		--关闭福利	
		elseif DmFindPic('x_fuli.bmp',85,958,73,973,84) then
			click(x,y)		
			start = os.time()
		--战斗界面
		elseif DmFindPic('aixin.bmp',85,25,39,36,50) then
			start = os.time()
		else
			mSleep(500)
			connect()
		end	
	end
end

--答题
function dati()
	jdwlLog('答题')
	local isfind=0
	local joinlocation={0,0,0,0}
	local location={0,0,0,0}
	local choice={521,706,901}
	local isok=0
	local start = os.time()
	while true do
		--三界奇缘超时
		if os.difftime(os.time(),start) > 180 then
			kill()
			jdwlLog('三界奇缘超时')
			isfind=0
			isok=0
			start=os.time()
		--三界奇缘完成
		elseif isok == 1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			logDebug('答题完成')
			three = 1
			break
		--点击活动
		elseif DmFindPic('huodong.bmp',80,333,28,343,41) or DmFindPic('huodong1.bmp',85,338,62,348,73) then
			click(x,y)
			mSleep(2000)
			isfind = 0
			start=os.time()
		--使用
		elseif DmFindPic('shiyong.bmp',85,982,508,995,521) then
			click(x,y)mSleep(1500)	start=os.time()	 	
		--限时活动未选中
		elseif DmFindPic('xianshi.bmp',85,204,178,217,194) then
			click(x,y) start=os.time()
		--点击参加
		elseif isfind == 1 and DmFindPic('xianshi1.bmp',85,203,178,218,191) and DmFindPic('canjia.bmp',85,joinlocation[1],joinlocation[2],joinlocation[3],joinlocation[4]) and  isfind == 1 then
			click(x,y)
		--三界奇缘活跃完成
		elseif isfind == 1 and DmFindPic('xianshi1.bmp',85,203,178,218,191) and DmFindPic('10.bmp',80,location[1],location[2],location[3],location[4]) and  isfind == 1 then
			notifyMsg('活跃完成')
			isok=1
			closewin()
		--活动尚未开启
		elseif DmFindPic('xianshi1.bmp',85,203,178,218,191) and DmFindPic('canjia.bmp',85,joinlocation[1],joinlocation[2],joinlocation[3],joinlocation[4])==false and  isfind == 1 then
			notifyMsg('活动尚未开启')
			isok=1
			closewin()
		--限时活动选中之后
		elseif DmFindPic('xianshi1.bmp',85,203,178,218,191) and DmFindPic('sanjieqiyuan.bmp',80,284,88,1009,452) then
			--[[notifyMsg(x..','..y)--]]
			isfind=1
			--计算参加按钮的相对位置
			joinlocation[1]=x+169
			joinlocation[2]=y+13
			joinlocation[3]=x+195
			joinlocation[4]=y+41
			--计算活跃值
			location[1]=x+106+5
			location[2]=y+36+5
			location[3]=x+127+5
			location[4]=y+55+5
			start=os.time()
		--题目答完了
		elseif DmFindPic('wanchengtimu.bmp',85,685,380,703,400) then
			closewin()
			isok=1
		--题目界面选择答案
		elseif DmFindPic('timu.bmp',85,215,213,237,234) then
			click(choice[math.random(1,3)],239)
			start=os.time()
		else
			mSleep(500)
			connect()
		end
	end
end

--科举乡试
function keju()
	jdwlLog('科举答题')
	while true do
	
	end
end

--封妖
function fengyao()
	jdwlLog('封妖')
	local move = 0
	local isfind=0
	local joinlocation={0,0,0,0}
	local location={0,0,0,0}	
	local ispart=0	
	local isok=0
	local cnt=0
	local start=os.time()
	while true do
		--封妖超时
		if isMoveing() == false and os.difftime(os.time(),start) > 300 then
			kill()
			jdwlLog('封妖超时')
			move = 0
			isfind = 0
			ispart = 0
			isok=0
			cnt=0
			start = os.time()
		--封妖完成
		elseif isok == 1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			logDebug('封妖完成')
			two = 1
			break	
		--自动战斗
		elseif DmFindPic('zidongzhandou.bmp',85,1100,605,1114,615) then
			click(x,y)		start = os.time()	
		--使用
		elseif DmFindPic('shiyong.bmp',85,982,508,995,521) then
			click(x,y)		start = os.time()	
		--点击活动
		elseif ispart==0 and (DmFindPic('huodong.bmp',80,333,28,343,41) or DmFindPic('huodong1.bmp',85,338,62,348,73)) then
			click(x,y)
			mSleep(2000)
			isfind = 0
			start = os.time()
		--日常任务未选中
		elseif DmFindPic('richangrenwu.bmp',85,157,106,177,129) then
			click(x,y)
			start = os.time()
		--参加封妖
		elseif isfind == 1 and DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('canjia.bmp',85,joinlocation[1],joinlocation[2],joinlocation[3],joinlocation[4]) then
			click(x,y)mSleep(1000)
			local tt = os.time()
			while os.difftime(os.time(),tt) < 5 do
				--确认已经传送至最佳地图
				if DmFindPic('baoguo.bmp',85,1086,522,1099,533) and DmFindPicFuzzy('songzhi.bmp',90,492,288,533,314,0xffffff) then
					ispart = 1
					notifyMsg('传送至最佳地图')	
					start = os.time()
					break
				end		
			end
			isfind = 0
		--活动界面封妖10/10
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('canjia.bmp',85,joinlocation[1],joinlocation[2],joinlocation[3],joinlocation[4])==false and  isfind == 1 then
			notifyMsg('活跃完成')
			isok=1
			closewin()		
		--查找封妖任务
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('fengyao.bmp',80,284,88,1009,452) then
			notifyMsg(x..','..y)
			isfind=1
			--计算参加按钮的相对位置
			joinlocation[1]=x+202
			joinlocation[2]=y+21
			joinlocation[3]=x+220
			joinlocation[4]=y+41
			--计算活跃值
			location[1]=x+133
			location[2]=y+40
			location[3]=x+151
			location[4]=y+60
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('fengyao.bmp',80,284,88,1009,452)==false then	
			myMove_UD(989,391,989,295,10)
			start = os.time()
		--进入战斗
		elseif DmFindPic('jinruzhandou.bmp',85,921,414,941,430) then
			click(x,y)mSleep(1000)
			ispart = 0
			start = os.time()
		--妖怪重叠之后选择一个
		elseif DmFindPic('gu.bmp',85,517,245,559,351) then
			click(x,y)	
			start = os.time()		
		--查找远古妖怪
		elseif ispart == 1 and move == 1 and DmFindPicFuzzy('age.bmp',85,261,161,814,510,0xffffff) then
			click(x+20,y-65)mSleep(1000)		
			move = 0
			start = os.time()
		elseif ispart == 1 and move == 1 and DmFindPicFuzzy('age.bmp',85,261,161,814,510,0xffffff)==false then
			mSleep(1000)		
			move = 0		
			start = os.time()	
		elseif cnt > 9 and (DmFindPic('huodong.bmp',80,333,28,343,41) or DmFindPic('huodong1.bmp',85,338,62,348,73)) then
			ispart=0
			cnt=0
			move=0
		--随机移动
		elseif ispart == 1 and isMoveing() == false and move == 0 and (DmFindPic('huodong.bmp',80,333,28,343,41) or DmFindPic('huodong1.bmp',85,338,62,348,73)) then
			local x = math.random(260,888)
			local y = math.random(199,438)
			click(x,y)
			move = 1
			cnt=cnt+1
			--start = os.time()
		elseif DmFindPic('aixin.bmp',85,25,39,36,50) then
			start = os.time()
		--福缘
		elseif DmFindPic('fuyuan.bmp',85,582,30,603,52) then--1021,47
			click(x+439,y+17)
			ispart=0
			move=0
		else
			mSleep(500)
			connect()
		end						
	end
end

--秘境降妖
function mijing()
	jdwlLog('秘境降妖')
	local isfind=0
	local joinlocation={0,0,0,0}
	local location={0,0,0,0}	
	local ispart=0	
	local isok = 0
	local cnt=0
	local start = os.time()
	while true do
		--秘境超时
		if isMoveing()==false and os.difftime(os.time(),start) > 240 then
			jdwlLog('秘境超时')
			kill()
			isfind=0
			ispart=0
			isok=0
			cnt = 0
			start = os.time()
		--秘境降妖完成
		elseif isok == 1 and (DmFindPic('huodong.bmp',80,333,28,343,41) or DmFindPic('huodong1.bmp',85,338,62,348,73)) then
			logDebug('秘境降妖完成')
			five = 1
			break	
		--自动战斗
		elseif DmFindPic('zidongzhandou.bmp',85,1100,605,1114,615) then
			click(x,y)		 start = os.time()	
		--使用
		elseif DmFindPic('shiyong.bmp',85,982,508,995,521) then
			click(x,y)		 start = os.time()
		--秘境第五关
		elseif DmFindPic('mijing_5.bmp',85,323,526,334,549) then
			closewin()
			isok=1
		--秘境第六关打不过
		elseif DmFindPicFuzzy('mi.bmp',90,908,163,933,191,0xffffff) and DmFindPicFuzzy('mijing_6.bmp',90,930,206,941,223,0xffffff) then --1076,269
			click(x+146,y+60)
			isok = 1
		--秘境第一关
		elseif DmFindPic('mijing_1.bmp',85,265,354,276,378) then --321,312 
			click(x+65,y-40) start = os.time()
		--挑战按钮
		elseif DmFindPic('tiaozhan.bmp',85,611,451,630,468) or DmFindPic('zaicitiaozhan.bmp',85,631,454,647,464) then
			click(x,y) start = os.time()
		--战斗
		elseif DmFindPic('mjzhandou.bmp',85,918,352,940,368) then
			click(x,y) start = os.time()
		--进入地图挑战妖怪
		elseif isMoveing()==false and DmFindPicFuzzy('mi.bmp',90,908,163,933,191,0xffffff) then
			click(x,y) 
		--秘境降妖/规则说明
		elseif DmFindPic('mijingxiangyao.bmp',85,919,351,933,369) then
			click(x,y)		start = os.time()		
		--点击活动
		elseif ispart==0 and (DmFindPic('huodong.bmp',80,333,28,343,41) or DmFindPic('huodong1.bmp',85,338,62,348,73)) then
			click(x,y)
			mSleep(2000)
			isfind = 0
			start = os.time()
		--日常任务未选中
		elseif DmFindPic('richangrenwu.bmp',85,157,106,177,129) then
			click(x,y)
			start = os.time()
		--参加秘境
		elseif isfind == 1 and DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('canjia.bmp',85,joinlocation[1],joinlocation[2],joinlocation[3],joinlocation[4]) then
			click(x,y)	
			mSleep(1000)
			ispart = 1
		--活动界面秘境10/10
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('canjia.bmp',85,joinlocation[1],joinlocation[2],joinlocation[3],joinlocation[4])==false and  isfind == 1 then
			notifyMsg('活跃完成')
			isok=1
			closewin()		
		--查找秘境任务
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and (DmFindPic('mijing.bmp',80,284,88,1009,452) )then
			notifyMsg(x..','..y)mSleep(1000)
			isfind=1
			--计算参加按钮的相对位置
			joinlocation[1]=x+202
			joinlocation[2]=y+21
			joinlocation[3]=x+220
			joinlocation[4]=y+41
			--计算活跃值
			location[1]=x+133
			location[2]=y+40
			location[3]=x+151
			location[4]=y+60
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and cnt>3 then
			isok=1
			closewin()
			cnt=0
			start = os.time()
		elseif cnt>3 and DmFindPic('richangrenwu1.bmp',85,157,106,177,129) then
			isok=1
			cnt=0
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('mijing.bmp',80,284,88,1009,452)==false then	
			myMove_UD(989,391,989,295,10)
			cnt=cnt+1
			start = os.time()
		elseif DmFindPic('aixin.bmp',85,25,39,36,50) then
			start = os.time()
		else
			mSleep(500)
			connect()
		end
	end		
end

--是否可以进入秘境
function ismj()
	jdwlLog('是否能够秘境降妖')
	local isfind=0
	local joinlocation={0,0,0,0}
	local location={0,0,0,0}	
	local ispart=0	
	local isok = 0
	local cnt=0
	local start = os.time()
	local ret=0
	while true do
		--秘境超时
		if isMoveing()==false and os.difftime(os.time(),start) > 240 then
			jdwlLog('是否能够秘境降妖超时')
			kill()
			isfind=0
			ispart=0
			isok=0
			cnt = 0
			start = os.time()
		--秘境降妖完成
		elseif isok == 1 and (DmFindPic('huodong.bmp',80,333,28,343,41) or DmFindPic('huodong1.bmp',85,338,62,348,73)) then
			logDebug('是否能够秘境降妖完成')
			return ret	
		elseif isok==1 	and DmFindPic('richangrenwu1.bmp',85,157,106,177,129) then
			closewin()
		--自动战斗
		elseif DmFindPic('zidongzhandou.bmp',85,1100,605,1114,615) then
			click(x,y)		 start = os.time()	
		--使用
		elseif DmFindPic('shiyong.bmp',85,982,508,995,521) then
			click(x,y)		 start = os.time()
		--战斗
		elseif DmFindPic('mjzhandou.bmp',85,918,352,940,368) then
			click(x,y) start = os.time()
		--秘境降妖/规则说明
		elseif DmFindPic('mijingxiangyao.bmp',85,919,351,933,369) then
			click(x,y)		start = os.time()		
		--点击活动
		elseif ispart==0 and (DmFindPic('huodong.bmp',80,333,28,343,41) or DmFindPic('huodong1.bmp',85,338,62,348,73)) then
			click(x,y)
			mSleep(2000)
			isfind = 0
			start = os.time()
		--日常任务未选中
		elseif DmFindPic('richangrenwu.bmp',85,157,106,177,129) then
			click(x,y)
			start = os.time()
		--查找秘境任务
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and (DmFindPic('mijing.bmp',80,284,88,1009,452) )then
			notifyMsg(x..','..y)mSleep(1000)
			isfind=1
			--计算参加按钮的相对位置
			joinlocation[1]=x+202
			joinlocation[2]=y+21
			joinlocation[3]=x+220
			joinlocation[4]=y+41
			--计算活跃值
			location[1]=x+133
			location[2]=y+40
			location[3]=x+151
			location[4]=y+60
			ret=1
			isok=1
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and cnt>3 then
			isok=1
			closewin()
			cnt=0
			start = os.time()
			ret=0
		elseif cnt>3 and DmFindPic('richangrenwu1.bmp',85,157,106,177,129) then
			isok=1
			cnt=0
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('mijing.bmp',80,284,88,1009,452)==false then	
			myMove_UD(989,391,989,295,10)
			cnt=cnt+1
			start = os.time()
		elseif DmFindPic('aixin.bmp',85,25,39,36,50) then
			start = os.time()
		else
			mSleep(500)
			connect()
		end
	end			
end
--宝图
function baotu()
	jdwlLog('宝图')
	local isfind=0
	local joinlocation={0,0,0,0}
	local location={0,0,0,0}	
	local ispart=0
	local count = 0
	local canjia=0
	local isok=0
	local start = os.time()
	while true do
		if isMoveing() == false and os.difftime(os.time(),start) > 180 then
			jdwlLog('宝图超时')
			kill()
			isfind = 0
			ispart = 0
			count =0
			canjia=0
			isok = 0
			start = os.time()
		--宝图完成
		elseif isok == 1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			logDebug('宝图完成')
			four = 1
			break
		--点击对话情况下的任务栏
		elseif DmFindPic('baoguo.bmp',85,1086,522,1099,533)==false and DmFindPic('renwulan.bmp',85,835,243,845,480) then
			click(x+20,y)
			ispart = 1	
			start = os.time()		
		--使用
		elseif DmFindPic('shiyong.bmp',85,982,508,995,521) then
			click(x,y)mSleep(1500)	start = os.time()		
		--点击宝图任务字样
		elseif (DmFindPicFuzzy('baotu.bmp',90,921,163,977,414,0xffffff) or DmFindPicFuzzy('baotu1.bmp',90,921,163,977,414,0xffffff))and isMoveing()==false then--921,163,977,414
			click(x,y)
			ispart = 1
			canjia = 0
		--自动战斗
		elseif DmFindPic('zidongzhandou.bmp',85,1100,605,1114,615) then
			click(x,y)	start = os.time()				
		elseif canjia ==1 and (DmFindPicFuzzy('baotu.bmp',90,921,163,977,414,0xffffff)==false or DmFindPicFuzzy('baotu1.bmp',90,921,163,977,414,0xffffff)==false) and isMoveing() == false and 
				DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			isok=1			
		--点击活动
		elseif ispart==0 and (DmFindPic('huodong.bmp',80,333,28,343,41) or DmFindPic('huodong1.bmp',85,338,62,348,73)) then
			click(x,y)
			mSleep(2000)
			isfind = 0
			start = os.time()
		--日常任务未选中
		elseif DmFindPic('richangrenwu.bmp',85,157,106,177,129) then
			click(x,y)
			start = os.time()
		--参加宝图
		elseif isfind == 1 and DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('canjia.bmp',85,joinlocation[1],joinlocation[2],joinlocation[3],joinlocation[4]) then
			click(x,y)
			ispart = 1
			canjia = 0
		--任务栏没有宝图字样
		elseif count > 15 then
			ispart = 0
			count = 0
		elseif DmFindPic('baoguo.bmp',85,1086,522,1099,533) and DmFindPicFuzzy('baotu.bmp',90,921,163,977,414,0xffffff) ==false then
			count = count + 1
		--活动界面宝图10/10
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('canjia.bmp',85,joinlocation[1],joinlocation[2],joinlocation[3],joinlocation[4])==false and  isfind == 1 then
			notifyMsg('活跃完成')
			canjia=1
			closewin()		
		--查找宝图任务
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('baoturenwu.bmp',80,284,88,1009,452) then
			--[[notifyMsg(x..','..y)--]]
			isfind=1
			--计算参加按钮的相对位置
			joinlocation[1]=x+202
			joinlocation[2]=y+21
			joinlocation[3]=x+220
			joinlocation[4]=y+41
			--计算活跃值
			location[1]=x+133
			location[2]=y+40
			location[3]=x+151
			location[4]=y+60
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('baoturenwu.bmp',80,284,88,1009,452)==false then	
			myMove_UD(989,391,989,295,10)
		--对话框遮挡住菜单栏
		elseif DmFindPic('heibeibao.bmp',85,1082,494,1093,506) then
			click(x,y)			
			start = os.time()
		elseif DmFindPic('aixin.bmp',85,25,39,36,50) then
			start = os.time()
		else
			mSleep(500)
			connect()
		end		
	end
end

--拉镖
function yunbiao()
	jdwlLog('运镖')
	local ispart=0
	local isok=0
	local isfind=0
	local joinlocation={0,0,0,0}
	local location={0,0,0,0}	
	local start = os.time()
	while true do
		if isMoveing()==false and os.difftime(os.time(),start) > 240 then
			jdwlLog('运镖超时')
			kill()
			ispart = 0
			isok=0
			isfind = 0
			start = os.time()
		--师门完成
		elseif isok == 1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			logDebug('运镖完成')
			break	
		--银币不够
		elseif DmFindPic('x_xiaofei.bmp',85,766,219,780,233) then
			click(x,y)
			isok = 1			
		--点击活动
		elseif ispart==0 and (DmFindPic('huodong.bmp',80,333,28,343,41) or DmFindPic('huodong1.bmp',85,338,62,348,73)) then
			click(x,y)		
			mSleep(2000)
			isfind = 0
			start = os.time()
		--活跃不够50点
		elseif DmFindPic('50.bmp',85,586,280,604,296) then --480,388
			click(x-100,y+100)
			isok = 1
			start = os.time()
		--使用
		elseif DmFindPic('shiyong.bmp',85,982,508,995,521) then
			click(x,y)mSleep(1500)		start = os.time()	
		--自动战斗
		elseif DmFindPic('zidongzhandou.bmp',85,1100,605,1114,615) then
			click(x,y) start = os.time()
		--日常任务未选中
		elseif DmFindPic('richangrenwu.bmp',85,157,106,177,129) then
			click(x,y) start = os.time()
		--参加运镖
		elseif isfind == 1 and DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('canjia.bmp',85,joinlocation[1],joinlocation[2],joinlocation[3],joinlocation[4]) then
			click(x,y)
			ispart = 1	
		--活动界面宝图10/10
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('canjia.bmp',85,joinlocation[1],joinlocation[2],joinlocation[3],joinlocation[4])==false and  isfind == 1 then
			notifyMsg('活跃完成')
			isok=1
			closewin()		
		--查找师门任务任务
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('yunbiao.bmp',80,284,88,1009,452) then
			notifyMsg(x..','..y)
			isfind=1
			--计算参加按钮的相对位置
			joinlocation[1]=x+202
			joinlocation[2]=y+21
			joinlocation[3]=x+220
			joinlocation[4]=y+41
			--计算活跃值
			location[1]=x+133
			location[2]=y+40
			location[3]=x+151
			location[4]=y+60
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('yunbiao.bmp',80,284,88,1009,452)==false then	
			myMove_UD(989,391,989,295,10)
		--押送普通飙车
		elseif DmFindPic('yasong.bmp',85,896,349,911,362) then
			click(x,y)
			start = os.time()
		--交付押金
		elseif DmFindPic('jiaofu.bmp',85,385,291,398,307) --[[and DmFindPic('jiaofuqueding.bmp',85,644,363,657,378)--]] then--644 363
			click(x+260,y+72)
			ispart=0
			start = os.time()
		--运镖之后将ispart参数复位
		elseif DmFindPic('yaochi.bmp',85,251,124,264,134) then
			ispart = 0
			start = os.time()
		elseif DmFindPic('aixin.bmp',85,25,39,36,50) then
			start = os.time()
		--对话框遮挡住菜单栏
		elseif DmFindPic('heibeibao.bmp',85,1082,494,1093,506) then
			click(x,y)		
			start = os.time()				
		else
			mSleep(500)
			connect()
		end
	end
end

--帮派任务
function bangpairenwu()
	jdwlLog('帮派任务')
	local ispart=0
	local isok=0
	local isfind=0
	local joinlocation={0,0,0,0}
	local location={0,0,0,0}		
	local count = 0
	local canjia=0
	local cnt=0
	local dianji=0
	local start = os.time()
	while true do
		--帮派任务完成
		if isok == 1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			logDebug('帮派完成')
			five= 1
			break	
		--使用
		elseif DmFindPic('shiyong.bmp',85,982,508,995,521) then
			click(x,y)mSleep(1500)	start = os.time()
		--点击对话情况下的任务栏
		elseif DmFindPic('baoguo.bmp',85,1086,522,1099,533)==false and DmFindPic('renwulan.bmp',85,835,243,845,480) then
			click(x+20,y)			
			count = 0
		elseif (dianji>20 or os.difftime(os.time(),start)>300) and isMoveing()==false then
			kill()
			ispart = 0
			isok=0
			isfind = 0
			count = 0
			canjia = 0
			cnt=0
			dianji=0
			jdwlLog('帮派任务卡住了')
			os.execute("reboot")
		--点击帮派任务字样
		elseif DmFindPic('baoguo.bmp',85,1086,522,1099,533) and (DmFindPicFuzzy('xuanwu.bmp',90,920,163,982,452,0xffffff) or DmFindPicFuzzy('zhuque.bmp',90,920,163,982,452,0xffffff))and isMoveing()==false then
			click(x,y)
			ispart = 1	
			canjia=0
			dianji=dianji+1
			mSleep(1000)	
		elseif DmFindPic('baoguo.bmp',85,1086,522,1099,533) and (DmFindPicFuzzy('qinglong.bmp',90,920,163,982,452,0xffffff) or DmFindPicFuzzy('zhuque.bmp',90,920,163,982,452,0xffffff))and isMoveing()==false then
			click(x,y)
			ispart = 1		
			canjia=0
			dianji=dianji+1
			mSleep(1000)		
		elseif canjia ==1 and (DmFindPicFuzzy('xuanwu.bmp',90,920,163,982,452,0xffffff)==false or DmFindPicFuzzy('zhuque.bmp',90,920,163,982,452,0xffffff)==false ) and 
				(DmFindPicFuzzy('qinglong.bmp',90,920,163,982,452,0xffffff)==false  or DmFindPicFuzzy('zhuque.bmp',90,920,163,982,452,0xffffff)==false ) and 
				isMoveing()==false and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			isok=1
			closewin()
		--点击活动
		elseif ispart==0 and (DmFindPic('huodong.bmp',80,333,28,343,41) or DmFindPic('huodong1.bmp',85,338,62,348,73)) then
			click(x,y)			
			mSleep(2000)
			isfind = 0		
			dianji = 0
			start = os.time()
		--自动战斗
		elseif DmFindPic('zidongzhandou.bmp',85,1100,605,1114,615) then
			click(x,y)
			dianji = 0
			start = os.time()
		--日常任务未选中
		elseif DmFindPic('richangrenwu.bmp',85,157,106,177,129) then
			click(x,y)
			dianji = 0
			start = os.time()
		--参加帮派任务
		elseif isfind == 1 and DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('canjia.bmp',85,joinlocation[1],joinlocation[2],joinlocation[3],joinlocation[4]) then
			click(x,y)
			ispart = 1	
			canjia=0
			dianji = 0
		--活动界面帮派任务
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('canjia.bmp',85,joinlocation[1],joinlocation[2],joinlocation[3],joinlocation[4])==false and  isfind == 1 then
			notifyMsg('活跃完成')
			canjia=1
			closewin()		
		--查找帮派任务
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('bangpairenwu.bmp',80,284,88,1009,452) then
			notifyMsg(x..','..y)
			isfind=1
			--计算参加按钮的相对位置
			joinlocation[1]=x+202
			joinlocation[2]=y+21
			joinlocation[3]=x+220
			joinlocation[4]=y+41
			--计算活跃值
			location[1]=x+133
			location[2]=y+40
			location[3]=x+151
			location[4]=y+60
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and cnt>3 then
			isok=1
			closewin()
			cnt=0
		elseif DmFindPic('richangrenwu1.bmp',85,157,106,177,129) and DmFindPic('bangpairenwu.bmp',80,284,88,1009,452)==false then	
			myMove_UD(989,391,989,295,10)
			cnt=cnt+1
		--领取帮派任务
		elseif DmFindPic('lingqubangpai.bmp',85,894,410,907,423) then
			click(x,y)
			dianji = 0
			start = os.time()
		--帮派购买
		elseif DmFindPic('goumaibingqi.bmp',85,831,511,845,525) or DmFindPic("goumaibaoshi.bmp",85,806,569,821,580) then
			click(x,y)		
			count = 0
			dianji = 0
			start = os.time()
		--购买摆摊物品
		elseif DmFindPic('pengren.bmp',85,351,158,363,168) then
			click(x,y) start = os.time()
		elseif DmFindPic('pengren1.bmp',85,352,157,364,171) and DmFindPic('goumaipengren.bmp',85,847,566,860,582) then
			click(x,y) start = os.time()
		--师门购买兵器
		elseif DmFindPic('goumaibingqi.bmp',85,831,511,845,525) then
			click(x,y) start = os.time()
		--师门购买宠物
		elseif DmFindPic('goumaichongwu.bmp',85,886,568,900,580) then
			click(x,y)mSleep(500)
			closewin() start = os.time()
		--上交任务物品/任务物品选择
		elseif DmFindPic('wupingxuanze.bmp',85,926,517,937,525) then
			click(x,y) start = os.time()
		--上交兵器
		elseif DmFindPic('shangjiaobingqi.bmp',85,943,512,954,523) then
			click(x,y) start = os.time()
		--上交宠物
		elseif DmFindPic('shangjiaochongwu.bmp',85,740,520,754,531) then
			click(x,y)		 start = os.time()				
		--开场动画跳过剧情
		elseif DmFindPicFuzzy('tiaoguojuqing.bmp',95,1093,29,1121,51,0xffffff) then
			click(x,y) start = os.time()
		elseif DmFindPicFuzzy('tiaoguojuqing1.bmp',95,1092,31,1120,51,0xffffff) then
			click(x,y) start = os.time()
		--点击继续
		elseif DmFindPicFuzzy('dianjijixu.bmp',95,1091,50,1121,72,0xffffff) then
			click(x,y)		 start = os.time()	
		--点击帮派任务字样
		elseif count > 20 then
			ispart = 0
			count = 0
		elseif (DmFindPicFuzzy('xuanwu.bmp',90,920,163,982,452,0xffffff)==false or DmFindPicFuzzy('zhuque.bmp',90,920,163,982,452,0xffffff)==false )and isMoveing()==false and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			count = count + 1
		elseif (DmFindPicFuzzy('qinglong.bmp',90,920,163,982,452,0xffffff)==false  or DmFindPicFuzzy('zhuque.bmp',90,920,163,982,452,0xffffff)==false )and isMoveing()==false and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			count = count + 1	
		--活跃不够50点
		elseif DmFindPic('50.bmp',85,586,280,604,296) then --480,388
			click(x-100,y+100)	start = os.time()		
		--对话框遮挡住菜单栏
		elseif DmFindPic('heibeibao.bmp',85,1082,494,1093,506) then
			click(x,y)				
			dianji = 0	
			start = os.time()
		elseif DmFindPic('aixin.bmp',85,25,39,36,50) then
			start = os.time()	
		else
			mSleep(500)
			connect()
		end
	end
end

--领取指引里面的奖励
function jiangli()
	jdwlLog('领取指引奖励')
	local isok=0
	local tt = os.time()
	while true do
		if isok==1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog('领取指引奖励完成')
			break
		elseif os.difftime(os.time(),tt) > 90 then
			closewin()
			isok=1
		--点击指引
		elseif DmFindPic('zhiyin.bmp',85,252,57,262,72) then
			click(x,y)
		--萌宠相伴
		elseif DmFindPic('lingqu.bmp',85,880,129,895,141) then
			click(x,y)
		--建业传闻
		elseif DmFindPic('lingqujianye.bmp',85,905,349,916,363) then
			click(x,y)
		--三界群雄
		elseif DmFindPic('lingqusanjie.bmp',85,882,115,896,125) then
			click(x,y)
		--建设师门
		elseif DmFindPic('lingqushimen.bmp',85,879,335,893,346) then
			click(x,y)
		--含冤小白龙
		elseif DmFindPic('lingquhanyuan.bmp',85,880,445,895,459) then
			click(x,y)
		--抽奖
		elseif DmFindPic('choujiang.bmp',85,572,316,585,330) then
			click(x,y)
		--领完了
		elseif DmFindPic('zhuangbeidaquan.bmp',85,216,106,229,120) then
			closewin()
			isok=1
		else
			closewin()
			mSleep(300)
		end
	end
end

--领取玉面狐狸
function huli()
	jdwlLog('领取玉面狐狸')
	local isok=0
	local tt = os.time()
	while true do
		if isok==1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog('领取玉面狐狸完成')
			break
		elseif os.difftime(os.time(),tt)	> 180 then
			kill()
			jdwlLog('玉面狐狸超时')
			isok=0
			tt=os.time()
		elseif os.difftime(os.time(),tt) > 90 then
			closewin()
			isok=1
		--点击指引
		elseif DmFindPic('zhiyin.bmp',85,266,40,277,52) then
			click(x,y)
		--10/19级
		elseif DmFindPic('1019.bmp',85,228,181,245,195) then
			click(x,y)
		--三界群雄
		elseif DmFindPic('1019hei.bmp',85,236,179,246,196) and DmFindPic('lingqusanjie.bmp',85,856,134,870,145) then
			click(x,y)
		--领完了
		elseif DmFindPic('yilingqu.bmp',85,867,129,880,146) or DmFindPic('zhuangbeidaquan.bmp',85,216,106,229,120) then
			closewin()
			isok=1
		else
			--[[close()--]]
			mSleep(500)
			connect()
		end
	end	
end

--替换玉面狐狸上阵
function tihuan()
	jdwlLog('替换玉面狐狸')
	local sppick=0
	local wz=0
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 180 then
			jdwlLog('替换玉面狐狸超时')
			kill()
			sppick=0
			wz=0
			tt=os.time()
		--替换完成
		elseif sppick == 1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog('替换玉面狐狸完成')
			break
		--确定玉面狐狸选择
		elseif DmFindPic('yumian.bmp',85,949,185,958,195) then
			sppick = 1
			closewin()
		--点击菜单栏
		elseif DmFindPic('caidan.bmp',85,1077,591,1085,600) then
			click(x,y)
		--对话框遮挡住菜单栏
		elseif DmFindPic('heibeibao.bmp',85,1082,494,1093,506) then
			click(x,y)
		--点击助战图标
		elseif DmFindPic('monkey.bmp',85,1000,588,1009,598) then
			click(x,y)
		--选择治疗系
		elseif DmFindPic('sp.bmp',85,342,589,358,604) then
			click(x,y)
		--上阵玉面狐狸
		elseif DmFindPic('shang.bmp',85,182,264,192,272) then
			click(x,y)
		elseif wz==1 and DmFindPic('shang.bmp',85,182,264,192,272)==false and  DmFindPic('wuzhen.bmp',85,909,112,920,126) then
			sppick=1
			closewin()
		--点击第四栏
		elseif DmFindPic('wuzhen.bmp',85,909,112,920,126) then--946,203
			click(x+40,y+90)
			wz=1
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
	local count = 0
	local tt=os.time()
	while true do
		--升级技能超时
		if os.difftime(os.time(),tt)> 180 then
			kill()
			jdwlLog('升级技能超时')
			isok = 0
			count=0
			tt=os.time()
		--升级完成
		elseif isok==1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog('技能升级完成')
			break
		--点击菜单栏
		elseif DmFindPic('caidan.bmp',85,1077,591,1085,600) then
			click(x,y)mSleep(1000)
		--对话框遮挡住菜单栏
		elseif DmFindPic('heibeibao.bmp',85,1082,494,1093,506) then
			click(x,y)
		--点击人物栏
		elseif DmFindPic('person.bmp',85,1016,153,1029,168) then
			click(x,y)
		--打开技能界面
		elseif DmFindPic('jineng.bmp',85,918,586,929,597) then
			click(x,y)
		--技能等级不能超过人物等级
		elseif count>5 or DmFindPic('bunengchaoguo.bmp',85,649,287,659,300) then
			closewin()
			isok=1
		--一键升级
		elseif DmFindPic('yijianshengji.bmp',85,893,554,904,568) then
			click(x,y)mSleep(1000)
			count = count + 1
		--菜单已经展开但是查找不到
		elseif DmFindPic('caidan1.bmp',85,1082,580,1091,590) then
			click(x,y)mSleep(500)			
		--银币不够
		elseif DmFindPic('x_xiaofei.bmp',85,766,219,780,233) then
			click(x,y)
			isok = 1		
			closewin()	
		else
			mSleep(500)
			connect()
		end
	end
end
--加入帮派
function jiarubp()
	jdwlLog('加入帮派')
	local isok=0
	local tt=os.time()
	while true do
		--加入帮派超时
		if os.difftime(os.time(),tt) > 180 then
			jdwlLog('加入帮派超时')
			kill()
			isok=0
			tt=os.time()
		--加入帮派完成
		elseif isok==1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog('加入帮派完成')
			break	
		--点击菜单栏
		elseif DmFindPic('caidan.bmp',85,1077,591,1085,600) then
			click(x,y)mSleep(1000)
		--对话框遮挡住菜单栏
		elseif DmFindPic('heibeibao.bmp',85,1082,494,1093,506) then
			click(x,y)			
		--点击菜单栏帮派
		elseif DmFindPic('bangpai.bmp',85,839,595,849,608) or DmFindPic("bangpai1.bmp",85,757,594,768,603) then
			click(x,y)
		--一键申请
		elseif DmFindPic('yijianshenqing.bmp',85,831,316,844,328) then
			click(x,y)
		--已经有帮派了
		elseif DmFindPic('huidaobangpai.bmp',85,827,561,838,573) then
			closewin()
			isok=1
		--菜单已经展开但是查找不到
		elseif DmFindPic('caidan1.bmp',85,1082,580,1091,590) then
			click(x,y)mSleep(500)
		else
			mSleep(500)
			connect()
		end
	end
end

--背包相关
function beibao()
	jdwlLog('背包相关')
	local isok=0
	local sj = os.time()
	while true do
		--背包相关完成
		if isok==1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog('背包相关完成')
			break		
		elseif os.difftime(os.time(),sj)>180 then
			kill()
			jdwlLog('背包超时')
			isok = 0
			sj=os.time()
		--卡了
		elseif os.difftime(os.time(),sj) > 90 and DmFindPic('zhengli.bmp',85,849,571,862,584) then
			isok=1
			closewin()
		--对话框遮挡住菜单栏
		elseif DmFindPic('heibeibao.bmp',85,1082,494,1093,506) then
			click(x,y)			
		--打开背包	
		elseif DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			click(x,y)
		--当前格子为空
		elseif DmFindPic('kongge.bmp',85,605,178,623,190) and DmFindPic('zhengli.bmp',85,849,571,862,584) then
			click(x,y)mSleep(1000)
		--点击装备
		elseif DmFindPic('lvjiantou.bmp',75,688,221,776,369) and (DmFindPic('zhuangbei.bmp',80,742,396,884,544) or DmFindPic('zhuangbei1.bmp',80,742,396,884,544)) then
			click(x,y)mSleep(1000)
			--[[sj=os.time()--]]
		--暂时没有装备穿了,左侧出现使用字样
		elseif DmFindPic('yong.bmp',80,431,394,480,444) or DmFindPic('yong1.bmp',80,455,417,470,432) then
			isok=1
			closewin()
		--确认已经打,整理字样出现
		elseif DmFindPic('zhengli.bmp',85,849,571,862,584) then
			click(613,182)
		else
			mSleep(500)
			connect()
		end
	end
end
--穿戴分解装备
function equip()
	jdwlLog('穿戴分解装备')
	local count = 1
	local isok=0
	local startTime = os.time()
	while(true)do
		--穿戴分解装备完成
		if isok==1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog('穿戴分解装备完成')
			break	
		elseif DmFindPic('yong.bmp',80,431,394,480,444) or DmFindPic('yong1.bmp',80,455,417,470,432) or DmFindPic('shiyongzhuque.bmp',85,433,401,446,416) then
			isok=1
			closewin()
		elseif os.difftime(os.time(),startTime) > 240 then
			kill()
			jdwlLog('穿戴分解装备')
			count =1
			isok=0
			startTime=os.time()
		elseif os.difftime(os.time(),startTime) > 90 then
			closewin()
			isok=1
		--对话框遮挡住菜单栏
		elseif DmFindPic('heibeibao.bmp',85,1082,494,1093,506) then
			click(x,y)			
		--打开背包	
		elseif DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			click(x,y)			
		elseif DmFindPic('space.bmp',80,598,166,628,195) and DmFindPic('zhengli.bmp',85,849,571,862,584) then
			click(x,y)
		elseif DmFindPic('delete.bmp',70,588,351,720,557)  then
			click(x,y)
		elseif DmFindPic('down_red.bmp',65,679,232,813,361) == false and DmFindPic('up_green.bmp',65,603,246,821,342) == false and DmFindPic('equip_new.bmp',70,778,402,843,536)  then
			click(x-120,y) 
		elseif (DmFindPic('down_red.bmp',65,679,232,813,361) or count > 3)and DmFindPic('equip_new.bmp',70,778,402,843,536) then--652,494
			click(x-120,y) 
			count = count - 1
		elseif DmFindPic('up_green.bmp',65,603,246,821,342) and DmFindPic('equip_new.bmp',70,778,402,843,536) then
			click(x,y)
			count = count + 1
		--确认已经打,整理字样出现
		elseif DmFindPic('zhengli.bmp',85,849,571,862,584) then
			click(613,182)mSleep(1000)
		else
			mSleep(500)
			connect()
		end
	end
end

--穿戴分解装备
function equipone()
	jdwlLog('穿戴分解装备one')
	local count = 1
	local isok=0
	local startTime = os.time()
	while(true)do
		--穿戴分解装备完成
		if isok==1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog('穿戴分解装备one完成')
			break	
		elseif DmFindPic('yong.bmp',80,431,394,480,444) or DmFindPic('yong1.bmp',80,455,417,470,432) then
			isok=1
			closewin()
		elseif os.difftime(os.time(),startTime) > 240 then
			kill()
			count = 1
			isok=0
			jdwlLog('穿戴分解装备one超时')
			startTime=os.time()
		elseif os.difftime(os.time(),startTime) > 90 then
			closewin()
			isok=1
		--对话框遮挡住菜单栏
		elseif DmFindPic('heibeibao.bmp',85,1082,494,1093,506) then
			click(x,y)			
		--打开背包	
		elseif DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			click(x,y)			
		elseif DmFindPic('space.bmp',80,598,166,628,195) and DmFindPic('zhengli.bmp',85,849,571,862,584) then
			click(x,y)
--[[		elseif DmFindPic('delete.bmp',70,588,351,720,557)  then
			click(x,y)
		elseif DmFindPic('down_red.bmp',65,679,232,813,361) == false and DmFindPic('up_green.bmp',65,603,246,821,342) == false and DmFindPic('equip_new.bmp',70,778,402,843,536)  then
			click(x-120,y) 
		elseif (DmFindPic('down_red.bmp',65,679,232,813,361) or count > 3)and DmFindPic('equip_new.bmp',70,778,402,843,536) then--652,494
			click(x-120,y) 
			count = count - 1
		elseif DmFindPic('up_green.bmp',65,603,246,821,342) and DmFindPic('equip_new.bmp',70,778,402,843,536) then
			click(x,y)
			count = count + 1--]]
		elseif DmFindPic('equip_new.bmp',70,778,402,843,536) then			
			click(x,y)
		--确认已经打,整理字样出现
		elseif DmFindPic('zhengli.bmp',85,849,571,862,584) then
			click(613,182)mSleep(1000)
		else
			mSleep(500)
			connect()
		end
	end
end

--使用马面作为出站宝宝
function mamian()
	jdwlLog('使用马面')
	local isok=0
	local cnt=0
	local start=os.time()
	while true do
		if os.difftime(os.time(),start) > 180 then
			kill()
			jdwlLog('使用马面超时')
			isok=0
			cnt=0
			start=os.time()
		--替换完成
		elseif isok == 1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog('马面替换完成')
			break
		--根据头像点击宠物栏
		elseif DmFindPic('touxiang.bmp',85,1093,39,1104,48) then
			click(948,40)
		elseif cnt>5  then
			closewin()
			isok=1
		--马面参战
		elseif DmFindPic('ma.bmp',85,328,95,340,106) and DmFindPic('canzhan.bmp',85,869,567,882,578) then
			click(x,y)
			cnt=cnt+1
			mSleep(500)
		--如果马面已经参战则退出
		elseif DmFindPic('ma.bmp',85,328,95,340,106) and DmFindPic('xiuxi.bmp',85,866,564,882,577) then
			click(985,46)
			isok=1
		--确认宠物栏打开
		elseif DmFindPic('zhan.bmp',85,590,92,600,103) and DmFindPic('mamian.bmp',80,150,419,533,517) then
			click(x,y)
		--万一没有马面
		elseif DmFindPic('zhan.bmp',85,590,92,600,103) and DmFindPic('mamian.bmp',80,150,419,533,517)==false then
			closewin()
			isok=1
		else
			mSleep(500)
			connect()
		end
	end
end

--放生宠物
--485,557  393,558 297,560 196,559
function fangsheng()
	jdwlLog("放生宠物")
	local code=0
	local isok=0
	local cnt=0
	local start=os.time()
	local sr=0
	while true do
		if os.difftime(os.time(),start) > 180 then
			kill()
			jdwlLog('放生宠物超时')
			isok=0
			cnt=0
			start=os.time()
			break
		--替换完成
		elseif isok == 1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog('放生宠物完成')
			break
		--根据头像点击宠物栏
		elseif DmFindPic('touxiang.bmp',85,1093,39,1104,48) then
			click(948,40)
		--如果马面已经参战则退出
		elseif DmFindPic('ma.bmp',85,328,95,340,106)==false and DmFindPic('xiuxi.bmp',85,866,564,882,577) then		
			click(x,y)
		--确认宠物栏打开
		elseif DmFindPic('zhan.bmp',85,590,92,600,103) and DmFindPic('ma.bmp',85,328,95,340,106)==false and DmFindPic("fangsheng.bmp",85,606,565,621,577) then
			click(x,y)
		elseif DmFindPic('zhan.bmp',85,590,92,600,103) and DmFindPic('ma.bmp',85,328,95,340,106) and DmFindPic("fangsheng.bmp",85,606,565,621,577) then
			if DmFindPic('canzhan.bmp',85,869,567,882,578) then
				click(x,y)mSleep(1000)
			end
			click(189,563)
		--关闭购买宠物
		elseif DmFindPic("x_goumaichongwu.bmp",85,1009,42,1022,53) then
			click(x,y)
			closewin()
			isok=1
		--验证码弹出来
		elseif sr==1 and DmFindPic("anniufangsheng.bmp",85,663,440,676,454) then
			click(x,y)
			sr=0
			code=0
		elseif string.len(code) == 4 and DmFindPic("anniufangsheng.bmp",85,663,440,676,454) then
			dianji(code)
			sr=1
		--验证码弹出来
		elseif DmFindPic("anniufangsheng.bmp",85,663,440,676,454) then
			click(467,366)
			code = shibie()
		else
			mSleep(500)
			connect()
		end
	end	
end

--具体位置
--612,359,625,379
--623,359,636,379
--634,359,647,379
--645,359,658,379
--识别放生宠物验证码
function shibie()
	local i=0
	local ret={}
	for i=1,4 do
		local x1=612+(i-1)*11
		local y1=625+(i-1)*11
		if DmFindPic("0.bmp",85,x1,359,y1,379) then	
			ret[i]="0" --notifyMsg(ret[i])
		elseif DmFindPic("1.bmp",85,x1,359,y1,379) then
			ret[i]="1" --notifyMsg(ret[i])
		elseif DmFindPic("2.bmp",85,x1,359,y1,379) then
			ret[i]="2" --notifyMsg(ret[i])
		elseif DmFindPic("3.bmp",85,x1,359,y1,379) then
			ret[i]="3" --notifyMsg(ret[i])
		elseif DmFindPic("4.bmp",85,x1,359,y1,379) then
			ret[i]="4" --notifyMsg(ret[i])
		elseif DmFindPic("5.bmp",85,x1,359,y1,379) then
			ret[i]="5" --notifyMsg(ret[i])
		elseif DmFindPic("6.bmp",85,x1,359,y1,379) then
			ret[i]="6" --notifyMsg(ret[i])
		elseif DmFindPic("7.bmp",85,x1,359,y1,379) then
			ret[i]="7" --notifyMsg(ret[i])
		elseif DmFindPic("8.bmp",85,x1,359,y1,379) then
			ret[i]="8" --notifyMsg(ret[i])
		elseif DmFindPic("9.bmp",85,x1,359,y1,379) then
			ret[i]="9" --notifyMsg(ret[i])
		else
			mSleep(300)
		end
	end
	local jiage=''
		for j=1,#ret do
			if type(ret[j])=="string" then
				jiage =jiage..ret[j]
			end
		end	
	return jiage
end

--识别之后点击
--1 251,120
--2 333,120
--3 416,118
--4 249,197
--5 333,194
--6 417,197
--7 252,273
--8 335,273
--9 417,271
--0 500,196
function dianji(code)
	local index=0
	local lens=string.len(code)
	for index=1,lens do
		local a=string.sub(code,index,index)
		if a=="0" then
			click(500,196)
		elseif a=="1" then
			click(251,120)
		elseif a=="2" then
			click(333,120)
		elseif a=="3" then
			click(416,118)
		elseif a=="4" then
			click(249,197)
		elseif a=="5" then
			click(333,194)
		elseif a=="6" then
			click(417,197)
		elseif a=="7" then
			click(252,273)
		elseif a=="8" then
			click(335,273)
		elseif a=="9" then
			click(417,271)
		else
			mSleep(100)
		end	
	end
end
--使用掉宝图
function shiyongbaotu()
	jdwlLog('使用宝图')
	local isok=0
	local count=0
	local start=os.time()
	while true do
		if isMoveing()==false and os.difftime(os.time(),start) > 180 then
			kill()
			jdwlLog('使用宝图超时')
			isok=0
			count=0
			start = os.time()
		--使用宝图完成
		elseif isok == 1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog('使用宝图完成')
			break	
		--使用
		elseif DmFindPic('shiyong.bmp',85,982,508,995,521) then
			click(x,y)mSleep(1500)
			start=os.time()
		--自动战斗
		elseif DmFindPic('zidongzhandou.bmp',85,1100,605,1114,615) then
			click(x,y)		
			start=os.time()				
		--对话框遮挡住菜单栏
		elseif DmFindPic('heibeibao.bmp',85,1082,494,1093,506) then
			click(x,y)	
			start=os.time()
		--使用宝图
		elseif DmFindPic('lantu.bmp',85,366,235,386,256) then--451,406
			click(x+85,y+171)mSleep(1500)	
			start=os.time()		
		--人物停止移动之后打开包裹
		elseif isMoveing()==false and (DmFindPic('baoguo.bmp',85,1086,522,1099,533) or DmFindPic('baoguo1.bmp',85,1093,495,1103,504))then
			click(x,y)
			start=os.time()
		--查找宝图
		elseif DmFindPic('zhengli.bmp',85,849,571,862,584) and --[[DmFindPic('tu.bmp',75,578,152,968,535)--]]DmFindPic('treasure_map.bmp',70,578,152,968,535) then
			click(x,y)
			start=os.time()
		elseif count > 2 then
			isok=1
			closewin()
		--如果宝图没了
		elseif DmFindPic('zhengli.bmp',85,849,571,862,584) and --[[DmFindPic('tu.bmp',75,578,152,968,535)==false--]]DmFindPic('treasure_map.bmp',70,578,152,968,535)==false then
			count=count+1
			mSleep(500)
		elseif DmFindPic('aixin.bmp',85,25,39,36,50) then
			start = os.time()
		else
			mSleep(500)
			connect()
		end	
	end
end

--领取双倍点数
function shuangbei()
	jdwlLog('领双')
	local start = os.time()
	local isok=0
	while true do
		--领双超时
		if isMoveing()==false and os.difftime(os.time(),start) > 180 then
			kill()
			jdwlLog('领双超时')
			isok=0
			start = os.time()
		elseif isok == 1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			logDebug('领双完毕')
			break	
		--点击挂机图标
		elseif DmFindPic('guaji.bmp',80,435,24,443,38) or DmFindPic('guaji1.bmp',80,434,25,444,34) then
			click(x,y)
		--领取完毕
		elseif DmFindPic('dongjie.bmp',85,630,570,644,584) then
			closewin()
			isok=1
		--领取双倍
		elseif DmFindPic('lingshuang.bmp',85,890,571,902,582) then
			click(x,y)
		else
			mSleep(500)
			connect()
		end
	end
end

--助战详细
function zhuzhan()
	jdwlLog('配置助战队员')
	local adpick=0
	local appick=0
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 180 then
			jdwlLog('配置助战队员超时')
			kill()
			adpick=0
			appick=0
			tt=os.time()
		--点击再接再厉图片中的助战
		elseif DmFindPic('zhuzhan.bmp',85,623,406,634,418) then	
			click(x,y)
		--助战弄完了
		elseif DmFindPic('wugong.bmp',85,169,589,182,603) and DmFindPic('disanlan.bmp',85,835,188,849,202) ==false and DmFindPic('disanlan.bmp',85,935,186,955,205) ==false then
			jdwlLog('助战配置完成')
			return true
		--选择物理攻击助手
		elseif DmFindPic('disanlan.bmp',85,835,188,849,202) and DmFindPic('wugong.bmp',85,169,589,182,603) then
			click(x,y)	mSleep(1000)
		--选择法系攻击助手
		elseif DmFindPic('disanlan.bmp',85,835,188,849,202) ==false and DmFindPic('disanlan.bmp',85,935,186,955,205) and DmFindPic('fagong.bmp',85,255,592,268,605) then
			click(x,y) mSleep(1000)
		--选择免费的物理攻击助手
		elseif DmFindPic('disanlan.bmp',85,835,188,849,202) and DmFindPic('benzhoumianfei.bmp',85,432,262,450,274) then
			click(x,y) mSleep(1000)
		--选择免费的法攻助手
		elseif DmFindPic('disanlan.bmp',85,935,186,955,205) and DmFindPic('benzhoumianfei1.bmp',85,435,174,445,186) then
			click(x,y) mSleep(1000)
		--上阵
		elseif DmFindPic('shangzhen.bmp',85,750,490,765,503) then
			click(x,y) mSleep(1000)
		--如果是下阵则已经拥有
		elseif DmFindPic('xiazhen.bmp',85,750,494,767,506) then
			click(x,y) mSleep(1000)
		else
			mSleep(500)
			connect()
		end
	end
end

--使用活力/学习中药医理
function huoli()
	jdwlLog('学习中药医理')
	local isok = 0
	local count = 0
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 180 then
			jdwlLog('学习中药医理超时')
			isok=0
			count=0
			tt=os.time()
			kill()
		elseif isok == 1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog('学习中药医理完成')
			break		
		--点击头像
		elseif DmFindPic('touxiang.bmp',85,1093,39,1104,48) then
			click(x,y)
		--点击到属性栏
		elseif DmFindPic('shuxing.bmp',85,1012,173,1031,187) then
			click(x,y)
		--关闭活力兑换
		elseif isok == 1 and DmFindPic('x_huoli.bmp',85,762,55,774,68) then
			click(x,y)
		--关闭人物属性
		elseif isok == 1 and DmFindPic('x_renwujineng.bmp',85,973,42,986,54) then
			click(x,y)
		--使用活力
		elseif DmFindPic('shiyonghuoli.bmp',85,906,234,919,246) and isok == 0 then
			click(x,y)
		elseif count > 4 and DmFindPic('zhizuo.bmp',85,683,300,697,310) then
			closewin()
			isok=1	
		--帮派技能制作
		elseif DmFindPic('zhizuo.bmp',85,683,300,697,310) and isok == 0 then
			click(x,y)
			count = count + 1
		--点击中药医理
		elseif DmFindPic('zhongyi.bmp',85,338,213,350,224) then
			click(x,y)
		--相差不能超过10级
		elseif DmFindPic('dengji10.bmp',85,605,293,622,309) then
			notifyMsg('相差不能超过10级')
			closewin()
			isok = 1
		--帮贡不够
		elseif DmFindPic('banggong.bmp',85,574,292,589,307) then
			notifyMsg('帮贡不够')
			closewin()
			isok=1
		--选中中医
		elseif DmFindPic('zhongyixuanzhong.bmp',85,333,207,350,221) and (DmFindPic('xuexijineng.bmp',85,458,553,469,569) or DmFindPic('xuexijineng1.bmp',85,462,552,475,567) )then
			click(x,y)mSleep(1000)
			tt=os.time()
		--银币不够
		elseif DmFindPic('x_xiaofei.bmp',85,766,219,780,233) then
			click(x,y)
			isok = 1			
		else
			mSleep(500)
			connect()
		end
	end
end

--制药
function zhiyao()
	jdwlLog('制药')
	local isok = 0
	local count=0
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 180 then
			jdwlLog('制药超时')
			isok = 0
			count = 0
			kill()
			tt=os.time()
			break
		elseif isok == 1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog('制药完成')
			break		
		--点击中药医理
		elseif DmFindPic('zhongyi.bmp',85,338,213,350,224) then
			click(x,y)			
		--点击头像
		elseif DmFindPic('touxiang.bmp',85,1093,39,1104,48) then
			click(x,y)
		--关闭活力兑换
		elseif isok == 1 and DmFindPic('x_huoli.bmp',85,762,55,774,68) then
			click(x,y)
		--关闭人物属性
		elseif isok == 1 and DmFindPic('x_renwujineng.bmp',85,973,42,986,54) then
			click(x,y)
		--使用活力
		elseif DmFindPic('shiyonghuoli.bmp',85,906,234,919,246) and isok == 0 then
			click(x,y)
		elseif count > 4 and DmFindPic('zhizuo.bmp',85,683,300,697,310) then
			closewin()
			isok=1
		--帮派技能制作
		elseif DmFindPic('zhizuo.bmp',85,683,300,697,310) and isok == 0 then
			click(x,y)
			count = count + 1
		--打开炼药界面
		elseif DmFindPic('dakailianyao.bmp',85,745,551,757,563) and isok==0 then
			click(x,y)
		--活力不够无法炼药
		elseif DmFindPic('wufa.bmp',85,594,292,606,305) or DmFindPic("wufa2.bmp",80,499,292,513,310) then
			notifyMsg('活力不够无法炼药')
			isok = 1
		--金币不够无法炼药
		elseif DmFindPic('wufa1.bmp',85,584,293,597,306) then
			notifyMsg('金币不够')
			isok = 1
		--消耗银币炼药
		elseif DmFindPic('xiaohaoyinbi.bmp',85,537,439,555,450) then
			click(x,y)			
		--点击炼药
		elseif DmFindPic('lianyao.bmp',85,775,504,787,520) and isok == 0 then
			click(x,y)
			mSleep(1000)
			tt=os.time()
		--关闭所有窗口
		elseif isok == 1 and DmFindPic('x_lianyao.bmp',85,860,59,872,68) then
			click(x,y)
		elseif isok == 1 and DmFindPic('x_huoli.bmp',85,762,55,774,68) then
			click(x,y)
		elseif isok==1 and DmFindPic('x_renwujineng.bmp',85,973,42,986,54) then
			click(x,y)
		--银币不够
		elseif DmFindPic('x_xiaofei.bmp',85,766,219,780,233) then
			click(x,y)
			isok = 1
		else
			mSleep(500)
			connect()
		end	
	end
end

function fuli()
	math.randomseed(tostring(os.time()):reverse():sub(1,6))
	local a=math.random(1,3)
	if a==1 then
		qiri()
		qita()
		qiandao()
	elseif a==2 then
		qita()
		qiandao()
		qiri()
	elseif a==3 then
		qiandao()
		qiri()
		qita()
	end
	youjian()
end

--领取七日福利相关
function qiri()
	jdwlLog('七日福利')
	local count = 0
	local isok=0	
	local tt = os.time()
	while true do
		if os.difftime(os.time(),tt)>120 then
			kill()
			jdwlLog('七日福利超时')
			count=0
			isok=0
			tt=os.time()
		elseif isok == 1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog('领取七日福利完成')
			break	
		--点击福利
		elseif DmFindPic('fuli.bmp',85,24,118,39,129) then
			click(x,y)
		--使用
		elseif DmFindPic('shiyong.bmp',85,982,508,995,521) then
			click(x,y)mSleep(1500)			
		--七日奖励没有了
		elseif (DmFindPic('qiri.bmp',85,223,345,241,366)==false and DmFindPic('qirihei.bmp',85,223,345,241,366)==false) and DmFindPic('fu.bmp',85,538,58,561,82) then
			click(x+430,y+16)		
			isok=1
			closewin()
		--七日登录礼
		elseif DmFindPic('fu.bmp',85,538,58,561,82) and DmFindPic('qiri.bmp',85,223,345,241,366) then
			click(x,y)
		--七日选中
		elseif DmFindPic('qirihei.bmp',85,223,345,241,366) and DmFindPic('lingqiri.bmp',80,836,130,877,597) then
			click(x,y)
		--没得了
		elseif count > 2 and DmFindPic('fu.bmp',85,538,58,561,82) then--969,74
			click(x+430,y+16)
			isok=1
			closewin()
		elseif DmFindPic('qirihei.bmp',85,223,345,241,366) and DmFindPic('lingqiri.bmp',80,836,130,877,597) == false then
			myMove_UD(556,469,554,201,20)mSleep(1000)
			count = count + 1
		--阵法出来了
		elseif DmFindPic('zhenfa.bmp',85,542,30,561,47) then--1019,49
			click(x+470,y+20)
		else
			mSleep(500)
			connect()
		end
	end
end

--领取其他奖励
function qita()
	jdwlLog('领取其他奖励')
	local count = 0
	local isok=0	
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 120 then
			kill()
			jdwlLog('领取其他奖励超时')
			count = 0
			isok=0
			tt=os.time()
		elseif isok == 1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog('领取其他福利完成')
			break	
		--点击福利
		elseif DmFindPic('fuli.bmp',85,24,118,39,129) then
			click(x,y)
		--点击其他奖励
		elseif DmFindPic('qita.bmp',80,233,498,247,515) then
			click(x,y)
		--绑定奖励
		elseif DmFindPic('bangding.bmp',85,452,135,472,154) then--874,163
			click(x+422,y+30)
		--绑定奖励已经领取过
		elseif DmFindPic('bangding.bmp',85,452,135,472,154)==false and DmFindPic('fu.bmp',85,538,58,561,82) then
			click(x+430,y+16)
			isok=1
			closewin()			
		--领取绑定
		elseif DmFindPic('lingqubangding.bmp',85,528,418,537,432) then
			click(x,y)
		else
			mSleep(500)
			connect()
		end
	end	
end

--每日签到
function qiandao()
	jdwlLog('每日签到')
	local i = 1
	local isok=0
	local a=0
	local b=0
	local tt=os.time()
	while true do
		if isok == 1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog('每日签到完成')
			break	
		--点击福利
		elseif DmFindPic('fuli.bmp',85,24,118,39,129) then
			click(x,y)
		--使用
		elseif DmFindPic('shiyong.bmp',85,982,508,995,521) then
			click(x,y)mSleep(1500)		
		elseif os.difftime(os.time(),tt) > 180 then
			jdwlLog('每日签到超时')
			kill()
			i=1
			isok=0
			a=0
			b=0
			tt=os.time()
		elseif (os.difftime(os.time(),tt)>90 or i>21) and  DmFindPic('fu.bmp',85,538,58,561,82) then--969,74
			click(x+430,y+16)
			isok=1
			closewin()
		--每日签到
		elseif DmFindPic('meiri.bmp',85,235,115,253,136) or DmFindPic('meiri1.bmp',85,841,125,853,137) then
			if i<5 then
				a=0
				b=i
			elseif i>4 and i<9 then
				a=1
				b=i-4
			elseif i>8 and i<13 then
				a=2
				b=i-8
			elseif i>12 and i<17 then
				a=3
				b=i-12
			elseif i>16 and i<21 then
				a=4
				b=i-16
			end
			click(413+a*118,220+(b-1)*118)
			i=i+1
			mSleep(500)
		else
			mSleep(300)
			connect()
		end	
	end
end

--领取邮件
function youjian()
	jdwlLog('领取邮件')
	local i=0
	local isok=0
	local count = 0
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 180 then
			kill()
			jdwlLog('领取邮件超时')
			i=0
			isok=0
			count=0
			tt=os.time()
		elseif isok == 1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog('领取邮件完成')
			break	
		--点击好友
		elseif DmFindPic('haoyou.bmp',85,38,426,50,437) or DmFindPic('haoyou1.bmp',85,36,426,49,438) then
			click(x,y)
		elseif (i > 4 or count > 4) and DmFindPic('youjianhei.bmp',85,439,102,450,116) then
			closewin()
			isok=1
		--使用
		elseif DmFindPic('shiyong.bmp',85,982,508,995,521) then
			click(x,y)mSleep(1500)			
		--打开邮件
		elseif DmFindPic('youjian.bmp',85,438,102,452,112) then
			click(x,y)
		--领取邮件
		elseif DmFindPic('lingquyoujian.bmp',85,749,541,763,556) then
			click(x,y)
			count = count + 1
		--选中邮件之后开始领取
		elseif DmFindPic('youjianhei.bmp',85,439,102,450,116) then
			click(404,196+(i-1)*60)
			i=i+1
--[[		--已领取
		elseif DmFindPic('yilingquyoujian.bmp',85,742,541,755,556) then
			notifyMsg('a')--]]
		else					
			mSleep(500)
			connect()
		end
	end
end

--出售杂物
function zawu()
	jdwlLog('出售杂物')
	local count=0
	local isok=0
	while true do
		if isok==1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog('出售杂物完成')
			break		
		elseif isok==1 and DmFindPic('chushou.bmp',85,808,573,821,586) then
			click(985,48)
		--打开商场
		elseif DmFindPic('shangcheng.bmp',80,46,201,59,211) then
			click(x,y)
		--点击商会
		elseif DmFindPic('shanghui.bmp',85,1014,173,1030,189) then
			click(x,y)
		--我要出售
		elseif DmFindPic('woyaochushou.bmp',80,401,90,417,106) then
			click(x,y)
			count = count + 1		
		elseif (count > 10 or DmFindPic('meiyoushangping.bmp',85,537,328,554,347) )and DmFindPic('chushou.bmp',85,808,573,821,586) then
			isok=1
		--选中我要出售
		elseif DmFindPic('chushouhei.bmp',85,427,90,447,111) then--185,188
			click(x-242,y+98)mSleep(500)
			--点击出售
			if DmFindPic('chushou.bmp',85,808,573,821,586) then
				click(x,y)
				count=count+1
			end
		else
			mSleep(500)
			connect()
		end
	end
end



--摆摊
function chushou()
	jdwlLog('出售东西')
	local count = 0
	local equal=0
	local can=0
	local shiji=0
	local jia = 0
	local jian = 0
	local isok = 0
	local cz=0
	local tt=os.time()
	local cs=0
	while true do
		if os.difftime(os.time(),tt) > 180 then
			jdwlLog('出售东西超时')
			kill()
			count=0
			equal=0
			can=0
			shiji=0
			jia=0
			jian=0
			isok=0
			tt=os.time()
		elseif isok==1 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog('物品出售完成')
			break
		--打开商场
		elseif DmFindPic('shangcheng.bmp',80,46,201,59,211) then
			click(x,y)
		elseif count > 8 then
			isok=1
			closewin()
			count=0
		elseif cs>8 then
			if DmFindPic('x_baitan.bmp',85,512,73,523,87) then
				click(x,y)
			end
			cs=0
			isok = 1
			closewin()
		--选择摆摊
		elseif DmFindPic('baitan.bmp',80,1013,267,1029,283) then
			click(x,y) mSleep(500)
			count = count + 1
		--我要出售
		elseif DmFindPic('woyaochushou.bmp',80,401,90,417,106) then
			click(x,y)
			count = count + 1
		--点击要出售的物品
		elseif DmFindPic('yaoping.bmp',80,665,150,676,161) or DmFindPic('wuping.bmp',80,663,148,678,164) or DmFindPic('wuping1.bmp',85,669,149,680,156) or DmFindPic("wuping2.bmp",85,663,148,674,158) then--701,190
			click(x+35,y+40)mSleep(2000)
		--当前商品没有其他玩家出售
		elseif DmFindPic('meiyou.bmp',85,667,263,686,284) and DmFindPic('shangjiachushou.bmp',80,410,546,422,560) then
			click(x,y)
		--调整出售价格和其他玩家出售价格一致
		elseif equal == 1 and DmFindPic('shangjiachushou.bmp',80,410,546,422,560) then
			click(x,y)
			equal = 0
			can = 0
			shiji = 0
			jia = 0
			jian = 0
			tt=os.time()
			cs=cs+1
		elseif cz > 5 and DmFindPic('shangjiachushou.bmp',80,410,546,422,560) then
			equal =1
			cz = 0
		--降价
		elseif jian == 1 and DmFindPic('jianjia.bmp',85,294,422,307,435) then
			click(x,y)
			jian = 0
			cz=cz+1
			tt=os.time()
		--加价
		elseif jia==1 and DmFindPic('jiajia.bmp',85,491,422,503,435) then
			click(x,y)
			jia = 0
			cz=cz+1
			tt=os.time()
		--上架出售
		elseif DmFindPic('shangjiachushou.bmp',80,410,546,422,560) then
			can=cankao()
			shiji = juti()
			if string.len(tostring(can))==string.len(tostring(shiji)) then
				if can > shiji then
					jia=1
				elseif can < shiji then
					jian = 1
				elseif can == shiji then
					equal = 1
				end
			elseif string.len(tostring(can)) > string.len(tostring(shiji)) then
					local a,b
					a = string.sub(tostring(can),1,string.len(tostring(shiji)))
					if a==shiji then
						equal = 1
					elseif a <shiji then
						jia = 1
					elseif a > shiji then
						jian=1
					end
			elseif string.len(tostring(can)) < string.len(tostring(shiji)) then
					local a,b
					a=string.sub(tostring(shiji),1,string.len(tostring(can)))
					
					if a > can then
						jian=1
					elseif a==can then
						equal = 1
					elseif a < can then
						jia = 1
					end
			end
		--上架成功
		elseif DmFindPic('shangjiachenggong.bmp',85,547,422,561,439) then
			click(x,y)
			tt=os.time()
		--没有物品出售
		elseif DmFindPic('meiyouwuping.bmp',85,725,242,743,262) then
			closewin()
			isok = 1
		--出售法宝碎片
		elseif DmFindPic('shangjiafabao.bmp',85,426,530,439,542) then
			click(x,y)
			cs=cs+1
		else
			mSleep(500)
			connect()
		end
	end
end

--识别具体的价格
function juti()
	jdwlLog('识别具体的价格')
	local start=os.time()	
	local i = 1 
	local ret={}
	for i=1,6 do
		local x1 = 357+(i-1)*16
		local x2 = 373+(i-1)*16
		if DmFindPic('num0.bmp',80,x1,416,x2,442) then
			ret[i]=0
		elseif DmFindPic('num1.bmp',80,x1,416,x2,442) then
			ret[i]=1
		elseif DmFindPic('num2.bmp',80,x1,416,x2,442) then
			ret[i]=2
		elseif DmFindPic('num3.bmp',80,x1,416,x2,442) then
			ret[i]=3
		elseif DmFindPic('num4.bmp',80,x1,416,x2,442) then
			ret[i]=4
		elseif DmFindPic('num5.bmp',80,x1,416,x2,442) then
			ret[i]=5
		elseif DmFindPic('num6.bmp',80,x1,416,x2,442) then
			ret[i]=6
		elseif DmFindPic('num7.bmp',80,x1,416,x2,442) then
			ret[i]=7
		elseif DmFindPic('num8.bmp',80,x1,416,x2,442) then
			ret[i]=8
		elseif DmFindPic('num9.bmp',80,x1,416,x2,442) then
			ret[i]=9
		else
			mSleep(100)
		end
	end
	local j = 1	
	local jiage=''
		for j=1,#ret do
			if type(ret[j])=="number" then
				jiage =jiage..ret[j]
			end
		end
	jdwlLog('具体的价格识别时间为'..os.difftime(os.time(),start)..'秒具体价格为'..jiage)	
	return jiage
end

--识别参考价格
function cankao()
	jdwlLog('识别参考的价格')
	local start=os.time()
	local i = 1 
	local ret={}
	for i=1,6 do
		local x1 = 713+(i-1)*15
		local x2 = 728+(i-1)*15
		if DmFindPic('num0.bmp',80,x1,186,x2,212) then
			ret[i]=0
		elseif DmFindPic('num1.bmp',80,x1,186,x2,212) then
			ret[i]=1
		elseif DmFindPic('num2.bmp',80,x1,186,x2,212) then
			ret[i]=2
		elseif DmFindPic('num3.bmp',80,x1,186,x2,212) then
			ret[i]=3
		elseif DmFindPic('num4.bmp',80,x1,186,x2,212) then
			ret[i]=4
		elseif DmFindPic('num5.bmp',80,x1,186,x2,212) then
			ret[i]=5
		elseif DmFindPic('num6.bmp',80,x1,186,x2,212) then
			ret[i]=6
		elseif DmFindPic('num7.bmp',80,x1,186,x2,212) then
			ret[i]=7
		elseif DmFindPic('num8.bmp',80,x1,186,x2,212) then
			ret[i]=8
		elseif DmFindPic('num9.bmp',80,x1,186,x2,212) then
			ret[i]=9
		else
			mSleep(100)
		end
	end
	local j = 1
	local jiage=''
	for j=1,#ret do
		if type(ret[j])=="number" then
			jiage =jiage..ret[j]
		end
	end
	jdwlLog('参考的价格识别时间为'..os.difftime(os.time(),start)..'秒参考价格为'..jiage)
	return jiage
end

--建造家园
function jiayuan()
	jdwlLog("建造家园")
	local rw=0
	local count=0
	while true do
		--购买摆摊物品
		if DmFindPic('pengren.bmp',85,351,158,363,168) then
			click(x,y) 
		elseif DmFindPic('pengren1.bmp',85,352,157,364,171) and DmFindPic('goumaipengren.bmp',85,847,566,860,582) then
			click(x,y) 
		elseif count>5 and DmFindPic('baoguo.bmp',85,1086,522,1099,533) then
			jdwlLog("建造家园完成")
			break
		elseif DmFindPic('jineng.bmp',85,918,586,929,597) and (DmFindPic("jiayuan.bmp",85,837,586,849,595)==false or DmFindPic("jiayuan1.bmp",85,838,596,849,605)==false) then
			jdwlLog("未达到条件")
			break
		--点击家园
		elseif rw==0 and DmFindPic("jiayuan.bmp",85,837,586,849,595) or DmFindPic("jiayuan1.bmp",85,838,596,849,605) then
			click(x,y)			
		--房屋建造任务
		elseif isMoveing()==false and DmFindPicFuzzy("wu.bmp",85,920,161,980,453,0xffffff) then
			click(x,y)
			rw=1
		--建设
		elseif DmFindPic("gou1.bmp",85,670,334,685,347) and DmFindPic("gou2.bmp",85,472,475,483,491) and DmFindPic("jianshe.bmp",85,797,566,811,579) then
			click(x,y)
		--最便宜的房子
		elseif DmFindPic("minzhai.bmp",85,358,205,374,221) then
			click(x,y)
		--分配
		elseif DmFindPic("fenpei.bmp",85,751,503,762,518) then
			click(x,y)
		--高级丹方
		elseif DmFindPic("dan.bmp",85,256,310,274,329) and DmFindPic("gaojixuanxiang.bmp",85,668,330,681,344) then
			click(x,y)
		--用人普通
		elseif DmFindPic("yongren.bmp",85,259,455,274,472) and DmFindPic("putong.bmp",85,467,476,481,490) then
			click(x,y)
		--我要建房
		elseif DmFindPic("jianfang.bmp",85,995,415,1010,430) then
			click(x,y)
		--点击菜单栏
		elseif rw==0 and DmFindPic('caidan.bmp',85,1077,591,1085,600) then
			click(x,y)mSleep(1000)
		--对话框遮挡住菜单栏
		elseif DmFindPic('heibeibao.bmp',85,1082,494,1093,506) then
			click(x,y)	
		--无家的浪子
		elseif DmFindPic("wujia.bmp",85,389,279,404,297) then--665,386
			click(x+276,y+107)
		--师门购买宠物
		elseif DmFindPic('goumaichongwu.bmp',85,886,568,900,580) then
			click(x,y)			
		--上交任务物品/任务物品选择
		elseif DmFindPic('wupingxuanze.bmp',85,926,517,937,525) then
			click(x,y) 
		--上交兵器
		elseif DmFindPic('shangjiaobingqi.bmp',85,943,512,954,523) then
			click(x,y)
		--上交宠物
		elseif DmFindPic('shangjiaochongwu.bmp',85,740,520,754,531) then
			click(x,y)	
		elseif DmFindPic("x_jiayuan.bmp",85,883,67,894,79) then
			click(x,y)
			count=6
		elseif DmFindPic('baoguo.bmp',85,1086,522,1099,533) and DmFindPicFuzzy("wu.bmp",85,920,161,980,453,0xffffff) ==false then
			count=count+1
			mSleep(1000)						
		else
			mSleep(300)
			connect()
		end				
	end
end

--回家制药
function huijia()
	jdwlLog("回家制药")
	while true do
		if DmFindPic("putongtingyuan.bmp",80,102,28,121,50) then
			jdwlLog("回家成功")
			break
		elseif DmFindPic('jineng.bmp',85,918,586,929,597) and (DmFindPic("jiayuan.bmp",85,837,586,849,595)==false or DmFindPic("jiayuan1.bmp",85,838,596,849,605)==false) then
			jdwlLog("回家制药未达到条件")
			break			
		elseif DmFindPic("jiayuan.bmp",85,837,586,849,595) or DmFindPic("jiayuan1.bmp",85,838,596,849,605) then
			click(x,y)			
		elseif DmFindPic('caidan.bmp',85,1077,591,1085,600) then
			click(x,y)mSleep(1000)
		--对话框遮挡住菜单栏
		elseif DmFindPic('heibeibao.bmp',85,1082,494,1093,506) then
			click(x,y)	
		elseif DmFindPic("huijia.bmp",85,510,534,521,546) then
			click(x,y)mSleep(3000)
		else
			mSleep(300)
			connect()
		end
	end
end

--退出游戏
function exit()
	jdwlLog('退出游戏')
	local isok=0
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 120 then
			kill()
			isok = 0
			tt=os.time()
			jdwlLog('退出游戏超时')
		--点击菜单栏
		elseif DmFindPic('caidan.bmp',85,1077,591,1085,600) then
			click(x,y)
		--对话框遮挡住菜单栏
		elseif DmFindPic('heibeibao.bmp',85,1082,494,1093,506) then
			click(x,y)	
		--系统
		elseif DmFindPic('xitong.bmp',85,754,589,766,599) or DmFindPic("xitong1.bmp",85,672,591,681,602) then
			click(x,y)
		--切换账号
		elseif DmFindPic('qiehuanzhanghao.bmp',85,374,515,389,525) then
			click(x,y)
		--确认登出当前账号
		elseif DmFindPic('dengchu.bmp',85,645,365,657,377) then
			click(x,y)mSleep(1000)
		--登录界面扫一扫
		elseif DmFindPic('saoyisao.bmp',85,1081,187,1093,198) then
			jdwlLog('退出游戏完成')
			xiugaiwenben()
			break
		--公告确定
		elseif DmFindPic('gonggaoqueding.bmp',85,534,579,546,591) then
			click(x,y)	
		--启动游戏
		elseif DmFindPic('dianchi.bmp',85,19,66,31,75) then
			run()					
		else
			mSleep(500)
		end
	end 
end


--修改文本
function xiugaiwenben()
	jdwlLog('xiugaiwenben')
	local file,hello,l,ourline,isover
	file = io.open("/var/touchelf/scripts/avf.txt","r")
	ourline = tonumber(file:read())
	file:close()
	hello = io.open("/var/touchelf/scripts/abc.txt","r")
	local index=0
	for l in hello:lines() do
		index=index + 1
	end
	logDebug('index:'..index)
	file = io.open("/var/touchelf/scripts/avf.txt","w")
	if ourline>= index then	
		file:write(1)
		isover=true
	else
		file:write(ourline+1)
	end
	file:close()
--[[	if isover == true then
		finish()
	end--]]
end

--关闭窗口系列
function closewin()
	--关闭福利	
	if DmFindPic('x_fulia.bmp',85,958,73,973,84) then
		click(x,y)
	--人物技能/商城/指引/宠物/背包/技能/强化		
	elseif DmFindPic('x_renwujineng.bmp',85,973,42,986,54) then
		click(x,y)
	--助战
	elseif DmFindPic('x_zhuzhan.bmp',85,1001,47,1014,59) then
		click(x,y)	
	--关闭三界奇缘
	elseif DmFindPic('x_sanjieqiyuan.bmp',85,1011,44,1023,56) then
		click(x,y)
	--拒绝师徒
	elseif DmFindPic('jujue.bmp',85,766,395,782,408) then
		click(x,y)
	--关闭活动
	elseif DmFindPic('x_huodong.bmp',85,994,35,1006,49) then
		click(x,y)
	--领双界面
	elseif DmFindPic('x_guaji.bmp',85,1001,41,1014,51) then
		click(x,y)
	--秘境降妖
	elseif DmFindPic('x_mijing.bmp',85,0,0,0,0) then
		click(x,y)
	end
end

--弹窗选择相关
function connect()
	--游戏更新点击确定
	if DmFindPic('youxigengxin.bmp',85,389,281,405,292) then--567,385
		click(x+180,y+100)
	--抽奖
	elseif DmFindPic('choujiang.bmp',85,572,316,585,330) then
		click(x,y)		
	elseif DmFindPic("zaijiezaili.bmp",85,492,141,518,153) then
		click(x,y)
	--重连失败
	elseif DmFindPic('chonglianshibai.bmp',85,463,293,481,306) then--619,370
		click(x+160,y+80)
	--登录游戏
	elseif DmFindPic('dlyx.bmp',85,500,464,516,479) then
		denglu()
	--启动游戏
	elseif DmFindPic('dianchi.bmp',85,19,66,31,75) then
		run()
	--版本更新
	elseif DmFindPic('banbengengxin.bmp',85,520,279,531,298) then--571,380
		click(x+50,y+100)
	--取消
	elseif DmFindPic('quxiao.bmp',85,422,375,450,401) then
		click(x,y)
	elseif DmFindPic('quxiao1.bmp',80,423,361,450,389) then
		click(x,y)
	--关闭签到抽奖
	elseif DmFindPic('x_choujiang.bmp',85,875,63,891,74) then
		click(x,y)
	--服务器已经关闭
	elseif DmFindPic('fuwuqiguanbi.bmp',85,498,291,516,312) then--569,370
		click(x+70,y+80)
	--10级礼包
	elseif DmFindPic('10jilibao.bmp',85,842,273,858,284) then
		click(x,y)		
	--关闭福利
	elseif DmFindPic('fu.bmp',85,538,58,561,82) then --969,73
		click(x+430,y+15)
	--钥匙半价
	elseif DmFindPic('x_banjia.bmp',85,713,121,728,138) then
		click(x,y)
	--热点
	elseif DmFindPic('x_redian.bmp',85,886,172,898,187) then
		click(x,y)
	--本地账号退出
	elseif DmFindPic('bendizhanghao.bmp',85,420,293,438,311) then--569,374
		click(x+150,y+80)
	--游戏更新，下载补丁失败
	elseif DmFindPic('buding.bmp',85,436,283,457,300) then--571,388
		click(x+135,y+105)
	--游戏更新，版本校验不正确
	elseif DmFindPic('banbenjiaoyan.bmp',85,387,278,406,297) then--570,389
		click(x+180,y+111)
	--游戏更新
	elseif DmFindPic('gengxin.bmp',85,575,241,596,262) then--574,389
		click(x,y+150)
	--连接不上服务器
	elseif DmFindPic('lianjie.bmp',85,422,293,439,312) then--473,375
		click(x+51,y+80)
	--不小心点到宝石镶嵌
	elseif DmFindPic('baoshi.bmp',85,528,27,551,48) then--984,46
		click(x+456,y+19)
	--点到组队
	elseif DmFindPic('duiwu.bmp',85,536,28,560,51) then--1021,48
		click(x+485,y+20)mSleep(1000)
		closewin()
	--当前网络不可用
	elseif DmFindPic('dangqianwangluo.bmp',85,409,293,429,312) then--477,374
		click(x+70,y+80)
	--分享
	elseif DmFindPic('x_share.bmp',85,755,187,770,199) then
		click(x,y)
	--我有经验
	elseif DmFindPic('woyoujingyan.bmp',85,478,432,493,444) then
		click(x,y)		
	--红色提示
	elseif DmFindPic("jiahao.bmp",85,650,307,672,327) then--570,414
		click(x-80,y+107)
	end
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

--读取帐号
function getAccount()
	local file,l,f
	file = io.open("var/touchelf/scripts/avf.txt","r")
	ourline = tonumber(file:read())
	file:close()
	file = io.open("var/touchelf/scripts/abc.txt","r")
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
		file = io.open("var/touchelf/scripts/avf.txt","r")
		ourline = tonumber(file:read())
		file:close()
		file = io.open("var/touchelf/scripts/avf.txt","w")
		file:write(1)
		file:close()
		finish()
		file = io.open("var/touchelf/scripts/avf.txt","r")
		ourline = tonumber(file:read())
		file:close()
		file = io.open("var/touchelf/scripts/abc.txt","r")
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

--练完了
function finish()
	local wz=1	
	local isRec = 0
	while wz==1 do
		for bbc=1,5 do
		notifyMsg("练完了")
		if isRec == 0 then
			jdwlLog('练完了')
			isRec = 1
		end
		mSleep(1000);
		end 
		mSleep(5000);
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
	mSleep(5000)
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
			count = 0
		else
			notifyMessage('断网失败,继续请求')
			routerControl(getDeviceID(),url)
			count = count + 1
		end
	end
end


function routerControl(deviceId,url)
	--local data = httpGet('http://jdwl.yhf.com:8080/makemoney/android/ad/router?action=control&sn='..getDeviceID()..'&url='..url)
	local data = httpGet('http://192.168.1.200:8080/makemoney/android/ad/router?action=control&sn='..getDeviceID()..'&url='..url)
	local i,j = string.find(data,'ok')
	if i~=nil and j~=nil then
		notifyMessage('断网请求成功')
		mSleep(5000)
	else
		notifyMessage('断网请求失败')
		mSleep(5000)
	end	
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
	while true do
		if isnew == 0 and Mulcolor(letter_n,90,146,409,151,511) and Mulcolor(new_iphone,90,823,87,829,90) then
			click(x,y)mSleep(8000)
			isnew = 1
		elseif isnew == 1 and Mulcolor(icon_exit,90,945,157,950,161) then
			click(x,y)
			break
		else
			appRun('org.ioshack.iGrimace')mSleep(1000)
		end
	end
end

--ig历史记录
function iGhistory()
	jdwlLog('ig留存')
	rotateScreen(0)
	--获取当前账号位数
	local file,index,pic
	file = io.open("var/touchelf/scripts/avf.txt","r")
	index = tonumber(file:read())
	file:close()
	local length=string.len(tostring(index))
	if length==1 then
		pic='fake0'..tostring(index)..'.bmp'
	elseif length == 2 then
		pic='fake'..tostring(index)..'.bmp'
	end
	notifyMsg(pic)mSleep(2000)
	local up = 0
	local down=0
	while true do
		--点击伪造记录
		if DmFindPic('fake.bmp',85,150,948,181,978) then
			click(x,y)
		--伪造记录打开了
		elseif DmFindPic('bianji.bmp',85,597,73,628,104) and DmFindPicFuzzy(pic,80,18,143,94,1136,0xffffff) then
			click(x,y)mSleep(10000)
			jdwlLog('ig留存完成')
			break
		elseif DmFindPic('bianji.bmp',85,597,73,628,104) and DmFindPicFuzzy(pic,80,18,143,94,1136,0xffffff)==false and down > 3 then
			up=0
			down=0
		elseif DmFindPic('bianji.bmp',85,597,73,628,104) and DmFindPicFuzzy(pic,80,18,143,94,1136,0xffffff)==false and up > 3 then
			myMove_UD(135,233,145,631,20)mSleep(1000)
			down = down+1
		elseif DmFindPic('bianji.bmp',85,597,73,628,104) and DmFindPicFuzzy(pic,80,18,143,94,1136,0xffffff)==false then
			myMove_UD(145,631,135,233,20)mSleep(1000)
			up = up + 1
		else
			appRun('org.ioshack.iGrimace')
			mSleep(1000)
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