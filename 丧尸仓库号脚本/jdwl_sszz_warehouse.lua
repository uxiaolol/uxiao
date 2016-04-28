PIC_PATH = '/var/touchelf/scripts/sszz/'
PKG_NAME='com.im30.warz'


version="04.22.16"


function main()
	mSleep(2000)
	unlock()
	rotateScreen(90)
	manbing=0
	qiancheng=0
	yiwan=0
	local content=Split(getFort(),",")
	fort=(content[1])
	model=content[2]
	ver()

	shezhi()
	if fort~= "" and fort ~=nil then
		if model == "1" then 
			zaobing()
		elseif model == "2" then
			lianmeng()
			warehouse()
			product()
		end
	else
		while true do
			jdwlMsg("要塞未填写正确,如有更改要塞需要取消开机启动重新设置")
		end
	end
end


function ver()
	local index=1
	for index=1,5 do
		notifyMessage(string.format("当前版本号:%s,模式:%s,要塞:%s",version,model,fort))
	end
end

function zaobing()
	jiesuo()
	zhangpeng()
	shourongsuo()
	lastzhangpeng()
	lianmeng()
	while true do
		if isEnough()==false and manbing==0 then
			kaican()
			sheshou()
			yongshi()
			cheliang()	
		--[[elseif manbing==1 and issrs() and iszp() and ishunhe() then
			break
		end	
		if canting==0 then cantingshengji() end
		--cangkushengji()
		if chengqiang==0 then chengqiangshengji() end
		if keyan==0 then keyanshengji() end
		if houqin==0 then houqinshengji() end
		if jidi==0 then jidishengji() end
		if issrs()==false then srsshengji() end
		if iszp()==false then zpshengji() end
		if ishunhe()==false then hunheshengji() end--]]
		elseif manbing==1 or isEnough() then
			break
		end
	end
	while true do
		jdwlMsg("5级城堡兵种达到上限")
	end
end

--触摸精灵识别
function verCode()
	--local fort=getFort()
	local x_ret= identifyX()
	local y_ret = identifyY()
	local coor = x_ret.."@"..y_ret
	jdwlMsg(coor)
end

--报警
function baojing()
	if  startProdut==1 and (DmFindPic("baojing_u.bmp",80,821,67,829,79) and find_Onequyu(0xff1805,90,814,47,826,67)) then
		jdwlLog("有情况")
		randQc()
		warehouse()
		yiwan=0
	elseif DmFindPic("posui_u.bmp",80,1050,182,1063,197) then
		jdwlLog("有情况")
		randQc()
		warehouse()		
		yiwan=0
	end
end

--随机飞
function randQc()
	jdwlLog("随机飞")
	local a=0
	local b=0
	local tt=os.time()
	local isok=0
	local count=0
	while true do
		if os.difftime(os.time(),tt) > 120 then
			jdwlLog("迁城失败")
			break
		elseif isok==1 and (DmFindPic("jie_u.bmp",85,1065,575,1080,589) or DmFindPic("jia_u.bmp",85,1063,585,1075,601)) then 
			jdwlLog("迁城ok")
			break
		elseif isok==1 and count > 5  and DmFindPic("guanbibeibao_u.bmp",85,33,609,48,624) then
			jdwlLog("迁城ok")
			break
		elseif isok==1 and DmFindPic("guanbibeibao_u.bmp",85,33,609,48,624) then
			click(x,y)
			count = count + 1
		--打开背包
		elseif DmFindPic("beibao_u.bmp",80,1036,252,1047,263) or DmFindPic("beibao1_u.bmp",80,1042,253,1056,263) then
			click(x,y)
		elseif DmFindPic("baojing_u.bmp",80,827,43,834,56) and find_Onequyu(0xff1805,85,814,47,826,67) then
			click(1044,253)
		--点击物品栏
		elseif DmFindPic("wuping_u.bmp",85,1054,207,1069,224) then
			click(x,y)
		--使用随机迁城
		elseif DmFindPic("shiyongsq_u.bmp",80,469,173,510,212) or DmFindPic("shiyongsq_u.bmp",80,631,176,669,212) or DmFindPic("shiyongsq_u.bmp",80,791,173,832,212) or DmFindPic("shiyongsq_u.bmp",80,851,173,893,211) then
			click(x,y)	
		--查找随机迁城	
		elseif DmFindPic("wu_u.bmp",80,30,331,53,349) or DmFindPic("wu1_u.bmp",80,32,305,42,320) then
			if chazhao() ==false then
				if jifen()==0 then
					if goumai() == 0 then
						break
					end
				end	
			end
		--指挥官你要使用随机迁城吗
		elseif DmFindPic("zhi_u.bmp",80,464,486,486,503) and DmFindPic("quedingqc_u.bmp",80,691,333,706,347) then
			click(x,y)
			--click(40,605)
			isok=1
			qiancheng=0
			jdwlLog("使用随迁确定")
		else
			duihua()
			connect()
		end
	end
end

--204,489,343,628  y公差为-156 
--204,333,343,472	
--204,177,342,316
--204,20,342,159

--364,489,503,628 x公差为160
function chazhao()
	jdwlLog("查找")
	local a = 0
	local b = 0
	local wz = 1
	local isok=0	
	while wz<25 do
		mSleep(50)
		if wz <= 4 then
			a = wz-1
			b = 0
		elseif wz > 4 and wz <= 8 then
			a = wz-5
			b = 1
		elseif wz > 9 and wz <= 12 then
			a = wz - 9
			b = 2
		elseif wz > 12 and wz <= 16 then
			a = wz-13
			b = 3
		elseif wz > 16 and wz <=20 then
			a= wz-17
			b= 4
		elseif wz >20 and wz <= 24 then
			a= wz-21
			b= 5
		end
--[[		if DmFindPic("suijiqiancheng_u.bmp",60,204+b*160,489-a*156,343+b*160,628-a*156) then--843,489,986,628
			click(x,y)
			jdwlLog("找到随迁")
			return true
		end	--]]
		if DmFindPic("suijiqiancheng1_u.bmp",75,204+b*160,489-a*156,343+b*160,628-a*156) then--843,489,986,628
			click(x,y)
			jdwlLog("找到随迁")
			return true
		end			
		wz=wz+1
	end	
	jdwlLog("未找到随迁")
	return false
end

function check()
	local tt=os.time()
	local isok=0
	if qiancheng==0 then
		jdwlLog("检测随迁")
		while true do
			if os.difftime(os.time(),tt) > 90 then
				jdwlLog("检测随迁超时")
				kill()
				tt=os.time()
			elseif isok==1 and (DmFindPic("jie_u.bmp",85,1065,575,1080,589) or DmFindPic("jia_u.bmp",85,1063,585,1075,601)) then 
				jdwlLog("检测随迁完成")
				break
			--打开背包
			elseif DmFindPic("beibao_u.bmp",80,1036,252,1047,263) then
				click(x,y)
			elseif isok==1 and (DmFindPic("wu_u.bmp",80,30,331,53,349) or DmFindPic("wu1_u.bmp",80,32,305,42,320) )then--38,619
				click(x+10,y+290)
			--查找随机迁城	
			elseif DmFindPic("wu_u.bmp",80,30,331,53,349) or DmFindPic("wu1_u.bmp",80,32,305,42,320) then
				if chazhao() then
					qiancheng=1
					jdwlLog("有迁城")
				else
					if jifen()==0 then
						goumai() 						
					end
					qiancheng=1
				end
				isok=1
			else
				duihua()
				connect()
			end	
		end
	end
end

--创建联盟
function lianmeng()
	jdwlLog("创建联盟")
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 180 then
			kill()
			jdwlLog("联盟捐赠超时")
			break
		elseif isok==1 and (DmFindPic("jie_u.bmp",85,1065,575,1080,589) or DmFindPic("jia_u.bmp",85,1063,585,1075,601)) then 
			jdwlLog("创建联盟完成")
			break
		elseif isok==1 and (DmFindPic("guanbilianmeng_u.bmp",80,29,609,50,621) or DmFindPic("guanbilianmeng1_u.bmp",80,30,610,46,623) )then
			click(x,y)
		--点击联盟图标
		elseif DmFindPic("lianmengtubiao_u.bmp",85,1125,46,1135,64) then
			click(x,y)sleep(3000)
		--使用钻石创建
		elseif DmFindPic("zuanshichuangjian_u.bmp",80,900,368,916,382) then
			click(x,y)
			sleep(1000)
		--如果没有联盟则自己创建
		elseif DmFindPic("chuangjian_u.bmp",80,1084,355,1099,369) then
			click(x,y)
			sleep(1000)
		--输入联盟名字
		elseif DmFindPic("chuang_u.bmp",80,657,601,671,615) then
			click(705,427)
			inputText("\b\b\b\b\b\b\b\b")sleep(1000)
			local str=randomstring(3)
			inputText("jdwl"..str)sleep(1000)
			if DmFindPic("chuang1_u.bmp",80,627,604,642,618) then click(x,y) end
		--设置不允许任何人加入
		elseif DmFindPic("guanli_u.bmp",80,1121,80,1137,99) then
			click(x,y)
		--联盟设置
		elseif DmFindPic("lianmengshezhi_u.bmp",80,429,507,445,518) or DmFindPic("lianmengshezhi1_u.bmp",80,433,505,443,516) then
			click(x,y)
		--修改联盟招募
		elseif DmFindPic("zhaomu_u.bmp",80,257,68,275,85) then
			click(x,y)
		--关闭招募
		elseif DmFindPic("guanbizhaomu_u.bmp",80,354,350,370,364) then
			click(x,y)
		--开启招募
		elseif DmFindPic("kaiqizhaomu_u.bmp",80,350,318,365,328) then
			isok=1
		elseif DmFindPic("jiaru_u.bmp",80,616,129,631,139) then
			click(176,41)
		else
			duihua()
			connect()
		end
	end
end

--联盟捐赠
function juanzheng()
	jdwlLog("联盟捐赠")
	local zb={{476,324},{641,301},{798,327},{957,302},{1102,309}}
	local tt=os.time()
	local isok=0
	while true do
		if os.difftime(os.time(),tt) > 90 then
			kill()
			jdwlLog("联盟捐赠超时")
			break
		elseif DmFindPic("ru_u.bmp",85,545,488,563,500) then
			kill()
			jdwlLog("暂时无法捐赠")
			break
		elseif isok==1 and (DmFindPic("jie_u.bmp",85,1065,575,1080,589) or DmFindPic("jia_u.bmp",85,1063,585,1075,601)) then 
			jdwlLog("捐赠ok")
			break
		elseif isok==1 and (DmFindPic("guanbilianmeng_u.bmp",80,29,609,50,621) or DmFindPic("guanbilianmeng1_u.bmp",80,30,610,46,623) )then
			click(x,y)
		elseif isok==1 and DmFindPic("heikeji_u.bmp",80,32,276,53,298) then
			click(x,y)
		elseif DmFindPic("04_u.bmp",80,632,344,646,362) then
			click(46,606)
			isok=1
		--点击联盟图标
		elseif DmFindPic("lianmengtubiao_u.bmp",85,1125,46,1135,64) then
			click(x,y)sleep(1000)
		--点击联盟科技
		elseif DmFindPic("lianmengkeji_u.bmp",85,611,584,622,596) then
			click(x,y)sleep(1000)
		--捐赠界面
		elseif DmFindPic("ji_u.bmp",80,28,277,51,294) then
			local index=math.random(1,5)
			click(zb[index][1],zb[index][2])
			sleep(1000)
		--联盟荣誉最多
		elseif  DmFindPic("zuanshijzzd_u.bmp",80,842,280,855,293)==false and DmFindPic("zuiduo_u.bmp",80,834,119,847,134) then
			click(x+10,y+20)sleep(500)
			if DmFindPic("ru_u.bmp",80,534,481,578,506) then
				isok=1
			end
		--联盟荣誉中等
		elseif  DmFindPic("zuanshidier_u.bmp",80,843,559,852,571)==false and DmFindPic("juanzhengdier_u.bmp",80,833,368,847,382) then
			click(x+10,y+20)sleep(500)
			if DmFindPic("ru_u.bmp",80,534,481,578,506) then
				isok=1
			end		
		--联盟荣誉最少
		elseif  DmFindPic("zuanshijz_u.bmp",80,679,412,714,444)==false and DmFindPic("zuishao_u.bmp",80,665,192,707,234) then
			click(x+10,y+20)sleep(500)
			if DmFindPic("ru_u.bmp",80,534,481,578,506) then
				isok=1
			end				
		--钻石清楚
		elseif DmFindPic("zuanshiqingchu_u.bmp",80,678,336,693,348) then
			click(46,606)
			isok=1
		--使用钻石创建
		elseif DmFindPic("zuanshichuangjian_u.bmp",80,900,368,916,382) then
			click(x,y)
			sleep(1000)
		--如果没有联盟则自己创建
		elseif DmFindPic("chuangjian_u.bmp",80,1084,355,1099,369) then
			click(x,y)
			sleep(1000)
		--输入联盟名字
		elseif DmFindPic("chuang_u.bmp",80,657,601,671,615) then
			click(705,427)
			inputText("\b\b\b\b\b\b\b\b")sleep(1000)
			local str=randomstring(3)
			inputText("jdwl"..str)sleep(1000)
			if DmFindPic("chuang1_u.bmp",80,627,604,642,618) then click(x,y) end
		elseif DmFindPic("qingchu_u.bmp",80,677,334,692,348) or DmFindPic("diamond_u.bmp",85,694,287,707,302) then--811,405
			kill()
			jdwlLog("联盟捐赠完成")
			break
		--创建成功
		elseif DmFindPic("gong_u.bmp",80,464,485,479,504) and DmFindPic("gongqueding_u.bmp",80,688,334,703,348)  then
			click(x,y)
			sleep(1000)
		elseif DmFindPic("guanbiziyuan_u.bmp",85,28,610,53,624) then	
			click(x,y)
		elseif DmFindPic("huodezuanshi_u.bmp",80,36,277,53,296) then--32,35
			click(x,y-240)
		elseif DmFindPic("ziyuan_u.bmp",80,34,338,52,349) then--40,615
			click(x,y+280)
			isok=1
		else
			duihua()
			connect()
		end
	end
end



--背包购买
function goumai()
	jdwlLog("商店")
	local tt=os.time()
	local isok=0
	local count=0
	local ret=0
	while true do
		if os.difftime(os.time(),tt) > 120 then
			kill("商店")
			tt=os.time()
		elseif isok==1 and count > 5 and DmFindPic("guanbibeibao_u.bmp",85,33,609,48,624) then
			kill()
			jdwlLog("商店完成")
			break
		elseif isok ==1 and (DmFindPic("jie_u.bmp",85,1065,575,1080,589) or DmFindPic("jia_u.bmp",85,1063,585,1075,601)) then
			if ret==1 then
				jdwlLog("商店完成")
			else
				jdwlLog("钻石不够商店完成")
			end
			return ret
		elseif isok==1 and (DmFindPic("guanbibeibao_u.bmp",85,33,609,48,624) or DmFindPic("guanbibeibao1_u.bmp",85,31,609,51,621) )then
			click(x,y)sleep(1000)
			count=count+1
		--打开背包
		elseif DmFindPic("beibao_u.bmp",80,1036,252,1047,263) then
			click(x,y)		
		--点击商城
		elseif DmFindPic("shangcheng_u.bmp",80,111,187,130,198) then
			click(x,y)
		--点击战争
		elseif DmFindPic("zhanzheng_u.bmp",80,420,463,436,479) then
			click(x,y)
		--购买随迁
		elseif DmFindPic("lanzhanzheng_u.bmp",80,423,467,443,480) then
			click(569,414)
		--500
		elseif DmFindPic("500_u.bmp",80,786,316,800,330) then
			click(x,y)
			isok=1
			ret=1
		elseif DmFindPic("hong500_u.bmp",80,788,294,802,316) then
			click(x-650,y+257)
			isok=1
			ret=0
		--钻石不够
		elseif DmFindPic("huoquzuanshi_u.bmp",80,691,358,708,370) then--41,615
			click(x-650,y+257)
		else
			duihua()
			connect()
		end
	end
end

--积分相关
function jifen()
	jdwlLog("积分相关")
	local tt=os.time()
	local isok=0
	local count=0
	local ret=0
	while true do
		if os.difftime(os.time(),tt) > 120 then
			kill()
			jdwlLog("积分超时")
			tt=os.time()
		elseif isok==1 and (DmFindPic("jie_u.bmp",85,1065,575,1080,589) or DmFindPic("jia_u.bmp",85,1063,585,1075,601)) then 
			jdwlLog("积分")
			return ret
		elseif DmFindPic("wu_u.bmp",80,30,331,53,349)	then--40,616
			click(x+10,y+270)
		elseif isok==1 and (DmFindPic("guanbilianmeng_u.bmp",80,29,609,50,621) or DmFindPic("guanbilianmeng1_u.bmp",80,30,610,46,623) )then
			click(x,y)		
		--购买确定
		elseif DmFindPic("jifenqueding_u.bmp",80,680,334,697,346) then
			click(x,y)
			ret = 1
			isok=1				
		--点击联盟图标
		elseif DmFindPic("lianmengtubiao_u.bmp",85,1125,46,1135,64) then
			click(x,y)sleep(1000)
		--商城有则直接购买
		elseif DmFindPic("sqian1_u.bmp",80,345,539,360,553) then
			click(x,y)			
		--点击联盟商店
		elseif DmFindPic("lianmengshangdian_u.bmp",80,721,567,733,578) then
			click(x,y)sleep(2000)
		elseif count>0 and DmFindPic("wuwuping_u.bmp",80,391,460,411,477) and DmFindPic("liebiao_u.bmp",80,113,166,129,183) then
			isok=1
			ret = 0
		elseif count > 5 and DmFindPic("shang_u.bmp",80,113,466,131,485) then
			click(x,y)sleep(1000)
		--如果没有物品则导入
		elseif count==0 and DmFindPic("wuwuping_u.bmp",80,391,460,411,477) and DmFindPic("liebiao_u.bmp",80,113,166,129,183) then
			click(x,y)
		elseif DmFindPic("jifensuiqian_u.bmp",80,347,546,358,558) then
			click(x,y)

		--放入随迁
		elseif DmFindPic("sqian_u.bmp",80,622,340,638,352) then
			click(x,y)
			count=count+1
		elseif DmFindPic("daoruqueding_u.bmp",80,697,382,708,395) then
			click(x,y)
		else
			duihua()
			connect()
		end
	end
end

function shengchan()
	kill()
	goBackWorld()
	jdwlLog("上传生产号坐标")
	local isok=0
	while true do
		if isok==1 and DmFindPic("jia_u.bmp",85,1083,588,1094,601) then
			jdwlLog("上传生产号坐标完成")
			break
		elseif DmFindPic("shijie_u.bmp",85,1064,578,1077,589) then
			goBackWorld()
		--地图还在加载中
		elseif DmFindPic("chunse_u.bmp",85,951,601,961,611) == false and DmFindPic("jia_u.bmp",85,1083,588,1094,601) then
			jdwlMsg("当前场景正在加载")
		--点击坐标栏	
		elseif DmFindPic("attack_u.bmp",75,475,164,508,193)==false and DmFindPic("jia_u.bmp",85,1083,588,1094,601) and DmFindPicFuzzy("x_u.bmp",85,1026,401,1057,428,0xffffff)then
			click(x,y)
		elseif isok==1 and DmFindPic("qianwang_u.bmp",85,551,334,569,347) then
			click(x+200,y)
		elseif DmFindPic("qianwang_u.bmp",85,551,334,569,347) then
			--local fort=getFort()
			local x_ret= identifyX()
			local y_ret = identifyY()
			local coor = x_ret.."@"..y_ret
			jdwlMsg(coor)
			local ret = uploadProduct(coor,fort)
			jdwlMsg(ret)		
			if ret == "ok" then
				jdwlLog("product_commit_ok")
				isok=1
			end
		else
			duihua()
			connect()
		end
	end
end

function zhuxiao()
	kill()	
	goBackWorld()
	jdwlLog("注销生产号坐标")
	local isok=0
	while true do
		if isok==1 and DmFindPic("jia_u.bmp",85,1083,588,1094,601) then
			jdwlLog("注销生产号坐标完成")
			break
		elseif DmFindPic("shijie_u.bmp",85,1064,578,1077,589) then
			goBackWorld()
		--地图还在加载中
		elseif DmFindPic("chunse_u.bmp",85,951,601,961,611) == false and DmFindPic("jia_u.bmp",85,1083,588,1094,601) then
			jdwlMsg("当前场景正在加载")
		--点击坐标栏	
		elseif DmFindPic("attack_u.bmp",75,475,164,508,193)==false and DmFindPic("jia_u.bmp",85,1083,588,1094,601) and DmFindPicFuzzy("x_u.bmp",85,1026,401,1057,428,0xffffff)then
			click(x,y)
		elseif isok==1 and DmFindPic("qianwang_u.bmp",85,551,334,569,347) then
			click(x+200,y)
		elseif DmFindPic("qianwang_u.bmp",85,551,334,569,347) then
			--local fort=getFort()
			local x_ret= identifyX()
			local y_ret = identifyY()
			local coor = x_ret.."@"..y_ret
			jdwlMsg(coor)
			local ret = modifyProduct(coor,fort)
			jdwlMsg(ret)		
			if ret == "ok" then
				jdwlLog("product_commit_ok")
				isok=1
			end
		else
			duihua()
			connect()
		end
	end
end


startProdut=0
--攻打生产小号部分
function product()
	--goBackWorld()
	jdwlLog("product")
	local isInput=0
	local isok=0
	local count=0
	startProdut=1
	logDebug(startProdut)
	local jia = 0
	local juan=0
	local tt=os.time()
	local ret=0
	local ware=0
	local zaobingtime=os.time()
	local juanzhengtime=os.time()
	while true do
		sleep(1000)
		baojing()
		check()
		if os.difftime(os.time(),tt) > 300 then
			kill()
			snapshotScreen(string.format("product超时".."%s.bmp",os.time() ))
			jdwlLog("product overtime")
			tt=os.time()
		elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			click(x,y)
			jia=0
			tt=os.time()
		--攻击僵尸时等待
		elseif DmFindPic("czdengdai_u.bmp",85,220,422,237,435) or DmFindPic("czdengdai1_u.bmp",80,162,427,173,436) then
			if os.difftime(os.time(),juanzhengtime) > 600 then
				if juan==0 then
					juanzheng()
					juan=1
				end
				juanzhengtime=os.time()
			end
			if os.difftime(os.time(),zaobingtime) > 600*2 then
				if yiwan==0 then
					if isEnough() == false then
						kaican()
						sheshou()
						yongshi()
						cheliang()
						zaobingtime=os.time()
					end
				end		
				
			end
				tt=os.time()
		elseif DmFindPic("quedingfanhui_u.bmp",80,466,485,485,503) and DmFindPic("fanhuiqueding_u.bmp",80,689,333,706,349) then
			click(x,y)
			tt=os.time()
		--攻击
		elseif DmFindPic("attack_u.bmp",75,470,149,530,218) then
			click(x,y)sleep(1000)	
			tt=os.time()
		--误点部队扎营让部队返回
		elseif DmFindPic("zhaying_u.bmp",80,150,567,163,580) and DmFindPic("zhayingfanhui_u.bmp",80,161,425,174,435) then
			click(x,y)
			tt=os.time()
		elseif count > 5 and DmFindPic("chunse_u.bmp",85,950,589,964,602) == false and DmFindPic("jia_u.bmp",85,1083,588,1094,601) then
			qiehuan()
			count=0
			tt=os.time()
		--地图还在加载中
		elseif DmFindPic("chunse_u.bmp",85,950,589,964,602) == false and DmFindPic("jia_u.bmp",85,1063,585,1075,601) then
			jdwlMsg("当前场景正在加载")sleep(2000)
			if DmFindPic("chunse_u.bmp",85,950,589,964,602) == false and DmFindPic("jia_u.bmp",85,1063,585,1075,601) then
				count = count + 1
				if count > 5 then
					if jia > 3 and DmFindPic("jia_u.bmp",85,1063,585,1075,601) then
						kill()
						jdwlLog("切换卡死")
						jia=0
						count=0
					elseif DmFindPic("jia_u.bmp",85,1063,585,1075,601) then
						click(x,y)sleep(1000)
						jia = jia + 1
					end
				end
			end	
			sleep(1000)
			tt=os.time()
		--点击坐标栏	
		elseif DmFindPic("attack_u.bmp",75,475,164,508,193)==false and DmFindPic("jia_u.bmp",85,1063,585,1075,601) and (DmFindPicFuzzy("x_u.bmp",85,987,407,1007,424,0xffffff) or DmFindPicFuzzy("y_u.bmp",85,985,309,1007,323,0xffffff) )then--997,452
			ret = getProduct(fort)
			ware=getSelf(fort)
			if string.len(ret)>=3 and ret ~= "null"  and  string.len(ware)>=3 and ware~="null"  then
				if DmFindPic("attack_u.bmp",75,475,164,508,193)==false and DmFindPic("jia_u.bmp",85,1063,585,1075,601) and (DmFindPicFuzzy("x_u.bmp",85,987,407,1007,424,0xffffff) or DmFindPicFuzzy("y_u.bmp",85,985,309,1007,323,0xffffff) )then--997,452
					click(x,y)
					count=0
					tt=os.time()
				end	
			else
				if os.difftime(os.time(),zaobingtime) > 600*2 then
					if yiwan==0 then
						if isEnough() == false then
							kaican()
							sheshou()
							yongshi()
							cheliang()
							zaobingtime=os.time()
						end
					end				
					
				end
				if os.difftime(os.time(),juanzhengtime) > 600 then
					juanzheng()
					juan=0
					juanzhengtime=os.time()
					
				end
--[[				if canting==0 then cantingshengji() end
				if chengqiang==0 then chengqiangshengji() end
				if keyan==0 then keyanshengji() end
				if houqin==0 then houqinshengji() end
				if jidi==0 then jidishengji() end
				if issrs()==false then srsshengji() end
				if iszp()==false then zpshengji() end
				if ishunhe()==false then hunheshengji() end
				if xuanguadengji==0 then yanjiu() end		--]]	
			end	
		elseif isInput==1 and DmFindPic("qianwang_u.bmp",85,551,334,566,349) then	
			click(x,y)
			isInput = 0
			local tt = os.time()
			while os.difftime(os.time(),tt) < 3 do
				if DmFindPic("jiasucz_u.bmp",85,166,404,178,415)==false and (DmFindPic("product_u.bmp",85,476,316,501,341) or DmFindPic("product1_u.bmp",80,544,291,575,317) or DmFindPic("product2_u.bmp",80,522,307,547,347)) then
					click(x,y)
					break
				elseif DmFindPic("cb_u.bmp",85,552,285,576,319) then 
					click(x,y)
					break
				elseif DmFindPic("e_u",85,583,344,598,354) then
					click(x,y)
					break
				end	
			end
			tt=os.time()
		--确认坐标栏打开
		elseif DmFindPic("qianwang_u.bmp",85,551,334,566,349) then
			--local fort = getFort()
			--local ret = getProduct(fort)
			--local ware=getSelf(fort)
			if string.len(ret)>=3 and ret ~= "null"  and  string.len(ware)>=3 and ware~="null"  then
					ret = Split(ret,"@")
					ware = Split(ware,"@")
					if math.abs(ret[1]-ware[1])<=16 and math.abs(ret[2]-ware[2])<=16 then
						if DmFindPic("qianwang_u.bmp",85,551,334,566,349) then--472,439
							click(x-78,y+109)
							inputText(ret[1])
						end
						if DmFindPic("qianwang_u.bmp",85,551,334,566,349) then--475,166
							click(x-75,y-164)
							inputText(ret[2])
						end
						isInput=1
						isok=0
					else
						jdwlMsg("坐标超出范围，不打")
						if DmFindPic("qianwang_u.bmp",85,551,334,566,349) then
							click(x,y+100)
						end
					end
			else 
			end
			tt=os.time()
		--出征
		elseif DmFindPic("chuzheng_u.bmp",85,1079,188,1092,199) then
			click(x,y)sleep(1000)	
			juan=0
			tt=os.time()
		--对方攻击力过高
		elseif DmFindPic("querengongji_u.bmp",80,691,470,708,484) then
			click(x,y) 
			tt=os.time()
		--没有可以选择的部队
		elseif DmFindPic("meiyou_u.bmp",85,465,484,487,501) and DmFindPic("meiyouqueding_u.bmp",85,688,335,705,349) then
			click(x,y)
			local tt=os.time()
			while os.difftime(os.time(),tt) < 4 do
				if DmFindPic("chuzheng_u.bmp",85,1079,188,1092,199) then--42,618
					click(x-1037,y+430)
					break
				end
			end
			isok=1
			kaican()
			sheshou()
			yongshi()
			cheliang()
			tt=os.time()
			
		--成为vip
		elseif DmFindPic("vip_u.bmp",80,692,429,708,463) then--826,451
			click(1079,587)
			sleep(1000)
			isok=1	
			tt=os.time()	
		elseif DmFindPic("zhencha_u.bmp",80,466,485,481,504) and DmFindPic("meiyouqueding_u.bmp",85,688,335,705,349)then
			click(x,y)
			tt=os.time()
		else
			isok=0
			duihua()
			connect()
		end
	end
end

--上传仓库号坐标
function warehouse()
	jdwlLog("上传仓库号坐标")
	kill()
	--goBackWorld()
	local isok=0
	while true do
		if isok==1 and DmFindPic("jia_u.bmp",85,1063,585,1075,601) then
			jdwlLog("上传仓库号坐标完成")
			break
		elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			click(x,y)
		--地图还在加载中
--[[		elseif DmFindPic("chunse_u.bmp",85,950,589,964,602) == false and DmFindPic("jia_u.bmp",85,1063,585,1075,601) then
			jdwlMsg("当前场景正在加载")--]]
		--点击坐标栏	
		elseif DmFindPic("attack_u.bmp",75,475,164,508,193)==false and DmFindPic("jia_u.bmp",85,1063,585,1075,601) and DmFindPicFuzzy("x_u.bmp",85,987,407,1007,424,0xffffff) then
			click(x,y)
		elseif isok==1 and DmFindPic("qianwang_u.bmp",85,551,334,566,349) then
			click(x+200,y)
		elseif DmFindPic("qianwang_u.bmp",85,551,334,566,349) then
			--local fort=getFort()
			jdwlMsg(fort)sleep(1000)
			local x_ret= identifyX()
			local y_ret = identifyY()
			local coor = x_ret.."@"..y_ret
			jdwlMsg(coor)
			local ret = uploadWarehouse(coor,fort)
			jdwlMsg(ret)		
			if ret == "ok" then
				jdwlLog("warehouse_commit_ok")
				isok=1
			end
		else
			duihua()
			connect()
		end
	end
end

--暂时以文本的形式存放要塞编号
function getFort()
	local file
	file = io.open("/var/touchelf/scripts/fort.txt","r")
	local ret=file:read()
	file:close()
	return ret
end

--获取生产号的坐标
function getProduct(fort)
	local ret = httpGet(string.format("http://192.168.1.200:8080/game/servlet/game?action=getProduct&deviceid="..getDeviceID().."&status=1".."&fort=%s",fort))
	if ret == nil or ret == "" then
		return "null"
	else
		return ret
	end
end

--获取仓库号坐标
function getWarehouse(fort)
	local ret = httpGet(string.format("http://192.168.1.200:8080/game/servlet/game?action=getWarehouse&deviceid="..getDeviceID().."&status=1".."&fort=%s",fort))
	if ret == nil or ret == "" then
		return "null"
	else
		return ret
	end
end

function getSelf(fort)
	local ret = httpGet(string.format("http://192.168.1.200:8080/game/servlet/game?action=getSelf&deviceid="..getDeviceID().."&status=1".."&fort=%s",fort))
	if ret == nil or ret == "" then
		return "null"
	else
		return ret
	end
end

--获取侦查号坐标
function getDes(fort)
	local ret = httpGet(string.format("http://192.168.1.200:8080/game/servlet/game?action=getDes&deviceid="..getDeviceID().."&status=1".."&fort=%s",fort))
	if ret == nil or ret == "" then
		return "null"
	else
		return ret
	end
end
--提交仓库号坐标
function uploadWarehouse(coor,fort)
	local ret = httpGet(string.format("http://192.168.1.200:8080/game/servlet/game?action=warehouse&deviceid="..getDeviceID().."&coordinate=%s&status=1&fort=%s",coor,fort))
	if ret == nil or ret == "" then
		return "null"
	else
		return ret
	end
end
--提交生产号坐标
function uploadProduct(coor,fort)
	local ret = httpGet(string.format("http://192.168.1.200:8080/game/servlet/game?action=product&deviceid="..getDeviceID().."&coordinate=%s&status=1&fort=%s",coor,fort))
	if ret == nil or ret == "" then
		return "null"
	else
		return ret
	end
end

--注销生产号坐标
function modifyProduct(coor,fort)
	local ret = httpGet(string.format("http://192.168.1.200:8080/game/servlet/game?action=product&deviceid="..getDeviceID().."&coordinate=%s&status=0&fort=%s",coor,fort))
	if ret == nil or ret == "" then
		return "null"
	else
		return ret
	end
end

--坐标识别
--462,478,490,499
--462,463,490,484
--462,448,490,469
--462,433,490,454

--462,483,490,505
--462,468,490,490
--462,454,490,475
--462,439,490,460
function identifyX()
	local i=0
	local ret=""
	for i=1,4 do
		local y1=483-(i-1)*15
		local y2=505-(i-1)*15
		if DmFindPic("num0_u.bmp",80,462,y1,490,y2) or DmFindPic("num0_1_u.bmp",80,462,y1,490,y2) or DmFindPic("num0_2_u.bmp",80,462,y1,490,y2) or DmFindPic("num0_3_u.bmp",80,462,y1,490,y2) then
			ret=ret.."0"
			--notifyMessage(string.format("当前i:%s,当前ret:%s",i,ret))sleep(2000)
		elseif DmFindPic("num1_u.bmp",80,462,y1,490,y2) or DmFindPic("num1_1_u.bmp",80,462,y1,490,y2) or DmFindPic("num1_2_u.bmp",80,462,y1,490,y2)  then
			ret=ret.."1"
			--notifyMessage(string.format("当前i:%s,当前ret:%s",i,ret))sleep(2000)
		elseif DmFindPic("num2_u.bmp",80,462,y1,490,y2) or DmFindPic("num2_1_u.bmp",80,462,y1,490,y2) or DmFindPic("num2_2_u.bmp",80,462,y1,490,y2) or DmFindPic("num2_3_u.bmp",80,462,y1,490,y2) then
			ret=ret.."2"
			--notifyMessage(string.format("当前i:%s,当前ret:%s",i,ret))sleep(2000)
		elseif DmFindPic("num3_u.bmp",80,462,y1,490,y2) or DmFindPic("num3_1_u.bmp",80,462,y1,490,y2) or DmFindPic("num3_2_u.bmp",80,462,y1,490,y2) or DmFindPic("num3_3_u.bmp",80,462,y1,490,y2)then
			ret=ret.."3"
			--notifyMessage(string.format("当前i:%s,当前ret:%s",i,ret))sleep(2000)
		elseif DmFindPic("num4_u.bmp",80,462,y1,490,y2) or DmFindPic("num4_1_u.bmp",80,462,y1,490,y2) or DmFindPic("num4_2_u.bmp",80,462,y1,490,y2) then
			ret=ret.."4"
			--notifyMessage(string.format("当前i:%s,当前ret:%s",i,ret))sleep(2000)
		elseif DmFindPic("num5_u.bmp",80,462,y1,490,y2) or DmFindPic("num5_1_u.bmp",80,462,y1,490,y2) or DmFindPic("num5_2_u.bmp",80,462,y1,490,y2) or 
		DmFindPic("num5_3_u.bmp",80,462,y1,490,y2) or DmFindPic("num5_4_u.bmp",80,462,y1,490,y2) then
			ret=ret.."5"
			--notifyMessage(string.format("当前i:%s,当前ret:%s",i,ret))sleep(2000)
		elseif DmFindPic("num6_u.bmp",80,462,y1,490,y2) or DmFindPic("num6_1_u.bmp",80,462,y1,490,y2) or DmFindPic("num6_2_u.bmp",80,462,y1,490,y2) or DmFindPic("num6_3_u.bmp",80,462,y1,490,y2) then
			ret=ret.."6"
			--notifyMessage(string.format("当前i:%s,当前ret:%s",i,ret))sleep(2000)
		elseif DmFindPic("num7_u.bmp",80,462,y1,490,y2) or DmFindPic("num7_1_u.bmp",80,462,y1,490,y2) or DmFindPic("num7_2_u.bmp",80,462,y1,490,y2) or DmFindPic("num7_3_u.bmp",80,462,y1,490,y2) then
			ret=ret.."7"
			--notifyMessage(string.format("当前i:%s,当前ret:%s",i,ret))sleep(2000)
		elseif DmFindPic("num8_u.bmp",80,462,y1,490,y2) or DmFindPic("num8_1_u.bmp",80,462,y1,490,y2) or DmFindPic("num8_2_u.bmp",80,462,y1,490,y2) or DmFindPic("num8_3_u.bmp",80,462,y1,490,y2) then
			ret=ret.."8"
			--notifyMessage(string.format("当前i:%s,当前ret:%s",i,ret))sleep(2000)
		elseif DmFindPic("num9_u.bmp",80,462,y1,490,y2) or DmFindPic("num9_1_u.bmp",80,462,y1,490,y2) or DmFindPic("num9_2_u.bmp",80,462,y1,490,y2) or DmFindPic("num9_3_u.bmp",80,462,y1,490,y2) or DmFindPic("num9_4_u.bmp",80,462,y1,490,y2) then
			ret=ret.."9"
			--notifyMessage(string.format("当前i:%s,当前ret:%s",i,ret))sleep(2000)
		else
			ret=ret..""
		end
	end
	return ret
end

--462,210,490,230
--462,195,490,215
--462,180,490,200
--462,165,490,185
function identifyY()
	local i=0
	local ret=""
	for i=1,4 do
		local y1=210-(i-1)*15
		local y2=230-(i-1)*15
		if DmFindPic("y_0_u.bmp",80,462,y1,490,y2) or DmFindPic("y_0_1_u.bmp",80,462,y1,490,y2) or DmFindPic("y_0_2_u.bmp",80,462,y1,490,y2)then
			ret=ret.."0"
			--notifyMessage(string.format("当前i:%s,当前ret:%s",i,ret))sleep(2000)
		elseif DmFindPic("y_1_u.bmp",80,462,y1,490,y2) or DmFindPic("y_1_1_u.bmp",80,462,y1,490,y2) or DmFindPic("y_1_2_u.bmp",80,462,y1,490,y2)  then
			ret=ret.."1"
			--notifyMessage(string.format("当前i:%s,当前ret:%s",i,ret))sleep(2000)
		elseif DmFindPic("y_2_u.bmp",80,462,y1,490,y2) or DmFindPic("y_2_1_u.bmp",80,462,y1,490,y2) or DmFindPic("y_2_2_u.bmp",80,462,y1,490,y2) or DmFindPic("y_2_3_u.bmp",80,462,y1,490,y2) then
			ret=ret.."2"
		elseif DmFindPic("y_2_4_u.bmp",80,462,y1,490,y2) then
			ret=ret.."2"
			--notifyMessage(string.format("当前i:%s,当前ret:%s",i,ret))sleep(2000)
		elseif DmFindPic("y_3_u.bmp",80,462,y1,490,y2) or DmFindPic("y_3_1_u.bmp",80,462,y1,490,y2) or DmFindPic("y_3_2_u.bmp",80,462,y1,490,y2) or DmFindPic("y_3_3_u.bmp",80,462,y1,490,y2)then
			ret=ret.."3"
			--notifyMessage(string.format("当前i:%s,当前ret:%s",i,ret))sleep(2000)
		elseif DmFindPic("y_4_u.bmp",80,462,y1,490,y2) or DmFindPic("y_4_1_u.bmp",80,462,y1,490,y2) or DmFindPic("y_4_2_u.bmp",80,462,y1,490,y2) or DmFindPic("y_4_3_u.bmp",80,462,y1,490,y2) then
			ret=ret.."4"
			--notifyMessage(string.format("当前i:%s,当前ret:%s",i,ret))sleep(2000)
		elseif DmFindPic("y_5_u.bmp",80,462,y1,490,y2) or DmFindPic("y_5_1_u.bmp",80,462,y1,490,y2) or DmFindPic("y_5_2_u.bmp",80,462,y1,490,y2)or DmFindPic("y_5_3_u.bmp",80,462,y1,490,y2) then
			ret=ret.."5"
			--notifyMessage(string.format("当前i:%s,当前ret:%s",i,ret))sleep(2000)
		elseif DmFindPic("y_6_u.bmp",80,462,y1,490,y2) or DmFindPic("y_6_1_u.bmp",80,462,y1,490,y2) or DmFindPic("y_6_2_u.bmp",80,462,y1,490,y2) or DmFindPic("y_6_3_u.bmp",80,462,y1,490,y2)then
			ret=ret.."6"
			--notifyMessage(string.format("当前i:%s,当前ret:%s",i,ret))sleep(2000)
		elseif DmFindPic("y_7_u.bmp",80,462,y1,490,y2) or DmFindPic("y_7_1_u.bmp",80,462,y1,490,y2) or DmFindPic("y_7_2_u.bmp",80,462,y1,490,y2)then
			ret=ret.."7"
			--notifyMessage(string.format("当前i:%s,当前ret:%s",i,ret))sleep(2000)
		elseif DmFindPic("y_8_u.bmp",80,462,y1,490,y2) or DmFindPic("y_8_1_u.bmp",80,462,y1,490,y2) or DmFindPic("y_8_2_u.bmp",80,462,y1,490,y2) or 
		DmFindPic("y_8_3_u.bmp",80,462,y1,490,y2) or DmFindPic("y_8_4_u.bmp",80,462,y1,490,y2)then
			ret=ret.."8"
			--notifyMessage(string.format("当前i:%s,当前ret:%s",i,ret))sleep(2000)
		elseif DmFindPic("y_9_u.bmp",80,462,y1,490,y2) or DmFindPic("y_9_1_u.bmp",80,462,y1,490,y2) or DmFindPic("y_9_2_u.bmp",80,462,y1,490,y2) or DmFindPic("y_9_3_u.bmp",80,462,y1,490,y2) then
			ret=ret.."9"
		elseif DmFindPic("y_9_4_u.bmp",80,462,y1,490,y2) then
			ret=ret.."9"
			--notifyMessage(string.format("当前i:%s,当前ret:%s",i,ret))sleep(2000)
		else
			ret=ret..""
		end
	end
	return ret
end


function buildingFive()
	if wuji==0 then
		cantingshengji()
		cangkushengji()
		chengqiangshengji()
		houqinshengji()
		keyanshengji()
		jidishengji()
		srsshengji()
		zpshengji()
		hunheshengji()
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



--掉线重连相关未完全修改
function connect()
	--网络连接断开，再试一次
	if DmFindPic("zaishiyici_u.bmp",85,690,354,709,369) then
		click(x,y)
	--僵尸进攻
	elseif DmFindPic("zhandouwanbi_u.bmp",80,146,21,163,38) then
		click(x,y)
	--网络异常反馈
	elseif DmFindPic("fankui_u.bmp",85,693,327,711,344) then
		click(x,y)
	--电池启动游戏
	elseif DmFindPic("dianchi_u.bmp",85,20,70,32,78) then
		run()	
	--领取奖励
	elseif DmFindPic("lingqu_u.bmp",85,876,323,890,338) then
		click(x,y)			
	--签到奖励叉子	
	elseif DmFindPic("guanbiqiandao_u.bmp",85,155,73,167,84) then
		click(x,y)		
	--关闭充值窗口
	elseif DmFindPic("zuanshi_1_u.bmp",85,494,281,508,297) then
		click(1073,607)
	elseif DmFindPic("zuanshi_2_u.bmp",85,417,273,434,290) then
		click(1073,607)	
	elseif DmFindPic("shenglinvshen_u.bmp",80,514,532,531,546) then
		click(336,100)
	elseif DmFindPic("guanbichongzhi_u.bmp",80,332,79,343,92) then
		click(x,y)
	elseif DmFindPic("guanbijidifazhan_u.bmp",80,265,53,282,72) then
		click(x,y)
	elseif DmFindPic("guanbijieshao_u.bmp",80,172,30,183,43) then
		click(x,y)
	--限时特供
	elseif DmFindPic("xianshitegong_u.bmp",80,333,95,344,108) then
		click(x,y)
	--levelup
	elseif DmFindPic("levelup_u.bmp",85,481,494,503,510) then--1077,585
		click(x+596,y+90)		
	--断网再试一次
	elseif DmFindPic("zaishiyici_u.bmp",85,693,292,710,304) then
		click(x,y)	
	--发生未知错误需要关闭游戏
	elseif DmFindPicFuzzy("sorry_u.bmp",85,462,482,492,508,0xffffff) and DmFindPic("queding_u.bmp",85,691,335,704,347) then
		kill()
		jdwlLog("发生未知错误")
	elseif DmFindPic("sorry1_u.bmp",80,466,485,483,502) and DmFindPic("queding1_u.bmp",80,674,405,709,434) then
		kill()
		jdwlLog("发生未知错误")
	--victory
	elseif DmFindPic("v_u.bmp",85,353,339,371,356) then--314,343
		click(x-60,y+6)	
	--提示活动
	elseif DmFindPic("anlianmeng_u.bmp",80,1048,59,1062,72) and (DmFindPic("anshijie_u.bmp",80,1037,575,1050,588) or DmFindPic("anjia_u.bmp",80,1034,578,1045,591))then
		click(1086,583)
	end
end


--使用背包资源
function shiyong()
	jdwlLog("use resources")
	local isok=0
	local wc=0
	local tt=os.time()
	local count=0
	while true do
		if os.difftime(os.time(),tt) > 120 then
			kill()
			jdwlLog("use resources overtime")
			isok=0
			wc=0
			tt=os.time()
		elseif wc==1 and (DmFindPic("jie_u.bmp",85,1065,575,1080,589) or DmFindPic("jia_u.bmp",85,1063,585,1075,601) )then
			jdwlLog("资源使用完成")
			break	
		--点击燃油打开资源面板
		elseif DmFindPic("oil_u.bmp",85,25,523,39,535) then
			click(x,y)
			sleep(1000)
		elseif count> 5 and DmFindPic("guanbiziyuan_u.bmp",85,28,610,53,624) then
			kill()
			count=0
		elseif wc==1 and DmFindPic("guanbiziyuan_u.bmp",85,28,610,53,624) then
			click(x,y)
			count=count+1
			sleep(1000)
		--点击使用
		elseif DmFindPic("shiyongranyou_u.bmp",80,239,124,259,139) or DmFindPic("shiyongshiwu_u.bmp",80,245,97,257,111) then
			click(x,y)
			sleep(1000)
		--具体的使用
		elseif DmFindPic("shiyong1_u.bmp",85,694,336,713,350) then
			click(x,y)
		elseif isok==1 and DmFindPic("food_u.bmp",85,117,206,131,223) then
			click(x,y)					
		elseif isok==1 and DmFindPic("zuanshi_u.bmp",85,247,128,258,138) then
			wc=1
		--资源使用完毕
		elseif DmFindPic("zuanshi_u.bmp",85,247,128,258,138) then
			isok=1				
		else
			duihua()
			connect()
		end
	end
end


--购买雇员未修改
function employ()
	qiehuan()
	jdwlLog("employ")
	local isok=0
	while true do
		if isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("employ not enough")
			break
		elseif DmFindPic("diamond_u.bmp",85,694,287,707,302) then--811,405
			click(x+117,y+118)
			isok=1
		--扳手标志
		elseif DmFindPic("banshou_u.bmp",85,313,569,324,582) then
			click(x,y)sleep(1000)
		--点击钻石雇佣
		elseif DmFindPic("guyong_u.bmp",85,706,297,719,321) then
			click(x,y)sleep(1000)
		--已经雇佣了
		elseif DmFindPic("yiguyong_u.bmp",85,315,570,326,582) then
			jdwlLog("employ:finish")
			break
		elseif DmFindPic("banshou_u.bmp",85,313,569,324,582)==false and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("employ:finish")
			break
		else
			duihua()
			connect()
		end
	end
end

--关闭任务提示
function shezhi()
	jdwlLog("shezhi")
	local tt=os.time()
	local isok=0
	while true do
		if os.difftime(os.time(),tt) > 120 then
			jdwlLog("设置超时")
			kill()
			tt=os.time()
		elseif isok==1 and (DmFindPic("jie_u.bmp",85,1065,575,1080,589) or DmFindPic("jia_u.bmp",85,1063,585,1075,601) )then
			jdwlLog("设置完成")
			break
		elseif isok==1 and DmFindPic("guanbiziyuan_u.bmp",85,28,610,53,624) then		
			click(x,y)
		elseif isok==1 and DmFindPic("guanbi_u.bmp",85,31,607,59,622) then
			click(x,y)
		--关闭选项
		elseif isok==1 and (DmFindPic("guanbixuanxiang_u.bmp",80,29,609,49,623) or DmFindPic("guanbixuanxiang1_u.bmp",80,34,611,58,623) )then
			click(x,y)
		--点击人物头像
		elseif DmFindPic("oil_u.bmp",85,25,523,39,535) or DmFindPic("oil1_u.bmp",85,26,529,38,539) then--51,588
			click(x+30,y+60)
		elseif DmFindPic("shezhi_u.bmp",80,1049,94,1064,110) or DmFindPic("shezhi1_u.bmp",80,1033,77,1045,93) then
			click(x,y)
		elseif DmFindPic("xuanxiang_u.bmp",80,441,510,456,522) then
			click(x,y)
		--关闭手指提示
		elseif DmFindPic("renwuguanbi_u.bmp",80,514,290,524,301) then
			click(x,y)
		--确认关闭	
		elseif DmFindPic("yijingguanbi_u.bmp",80,511,327,525,341) then
			isok=1
			--jdwlMsg("a")
		else
			duihua()
			connect()
		end
	end
end

--人物技能加点
function skill()
	jdwlLog("skill")
	local isok=0
	local tt=os.time()
	local count=0
	while true do
		baojing()
		if os.difftime(os.time(),tt)> 120 then
			kill()
			jdwlLog("skill overtime")
			tt=os.time()
		elseif isok==1 and DmFindPic("oil_u.bmp",85,25,523,39,535) then
			jdwlLog("skill:finish")
			break
		--点击人物头像
		elseif isok==0 and DmFindPic("oil_u.bmp",85,25,523,39,535) then--51,588
			click(x+30,y+60)
		--关闭人物
		elseif count > 4 and isok==1 and DmFindPic("guanbi_u.bmp",85,31,607,59,622) then
			kill()
			jdwlLog("skill:finish")
			break
		elseif isok==1 and DmFindPic("guanbi_u.bmp",85,31,607,59,622) then
			click(x,y) sleep(1000)
			count =count + 1
		--点击技能图标
		elseif DmFindPic("jineng_u.bmp",85,1068,243,1082,259) then
			click(x,y) sleep(1000)
		--没有技能点数了
		elseif DmFindPic("lingdian_u.bmp",85,32,297,53,312) then
			isok=1
		elseif DmFindPic("jdjjok_u.bmp",80,1086,308,1095,333) then
			isok=1
		elseif DmFindPic("ysfy5_u.bmp",85,1045,305,1059,337) then
			myMove_RL(1036,378,832,378,2)
		--基地集结
		elseif DmFindPic("jdjj_u.bmp",80,1014,309,1032,325) then
			click(x,y)sleep(1000)
		--勇士防御
		elseif DmFindPic("yongshifangyu_u.bmp",85,978,346,993,358) then
			click(x,y) sleep(1000)
		--勇士攻击
		elseif DmFindPic("yongshigongji_u.bmp",85,745,349,759,364) then
			click(x,y) sleep(1000)
		--勇士生命
		elseif DmFindPic("yongshishengming_u.bmp",85,514,341,530,358) then
			click(x,y) sleep(1000)
		--部队负重
		elseif DmFindPic("buduifuzhong_u.bmp",85,280,348,294,359) then
			click(x,y) sleep(1000)
		--学习按钮
		elseif DmFindPic("xuexi_u.bmp",85,591,333,607,345) then
			click(x,y)sleep(500)
		--黑技能
		elseif DmFindPic("heijineng_u.bmp",85,31,375,48,392) then
			click(x,y) sleep(1000)
		else
			connect()
		end
		sleep(500)
	end
end

--对话框跳过
function duihua()
		--开场第一个对话框
		if DmFindPic("duihua_u.bmp",85,777,89,791,100) then
			click(x,y)	jdwlLog("duihua_u")
		--第二个对话框
		elseif DmFindPic("duihua1_u.bmp",85,778,300,792,314) then
			click(x,y)	jdwlLog("duihua1_u")		
		elseif DmFindPic("duihua2_u.bmp",85,578,88,590,101) then
			click(x,y)	jdwlLog("duihua2_u")
		elseif DmFindPic("duihua3_u.bmp",85,879,301,890,313) then
			click(x,y)	jdwlLog("duihua3_u")
		elseif DmFindPic("duihua4_u.bmp",85,579,303,592,313) then
			click(x,y)	jdwlLog("duihua4_u")
		elseif DmFindPic("duihua5_u.bmp",80,659,90,670,103) then
			click(x,y)    jdwlLog("duihua5_u")
		elseif DmFindPic("duihua6_u.bmp",80,657,90,672,103) then
			click(x,y)    jdwlLog("duihua6_u")			
		end	
end

--切换一下世界与家防止图片被放缩
function qiehuan()
	jdwlLog("qiehuan")
	local jia=0
	local shijie=0
	local tt=os.time()
	while true do
		baojing()
		if os.difftime(os.time(),tt) > 120 then
			kill()
			jdwlLog("qiehuan:overtime")
			tt=os.time()
			jia=0
			shijie=0
		--切换过程中如果发现免费则需要点击免费
		elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("mianfei1_u.bmp",85,198,595,232,624,0xffffff) then
			click(x,y)
		elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("mianfei2_u.bmp",85,317,595,351,625,0xffffff) then
			click(x,y)		
		elseif jia==1 and shijie==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("qiehuan:finish")
			break
		elseif DmFindPic("jia_u.bmp",85,1063,585,1075,601) then
			click(x,y)
			shijie=1
			sleep(1500)
		elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			click(x,y)
			jia=1
			sleep(1500)			
		else
			duihua()
			connect()
		end
	end
end

--回到世界界面
function goBackWorld()
	jdwlLog("go back world")
	local jia=0
	local shijie=0
	local tt=os.time()	
	while true do
		baojing()
		if os.difftime(os.time(),tt) > 60 then
			kill()
			jdwlLog("goBackWorld:overtime")
			tt=os.time()
			jia=0
			shijie=0
		elseif jia==1 and shijie==1 and DmFindPic("jia_u.bmp",85,1063,585,1075,601) then
			jdwlLog("go back world:finish")
			break
		elseif DmFindPic("jia_u.bmp",85,1063,585,1075,601) then
			click(x,y)
			shijie=1
			sleep(1500)
		elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			click(x,y)
			jia=1
			sleep(1500)					
		else
			duihua()
			connect()
		end
	end
end

--将场景滑动到最右下角
function yuandian()
	jdwlLog("yuandian")
	qiehuan()
	local tt=os.time()
	while true do
		baojing()
		if os.difftime(os.time(),tt) > 120 then
			kill()
			jdwlLog("yuandian overtime")
			tt=os.time()
		--回家
		elseif DmFindPic("jia_u.bmp",85,1063,585,1075,601) then
			click(x,y)
		--找到固定点则表示滑动
		elseif DmFindPic("yuandian_u.bmp",85,777,502,790,515) then
			jdwlLog("yuandian:finish")
			break
		--如果看到世界图标则开始移动
		elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			myMove_UD(886,52,886,603,50)
			sleep(1000)
			if DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				myMove_RL(931,320,134,320,50)sleep(1000)
			end
			sleep(1000)
		else
			sleep(500)
			duihua()
			connect()
		end
	end
end

--从右下角原点移动到农田
function qunongtian()
	yuandian()
	jdwlLog("go to nongtian")
	local tt=os.time()
	while true do
		baojing()
		if os.difftime(os.time(),tt) > 90 then
			kill()
			jdwlLog("go to nongtian overtime")
			yuandian()			
			tt=os.time()
		elseif DmFindPic("yuandian_u.bmp",85,777,502,790,515) then
			myMove_UD(693,582,693,142,4)sleep(1000)
		--移到位置了
		elseif DmFindPic("nongtianweizhi_u.bmp",85,360,502,370,513) or DmFindPic("ntwz1_u.bmp",80,367,514,377,527) then
			jdwlLog("go to nongtian:finish")
			break
		else
			sleep(1000)
			duihua()
			connect()			
		end
	end
end

--将五块农田全部升至四级
function nongtianshengji()
	jdwlLog("upgrade:nongtian")
	qunongtian()
	nongtianone()
	nongtiantwo()
	nongtianthree()
	nongtianfour()
	nongtianfive()
end

function nongtianone()
	jdwlLog("upgrade nongtian one")
	local isok=0
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 90 then
			kill()
			isok=0
			jdwlLog("upgrade nongtian one overtime")
			qunongtian()
			tt=os.time()
		elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("upgrade nongtian one:finish")
			break
		--条件不够误点建筑物
		elseif (DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) or DmFindPic("5ji_u.bmp",80,159,271,179,286))and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y)	
			isok=1		
		--点击免费
		elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("ntmf1_u.bmp",85,257,248,317,307,0xffffff) then
			click(x,y)
			sleep(3500)
		--第一排第一块农田升级标志
		elseif DmFindPic("nt1sj_u.bmp",85,378,195,478,271) then
			click(x,y)	sleep(2000)
		--第一排第一块农田
		elseif DmFindPic("nongtianweizhi_u.bmp",85,360,502,370,513) or DmFindPic("ntwz_u.bmp",85,360,501,370,514) or DmFindPic("ntwz1_u.bmp",80,367,514,377,527) then--364,255
			click(x,y-255)  sleep(1000)
		--如果为空地则建造农田
		elseif DmFindPic("nong_u.bmp",80,847,329,862,341) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
			click(x,y)
		--说明栏建造
		elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
			click(x,y)			
			local tt=os.time()
			while os.difftime(os.time(),tt) < 3 do
				if DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("ntmf1_u.bmp",85,257,248,317,307,0xffffff) then
					click(x,y)sleep(500)
				end
			end
		--详细的升级按钮
		elseif DmFindPic("ntdj4_u.bmp",85,161,273,176,284) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y) sleep(1500)
			isok=1
		elseif DmFindPic("ntdj4_u.bmp",85,161,273,176,284)==false and DmFindPic("xia_u.bmp",85,160,359,173,369) and DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
			click(x,y)	jdwlLog("shengji1_u")
			sleep(1500)			
		else
			sleep(1000)
			duihua()
			connect()			
		end	
	end
end

function nongtiantwo()
	jdwlLog("upgrade nongtian two")
	local isok=0
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 90 then
			kill()
			isok=0
			jdwlLog("upgrade nongtian two overtime")
			qunongtian()
			tt=os.time()			
		elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("upgrade nongtian one:finish")
			break	
		--条件不够误点建筑物
		elseif  (DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) or DmFindPic("5ji_u.bmp",80,159,271,179,286)) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y)	
			isok=1					
		--点击免费
		elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("ntmf2_u.bmp",85,324,135,359,163,0xffffff)  then
			click(x,y)
			sleep(3500)
		--第一排第二块农田升级标志
		elseif DmFindPic("nt2sj_u.bmp",85,453,103,496,142) then
			click(x,y)	sleep(1000)			
		--第一排第二块农田升级
		elseif DmFindPic("nongtianweizhi_u.bmp",85,360,502,370,513) or DmFindPic("ntwz_u.bmp",85,360,501,370,514)or DmFindPic("ntwz1_u.bmp",80,367,514,377,527)  then--418,146
			click(x+60,y-360) sleep(1000)
		--如果为空地则建造农田
		elseif DmFindPic("nong_u.bmp",80,847,329,862,341) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
			click(x,y)
		--说明栏建造
		elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
			click(x,y)			
			local tt=os.time()
			while os.difftime(os.time(),tt) < 3 do
				if DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("ntmf2_u.bmp",85,324,135,359,163,0xffffff) then
					click(x,y)sleep(500)
				end
			end
		--详细的升级按钮
		elseif DmFindPic("ntdj4_u.bmp",85,161,273,176,284) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y) sleep(1500)
			isok=1
		elseif DmFindPic("ntdj4_u.bmp",85,161,273,176,284)==false and DmFindPic("xia_u.bmp",85,160,359,173,369) and DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
			click(x,y)	jdwlLog("shengji1_u")
			sleep(1500)				
		else
			sleep(1000)
			duihua()
			connect()			
		end	
	end	
end

function nongtianthree()
	jdwlLog("upgrade nongtian three")
	local isok=0
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 90 then
			kill()
			isok=0
			jdwlLog("upgrade nongtian three overtime")
			qunongtian()
			tt=os.time()			
		elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("upgrade nongtian three:finish")
			break
		--条件不够误点建筑物
		elseif  (DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) or DmFindPic("5ji_u.bmp",80,159,271,179,286)) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y)	
			isok=1						
		--点击免费
		elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("nt3mf_u.bmp",80,303,410,333,435,0xffffff) then
			click(x,y)			
			sleep(3500)
		--第二排第一块农田升级
		elseif DmFindPic("nt3sj_u.bmp",85,406,346,507,419) then
			click(x,y) sleep(1000)
		--第二排第一块农田升级
		elseif DmFindPic("nongtianweizhi_u.bmp",85,360,502,370,513) or DmFindPic("ntwz_u.bmp",85,360,501,370,514) or DmFindPic("ntwz1_u.bmp",80,367,514,377,527)  then--400,398
			click(x+40,y-110) sleep(1000)
		--如果为空地则建造农田
		elseif DmFindPic("nong_u.bmp",80,847,329,862,341) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
			click(x,y)
		--说明栏建造
		elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
			click(x,y)			
			local tt=os.time()
			while os.difftime(os.time(),tt) < 3 do
				if DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("nt3mf_u.bmp",80,303,410,333,435,0xffffff) then
					click(x,y)sleep(500)
				end
			end
		--详细的升级按钮
		elseif DmFindPic("ntdj4_u.bmp",85,161,273,176,284) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y) sleep(1000)
			isok=1
		elseif DmFindPic("ntdj4_u.bmp",85,161,273,176,284)==false and DmFindPic("xia_u.bmp",85,160,359,173,369) and DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
			click(x,y)	jdwlLog("shengji1_u")
			sleep(1500)		
		else
			sleep(1000)
			duihua()
			connect()			
		end	
	end	
end

function nongtianfour()
	jdwlLog("upgrade nongtian four")
	local isok=0
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt)> 90 then
			kill()
			isok=0
			jdwlLog("upgrade nongtian four overtime")
			qunongtian()
			tt=os.time()						
		elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("upgrade nongtian four:finish")
			break	
		--条件不够误点建筑物
		elseif  (DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) or DmFindPic("5ji_u.bmp",80,159,271,179,286)) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y)	
			isok=1						
		--点击免费
		elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("ntmf4_u.bmp",85,340,293,405,353,0xffffff) then
			click(x,y)		
			sleep(3500)	
		--第二排第一块农田升级
		elseif DmFindPic("nt4sj_u.bmp",85,459,249,547,316) then
			click(x,y) sleep(2000)			 	
		--第二排第二块农田
		elseif DmFindPic("nongtianweizhi_u.bmp",85,360,502,370,513) or DmFindPic("ntwz_u.bmp",85,360,501,370,514)or DmFindPic("ntwz1_u.bmp",80,367,514,377,527)  then--447,302
			click(x+90,y-200) sleep(1000)
		--如果为空地则建造农田
		elseif DmFindPic("nong_u.bmp",80,847,329,862,341) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
			click(x,y)
		--说明栏建造
		elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
			click(x,y)			
			local tt=os.time()
			while os.difftime(os.time(),tt) < 3 do
				if DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("ntmf4_u.bmp",85,340,293,405,353,0xffffff) then
					click(x,y)sleep(500)
				end
			end
		--详细的升级按钮
		elseif DmFindPic("ntdj4_u.bmp",85,161,273,176,284) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y) sleep(1000)
			isok=1
		elseif DmFindPic("ntdj4_u.bmp",85,161,273,176,284)==false and DmFindPic("xia_u.bmp",85,160,359,173,369) and DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
			click(x,y)	jdwlLog("shengji1_u")
			sleep(1500)		
		else
			sleep(1000)
			duihua()
			connect()			
		end	
	end	
end

function nongtianfive()
	jdwlLog("upgrade nongtian five")
	local isok=0
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt)> 90 then
			kill()
			isok=0
			jdwlLog("upgrade nongtian five overtime")
			yuandian()
			qunongtian()
			tt=os.time()		
		elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("upgrade nongtian five:finish")
			break		
		--条件不够误点建筑物
		elseif  (DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) or DmFindPic("5ji_u.bmp",80,159,271,179,286))and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y)	
			isok=1					
		--点击免费
		elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("ntmf5_u.bmp",85,393,172,460,237,0xffffff) then
			click(x,y)		
			sleep(3500)	
		--第二排第一块农田升级
		elseif DmFindPic("nt5sj_u.bmp",85,501,126,610,202) then
			click(x,y) sleep(2000)					
		--第二排第三块农田
		elseif DmFindPic("nongtianweizhi_u.bmp",85,360,502,370,513) or DmFindPic("ntwz_u.bmp",85,360,501,370,514)or DmFindPic("ntwz1_u.bmp",80,367,514,377,527)  then--503,182
			click(x+140,y-320) sleep(1000)
		--如果为空地则建造农田
		elseif DmFindPic("nong_u.bmp",80,847,329,862,341) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
			click(x,y)
		--说明栏建造
		elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
			click(x,y)			
			local tt=os.time()
			while os.difftime(os.time(),tt) < 3 do
				if DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("ntmf5_u.bmp",85,393,172,460,237,0xffffff) then
					click(x,y)sleep(500)
				end
			end
		--详细的升级按钮
		elseif DmFindPic("ntdj4_u.bmp",85,161,273,176,284) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y) sleep(1000)
			isok=1
		elseif DmFindPic("ntdj4_u.bmp",85,161,273,176,284)==false and DmFindPic("xia_u.bmp",85,160,359,173,369) and DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
			click(x,y)	jdwlLog("shengji1_u")
			sleep(1500)		
		else
			sleep(1000)
			duihua()
			connect()			
		end	
	end	
end

--从右下角原点移动到油井
function quyoujing()
	jdwlLog("go to youjing")
	yuandian()
	local tt=os.time()
	while true do
		baojing()
		if os.difftime(os.time(),tt)>90 then
			kill()
			jdwlLog("go to youjing overtime")
			yuandian()
			tt=os.time()
		elseif DmFindPic("youjingweizhi_u.bmp",85,724,177,750,202) then
			jdwlLog("go to youjing:finish")
			break
		elseif DmFindPic("yuandian_u.bmp",85,777,502,790,515) or DmFindPic("nongtianweizhi_u.bmp",85,360,502,370,513) or DmFindPic("ntwz1_u.bmp",80,367,514,377,527) then
			myMove_UD(693,582,693,142,4)sleep(1000)
		else
			sleep(1000)
			duihua()
			connect()
		end
	end
end

--将五块油田全部升至四级
function youjingshengji()
	jdwlLog("upgrade youjing")
	yuandian()
	quyoujing()
	youjingone()
	youjingtwo()
	youjingthree()
	youjingfour()
	youjingfive()
end

function youjingone()
	jdwlLog("upgrade youjing one")
	local isok=0
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 120 then
			isok=0
			kill()
			jdwlLog("upgrade youjing one overtime")
			quyoujing()
			tt=os.time()	
		elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("upgrade youjing one:finish")
			break
		--条件不够误点建筑物
		elseif  (DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) or DmFindPic("5ji_u.bmp",80,159,271,179,286)) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y)	
			isok=1					
		--点击免费
		elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("yjmf1_u.bmp",85,403,247,432,272,0xffffff) then
			click(x,y)
			sleep(1000)
		--第一排第一块油井升级标志
		elseif DmFindPic("yj1sj_u.bmp",85,527,194,595,252) then
			click(x,y) sleep(1000)	
		--第一排第一块油井
		elseif DmFindPic("youjingweizhi_u.bmp",85,724,177,750,202) then--495,231
			click(x-240,y+50)
		--如果为空地则建造农田
		elseif DmFindPic("you_u.bmp",80,847,329,862,341) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
			click(x,y)
		elseif DmFindPic("you_u.bmp",80,847,329,862,341)==false and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then--759,454
			click(x-270,y-110)
		--说明栏建造
		elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
			click(x,y)			
			local tt=os.time()
			while os.difftime(os.time(),tt) < 3 do
				if DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("yjmf1_u.bmp",85,403,247,432,272,0xffffff) then
					click(x,y)sleep(500)
				end
			end
		--详细的升级按钮
		elseif DmFindPic("ntdj4_u.bmp",85,161,273,176,284) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y) sleep(1500)
			isok=1
		elseif DmFindPic("ntdj4_u.bmp",85,161,273,176,284)==false and DmFindPic("xia_u.bmp",85,160,359,173,369) and DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
			click(x,y)	jdwlLog("shengji1_u")
			sleep(1500)			
		else
			sleep(1000)
			duihua()
			connect()
		end	
	end
end

function youjingtwo()
	jdwlLog("upgrade youjing two")
	local isok=0
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 120 then
			isok=0
			kill()
			jdwlLog("upgrade youjing two overtime")
			yuandian()
			quyoujing()
			tt=os.time()			
		elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("upgrade youjing one:finish")
			break
		--条件不够误点建筑物
		elseif  (DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) or DmFindPic("5ji_u.bmp",80,159,271,179,286))and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y)	
			isok=1					
		--点击免费
		elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("yjmf2_u.bmp",85,474,160,504,184,0xffffff) then
			click(x,y)
			sleep(1000)
		--第一排第二块油井升级标志
		elseif DmFindPic("yj2sj_u.bmp",85,595,85,670,155) then
			click(x,y) sleep(1000)	
		--第一排第二块油井
		elseif DmFindPic("youjingweizhi_u.bmp",85,724,177,750,202) or DmFindPic("youjingweizhi1_u.bmp",85,730,207,745,222) then--567,122
			click(x-160,y-50)
		--如果为空地则建造农田
		elseif DmFindPic("you_u.bmp",80,847,329,862,341) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
			click(x,y)
		elseif DmFindPic("you_u.bmp",80,847,329,862,341)==false and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then--759,454
			click(x-270,y-110)
		--说明栏建造
		elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
			click(x,y)			
			local tt=os.time()
			while os.difftime(os.time(),tt) < 3 do
				if DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("yjmf2_u.bmp",85,474,160,504,184,0xffffff)  then
					click(x,y)sleep(500)
				end
			end
		--详细的升级按钮
		elseif DmFindPic("ntdj4_u.bmp",85,161,273,176,284) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y) sleep(1500)
			isok=1
		elseif DmFindPic("ntdj4_u.bmp",85,161,273,176,284)==false and DmFindPic("xia_u.bmp",85,160,359,173,369) and DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
			click(x,y)	jdwlLog("shengji1_u")
			sleep(1500)					
		else
			sleep(1000)
			duihua()
			connect()
		end	
	end
end

function youjingthree()
	jdwlLog("upgrade youjing three")
	quyoujing()
	local isok=0
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 120 then
			isok=0
			kill()
			jdwlLog("upgrade youjing three overtime")
			quyoujing()
			tt=os.time()			
		elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("upgrade youjing three:finish")
			break
		--条件不够误点建筑物
		elseif  (DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) or DmFindPic("5ji_u.bmp",80,159,271,179,286))and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y)	
			isok=1				
		--点击免费
		elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("yjmf3_u.bmp",85,402,455,472,523,0xffffff) then
			click(x,y)
			sleep(1000)
		--第二排第一块油井升级标志
		elseif DmFindPic("yj3sj_u.bmp",85,539,418,613,482) then
			click(x,y) sleep(1000)	
		--第二排第一块油井
		elseif DmFindPic("youjingweizhi_u.bmp",85,724,177,750,202) or DmFindPic("youjingweizhi1_u.bmp",85,730,207,745,222) then--510,492
			click(x-220,y+280)
		--如果为空地则建造农田
		elseif DmFindPic("you_u.bmp",80,847,329,862,341) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
			click(x,y)
		elseif DmFindPic("you_u.bmp",80,847,329,862,341)==false and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then--759,454
			click(x-270,y-110)
		--说明栏建造
		elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
			click(x,y)			
			local tt=os.time()
			while os.difftime(os.time(),tt) < 3 do
				if DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("yjmf3_u.bmp",85,402,455,472,523,0xffffff) then
					click(x,y)sleep(500)
				end
			end
		--详细的升级按钮
		elseif DmFindPic("ntdj4_u.bmp",85,161,273,176,284) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y) sleep(1500)
			isok=1
		elseif DmFindPic("ntdj4_u.bmp",85,161,273,176,284)==false and DmFindPic("xia_u.bmp",85,160,359,173,369) and DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
			click(x,y)	jdwlLog("shengji1_u")
			sleep(1500)			
		else
			sleep(1000)
			duihua()
			connect()
		end	
	end
end

function youjingfour()
	jdwlLog("upgrade youjing four")
	local isok=0
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 120 then
			isok=0
			kill()
			jdwlLog("upgrade youjing four overtime")
			quyoujing()
			tt=os.time()				
		elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("upgrade youjing four:finish")
			break
		--条件不够误点建筑物
		elseif  (DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) or DmFindPic("5ji_u.bmp",80,159,271,179,286))and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y)	
			isok=1							
		--点击免费
		elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("yjmf4_u.bmp",85,465,366,506,414,0xffffff) then
			click(x,y)
			sleep(3500)
		--第二排第二块油井升级标志
		elseif DmFindPic("yj4sj_u.bmp",80,588,327,655,375) then
			click(x,y) sleep(1000)	
		--第二排第二块油井
		elseif DmFindPic("youjingweizhi_u.bmp",85,724,177,750,202) or DmFindPic("youjingweizhi1_u.bmp",85,730,207,745,222) then--562,366
			click(x-170,y+180)
		--如果为空地则建造农田
		elseif DmFindPic("you_u.bmp",80,847,329,862,341) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
			click(x,y)
		elseif DmFindPic("you_u.bmp",80,847,329,862,341)==false and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then--759,454
			click(x-270,y-110)
		--说明栏建造
		elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
			click(x,y)			
			local tt=os.time()
			while os.difftime(os.time(),tt) < 3 do
				if DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("yjmf4_u.bmp",85,465,366,506,414,0xffffff) then
					click(x,y)sleep(500)
				end
			end
		--详细的升级按钮
		elseif DmFindPic("ntdj4_u.bmp",85,161,273,176,284) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y) sleep(1500)
			isok=1
		elseif DmFindPic("ntdj4_u.bmp",85,161,273,176,284)==false and DmFindPic("xia_u.bmp",85,160,359,173,369) and DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
			click(x,y)	jdwlLog("shengji1_u")
			sleep(1500)			
		else
			sleep(1000)
			duihua()
			connect()
		end		
	end
end

function youjingfive()
	jdwlLog("upgrade youjing five")
	local isok=0
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 120 then
			isok=0
			kill()
			jdwlLog("upgrade youjing five overtime")
			quyoujing()
			tt=os.time()				
		elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("upgrade youjing five:finish")
			break
		--条件不够误点建筑物
		elseif  (DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) or DmFindPic("5ji_u.bmp",80,159,271,179,286)) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y)	
			isok=1					
		--点击免费
		elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("yjmf5_u.bmp",85,528,254,552,278,0xffffff) then
			click(x,y)
			sleep(3500)
		--第二排第三块油井升级标志
		elseif DmFindPic("yj5sj_u.bmp",80,651,217,713,257) then
			click(x,y) sleep(1000)	
		--第二排第三块油井
		elseif DmFindPic("youjingweizhi_u.bmp",85,724,177,750,202) or DmFindPic("youjingweizhi1_u.bmp",85,730,207,745,222) then--617,253
			click(x-120,y+60)
		--如果为空地则建造农田
		elseif DmFindPic("you_u.bmp",80,847,329,862,341) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
			click(x,y)
		elseif DmFindPic("you_u.bmp",80,847,329,862,341)==false and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then--759,454
			click(x-270,y-110)
		--说明栏建造
		elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
			click(x,y)			
			local tt=os.time()
			while os.difftime(os.time(),tt) < 3 do
				if DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("yjmf4_u.bmp",85,465,366,506,414,0xffffff) then
					click(x,y)sleep(500)
				end
			end
		--详细的升级按钮
		elseif DmFindPic("ntdj4_u.bmp",85,161,273,176,284) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y) sleep(1500)
			isok=1
		elseif DmFindPic("ntdj4_u.bmp",85,161,273,176,284)==false and DmFindPic("xia_u.bmp",85,160,359,173,369) and DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
			click(x,y)	jdwlLog("shengji1_u")
			sleep(1500)			
		else
			sleep(1000)
			duihua()
			connect()
		end		
	end
end

--去收容所
function qusrs()
	jdwlLog("go to srs")
	yuandian()
	local tt=os.time()
	while true do
		baojing()
		if os.difftime(os.time(),tt)>90 then
			kill()
			jdwlLog("go to srs overtime")
			yuandian()
			tt=os.time()
		--到达收容所位置
		elseif DmFindPic("srswz_u.bmp",80,690,523,699,534) then
			jdwlLog("go to srs finish")
			break
		elseif DmFindPic("youjingweizhi_u.bmp",85,724,177,750,202) then
			myMove_UD(802,265,802,195,4)
		elseif DmFindPic("yuandian_u.bmp",85,777,502,790,515) or DmFindPic("nongtianweizhi_u.bmp",85,360,502,370,513) or DmFindPic("ntwz1_u.bmp",80,367,514,377,527) then
			myMove_UD(693,582,693,142,4)sleep(1000)
		else
			sleep(1000)
			duihua()
			connect()
		end
	end	
end

--建筑油井下方的收容所
function shourongsuo()
	jdwlLog("build srs")
	qusrs()	
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 120 then
			kill()
			jdwlLog("build srs overtime")
			qusrs()
			tt=os.time()
		--寻找空地修建收容所/第一排第一个空地
		elseif DmFindPic("srs1_u.bmp",80,574,410,585,420) then
			click(x+20,y) sleep(1000)
		--第一排第二个空地
		elseif DmFindPic("srs2_u.bmp",80,633,305,643,319) then
			click(x+20,y) sleep(1000)
		--第一排第三个空地
		elseif DmFindPic("srs3_u.bmp",80,695,198,706,212) then
			click(x+20,y) sleep(1000)
		--第二排第一个空地
		elseif DmFindPic("srs4_u.bmp",80,748,375,760,388) then
			click(x+20,y) sleep(1000)
		--第二排第二个空地
		elseif DmFindPic("srs5_u.bmp",80,810,263,820,275) then
			click(x+20,y) sleep(1000)
		--建筑收容所
		elseif DmFindPic("shou_u.bmp",85,846,339,862,354) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
			click(x,y)
			sleep(1000)
		elseif DmFindPic("shou_u.bmp",85,846,339,862,354)==false and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then--757,200
			click(x-273,y-142)	
			sleep(1000)
		--说明栏建造按钮
		elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
			click(x,y)	jdwlLog("jianzao1_u")
			sleep(1000)			
			local tt=os.time()
			while os.difftime(os.time(),tt) < 4 do
				if DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("srsmf1_u.bmp",85,519,419,547,442,0xffffff) then
					click(x,y)sleep(1000)
				elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("srsmf2_u.bmp",80,578,314,608,339,0xffffff) then
					click(x,y)sleep(1000)
				elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("srsmf3_u.bmp",85,641,213,669,236,0xffffff) then
					click(x,y)sleep(1000)
				elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("srsmf4_u.bmp",85,694,384,724,410,0xffffff) then
					click(x,y)sleep(1000)	
				elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("srsmf5_u.bmp",85,755,251,781,275,0xffffff) then
					click(x,y)sleep(1000)
				end
			end
		--五块空地建满了
		elseif DmFindPic("srswc_u.bmp",80,797,264,809,279) and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("build srs:finish")
			break
		else
			sleep(1000)
			duihua()
			connect()
		end		
	end
end

--当前建筑到达5级
function wuji()
	if DmFindPic("dangqianwuji_u.bmp",80,160,273,178,286) then
		return true
	else
		return false
	end
end

function issrs()
	if srsone==1 and srstwo==1 and srsthree==1 and srsfour==1 and srsfive==1 then
		return true
	else
		return false
	end
end

--升级油井下方收容所的等级
function srsshengji()
	if issrs()==false then
		jdwlLog("shengjikongdione")
		qusrs()
		sjsrsone()
		sjsrstwo()
		sjsrsthree()
		sjsrsfour()
		sjsrsfive()
	end
end

srsone=0
function sjsrsone()
	jdwlLog("upgrade srs one")
	local isok=0
	local tt=os.time()
	if srsone==0 then
		while true do
			baojing()
			if os.difftime(os.time(),tt) > 120 then
				kill()
				jdwlLog("upgrade srs one overtime")
				qusrs()
				tt=os.time()
				isok=0		
			--有其他东西暂时不能升级
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgrade srs one:finish")
				break
			--免费
			elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("mfsrs1_u.bmp",85,522,427,549,450,0xffffff) then
				click(x,y)sleep(1000)
			--在升级了
			elseif DmFindPic("zaishengji_u.bmp",85,621,451,652,480) then
				jdwlLog("upgrade srs one:finish")
				break					
			elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
				click(x,y)
			elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
				click(x-570,y+192)
				isok=1			
			--下一等级为7
			--[[elseif DmFindPic("7_u.bmp",80,625,275,643,289) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then--]]
			elseif DmFindPic("6_u.bmp",85,160,272,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then		
				click(x,y)
				isok=1
			--展开之后升级按钮
			elseif DmFindPic("sjsrs1_u.bmp",85,645,362,682,395) then
				click(x,y)sleep(1000)			
			--点击第一排第一个收容所
			elseif DmFindPic("srswz_u.bmp",80,690,523,699,534) then--612,416
				click(x-80,y-110)sleep(1000)	
			elseif wuji() then-- 160,273 38,613
				click(x-120,y+340)
				isok=1
				srsone=1				
			elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
				click(x,y) sleep(1000)		
			--不能升级
			elseif DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1
			--建筑收容所
			elseif DmFindPic("shou_u.bmp",85,846,339,862,354) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
				click(x,y)
				sleep(1000)
			elseif DmFindPic("shou_u.bmp",85,846,339,862,354)==false and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then--757,200
				click(x-273,y-142)	
				sleep(1000)
			--说明栏建造
			elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
				click(x,y)						
			else
				duihua()
				connect()
			end
		end
	end	
end

srstwo=0
function sjsrstwo()
	jdwlLog("upgrade srs two")
	local isok = 0
	local tt=os.time()
	if srstwo==0 then
		while true do
			baojing()
			if os.difftime(os.time(),tt) > 120 then
				kill()
				jdwlLog("upgrade srs two overtime")
				qusrs()
				tt=os.time()
				isok=0				
			--有其他东西暂时不能升级
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgrade srs two:finish")
				break
			elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
				click(x,y)
			elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
				click(x-570,y+192)
				isok=1			
			--下一等级为7
			--[[elseif DmFindPic("7_u.bmp",80,625,275,643,289) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then--]]
			elseif DmFindPic("6_u.bmp",85,160,272,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then		
				click(x,y)
				isok=1	
			--免费
			elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("mfsrs2_u.bmp",85,583,325,606,347,0xffffff) then
				click(x,y)sleep(1000)			
			--在升级了
			elseif DmFindPic("zaishengji_u.bmp",85,681,349,712,377) then
				jdwlLog("upgrade srs two:finish")
				break		
			--展开之后升级按钮
			elseif DmFindPic("sjsrs2_u.bmp",80,704,250,749,295) then
				click(x,y)sleep(1000)				
			--点击第一排第二个收容所
			elseif DmFindPic("srswz_u.bmp",80,690,523,699,534) then--669,309
				click(x-20,y-210)sleep(1000)
			elseif wuji() then-- 160,273 38,613
				click(x-120,y+340)
				isok=1		
				srstwo=1					
			elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
				click(x,y) sleep(1000)			
			--不能升级
			elseif DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1
			--建筑收容所
			elseif DmFindPic("shou_u.bmp",85,846,339,862,354) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
				click(x,y)
				sleep(1000)
			elseif DmFindPic("shou_u.bmp",85,846,339,862,354)==false and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then--757,200
				click(x-273,y-142)	
				sleep(1000)
			--说明栏建造
			elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
				click(x,y)								
			else
				duihua()
				connect()
			end	
		end
	end	
end

srsthree=0
function sjsrsthree()
	jdwlLog("upgrade srs three")
	local isok=0
	local tt=os.time()
	if srsthree==0 then
		while true do
			baojing()
			if os.difftime(os.time(),tt) > 120 then
				kill()
				jdwlLog("upgrade srs three overtime")
				qusrs()
				tt=os.time()
				isok=0					
			--有其他东西暂时不能升级
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgrade srs three:finish")
				break
			elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
				click(x,y)
			elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
				click(x-570,y+192)
				isok=1			
			--下一等级为7
			--[[elseif DmFindPic("7_u.bmp",80,625,275,643,289) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then--]]
			elseif DmFindPic("6_u.bmp",85,160,272,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then		
				click(x,y)
				isok=1	
			--免费
			elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("mfsrs3_u.bmp",85,643,220,666,244,0xffffff) then
				click(x,y)sleep(1000)			
			--在升级了
			elseif DmFindPic("zaishengji_u.bmp",85,742,246,775,274) then
				jdwlLog("upgrade srs three:finish")
				break		
			--展开之后升级按钮
			elseif DmFindPic("sjsrs3_u.bmp",85,770,156,808,190) then
				click(x,y)sleep(1000)				
			--点击第一排第三个收容所
			elseif DmFindPic("srswz_u.bmp",80,690,523,699,534) then--735,210
				click(x+45,y-310)sleep(1000)
			elseif wuji() then-- 160,273 38,613
				click(x-120,y+340)
				isok=1		
				srsthree=1						
			elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
				click(x,y) sleep(1000)		
			--不能升级
			elseif DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1
			--建筑收容所
			elseif DmFindPic("shou_u.bmp",85,846,339,862,354) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
				click(x,y)
				sleep(1000)
			elseif DmFindPic("shou_u.bmp",85,846,339,862,354)==false and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then--757,200
				click(x-273,y-142)	
				sleep(1000)
			--说明栏建造
			elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
				click(x,y)								
			else
				duihua()
				connect()
			end	
		end	
	end	
end

srsfour=0
function sjsrsfour()
	jdwlLog("upgrade srs four")
	local isok=0
	local tt=os.time()
	if srsfour==0 then
		while true do
			baojing()
			if os.difftime(os.time(),tt) > 120 then
				kill()
				jdwlLog("upgrade srs four overtime")
				qusrs()
				tt=os.time()
				isok=0				
			--有其他东西暂时不能升级
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgrade srs four:finish")
				break	
			elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
				click(x,y)
			elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
				click(x-570,y+192)
				isok=1			
			--免费
			elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("mfsrs4_u.bmp",85,696,397,720,416,0xffffff) then
				click(x,y)sleep(1000)			
			--在升级了
			elseif DmFindPic("zaishengji_u.bmp",85,796,419,829,449) then
				jdwlLog("upgrade srs four:finish")
				break			
			--下一等级为7
			--[[elseif DmFindPic("7_u.bmp",80,625,275,643,289) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then--]]
			elseif DmFindPic("6_u.bmp",85,160,272,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then		
				click(x,y)
				isok=1					
			--展开之后升级按钮
			elseif DmFindPic("sjsrs4_u.bmp",85,820,329,869,371) then
				click(x,y)sleep(1000)				
			--点击第二排第一个收容所
			elseif DmFindPic("srswz_u.bmp",80,690,523,699,534) then--788,385
				click(x+90,y-150)sleep(1000)
			elseif wuji() then-- 160,273 38,613
				click(x-120,y+340)
				isok=1		
				srsfour=1					
			elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
				click(x,y) sleep(1000)			
			--不能升级
			elseif DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1
			--建筑收容所
			elseif DmFindPic("shou_u.bmp",85,846,339,862,354) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
				click(x,y)
				sleep(1000)
			elseif DmFindPic("shou_u.bmp",85,846,339,862,354)==false and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then--757,200
				click(x-273,y-142)	
				sleep(1000)
			--说明栏建造
			elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
				click(x,y)							
			else
				duihua()
				connect()
			end		
		end
	end	
end

srsfive=0
function sjsrsfive()
	jdwlLog("upgrade srs five")
	local isok=0
	local tt=os.time()
		while true do
			baojing()
			if os.difftime(os.time(),tt) > 120 then
				kill()
				jdwlLog("upgrade srs five overtime")
				qusrs()
				tt=os.time()
				isok=0			
			--有其他东西暂时不能升级
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgrade srs five:finish")
				break	
			elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
				click(x,y)
			elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
				click(x-570,y+192)
				isok=1			
			--免费
			elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("mfsrs5_u.bmp",85,757,282,783,305,0xffffff) then
				click(x,y)sleep(1000)			
			--在升级了
			elseif DmFindPic("zaishengji_u.bmp",85,858,310,890,335) then
				jdwlLog("upgrade srs five:finish")
				break			
			--下一等级为7
			--[[elseif DmFindPic("7_u.bmp",80,625,275,643,289) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then--]]
			elseif DmFindPic("6_u.bmp",85,160,272,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then		
				click(x,y)
				isok=1		
			--展开之后升级按钮
			elseif DmFindPic("sjsrs5_u.bmp",85,880,213,930,251) then
				click(x,y)sleep(1000)							
			--点击第二排第二个收容所
			elseif DmFindPic("srswz_u.bmp",80,690,523,699,534) then--808,268
				click(x+118,y-260)sleep(1000)
			elseif wuji() then-- 160,273 38,613
				click(x-120,y+340)
				isok=1		
				srsfive=1					
			elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
				click(x,y) sleep(1000)		
			--不能升级
			elseif DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1
			--建筑收容所
			elseif DmFindPic("shou_u.bmp",85,846,339,862,354) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
				click(x,y)
				sleep(1000)
			elseif DmFindPic("shou_u.bmp",85,846,339,862,354)==false and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then--757,200
				click(x-273,y-142)	
				sleep(1000)
			--说明栏建造
			elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
				click(x,y)							
			else
				duihua()
				connect()
			end		
		end
end

--解锁农田上方的空地用于建筑收容所 
function jiesuo()
	jdwlLog("unlock top of nongtian")
	quzp()
	local js=0
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 120 then
			kill()
			jdwlLog("unlock top of nongtian overtime")
			quzp()
			tt=os.time()	
		--解锁按钮
		elseif DmFindPic("jiesuo_u.bmp",85,1084,344,1097,355) then
			click(x,y)	jdwlLog("jiesuo_u") sleep(5000)
			js=1
		--点击空地树林
		elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPic("huangdi_u.bmp",80,485,341,497,355) then
			click(x,y)
		elseif (js==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589)) or DmFindPic("tubiao1_u.bmp",85,635,484,696,550) then
			jdwlLog("unlock top of nongtian:finish")
			break
		elseif DmFindPic("huangdi_u.bmp",80,485,341,497,355)==false and DmFindPic("jiujiweizhi1_u.bmp",80,579,490,588,502) then
			jdwlLog("unlock top of nongtian:finish")
			break
		else
			sleep(1000)
			duihua()
			connect()
		end			
	end
end

--去空地二的急救帐篷
function quzp()
	yuandian()
	jdwlLog("go to zp")
	local tt=os.time()
	while true do
		baojing()
		if os.difftime(os.time(),tt) > 90 then
			kill()
			jdwlLog("go to nongtian overtime")
			yuandian()			
			tt=os.time()
		elseif DmFindPic("yuandian_u.bmp",85,777,502,790,515) then
			myMove_UD(693,582,693,130,4)sleep(1000)
		--移到位置了
		elseif DmFindPic("jiujiweizhi_u.bmp",80,365,507,375,517) then
			myMove_RL(362,509,512,509,4)
		elseif DmFindPic("jiujiweizhi1_u.bmp",80,579,490,588,502) then
			jdwlLog("go to zp finish")
			break	
		else
			sleep(1000)
			duihua()
			connect()			
		end
	end
end

--修建急救帐篷
function zhangpeng()
	jdwlLog("build aid")
	quzp()
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 240 then
			kill()
			jdwlLog("build aid overtime")
			quzp()
			tt=os.time()
		--建筑急救帐篷
		elseif DmFindPic("jijiu_u.bmp",85,845,313,865,324) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
			click(x,y) 
			sleep(1000)
		elseif DmFindPic("jijiu_u.bmp",85,845,313,865,324)==false and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then--757,200
			click(x-273,y-142)	
			sleep(1000)		
		--第一排第一个空地
		elseif DmFindPic("jjzp1_u.bmp",80,347,349,357,367) then
			click(x+20,y) sleep(1000)
		--第一排第二个空地
		elseif DmFindPic("jjzp2_u.bmp",80,399,252,410,266) then
			click(x+20,y) sleep(1000)  
		--第一排第三个空地
		elseif DmFindPic("jjzp3_u.bmp",80,445,153,456,167) then
			click(x+20,y) sleep(1000)
		--第二排第一个空地.
		elseif DmFindPic("jjzp4_u.bmp",80,389,475,402,493) then
			click(x+20,y) sleep(1000)
		--第二排第二个空地	
		elseif DmFindPic("jjzp5_u.bmp",80,440,365,452,376) then
			click(x+20,y) sleep(1000)
		--说明栏建造按钮
		elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
			click(x,y)	jdwlLog("jianzao1_u")	
			sleep(2000)	
			local tt=os.time()
			while os.difftime(os.time(),tt) < 3 do
				--第一排第一个急救帐篷的免费
				if DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("jjmf1_u.bmp",85,291,339,321,364,0xffffff) then
					click(x,y)sleep(1000)
				elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("jjmf2_u.bmp",85,346,244,372,265,0xffffff) then
					click(x,y)sleep(1000)
				elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("jjmf3_u.bmp",85,391,165,417,189,0xffffff) then
					click(x,y)sleep(1000)
				elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and  DmFindPicFuzzy("jjmf4_u.bmp",85,335,485,364,511,0xffffff) then
					click(x,y)sleep(1000)
				elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and  DmFindPicFuzzy("jjmf5_u.bmp",85,386,378,413,402,0xffffff) then
					click(x,y)sleep(1000)					
				end
			end	
		elseif (DmFindPic("jjzpwc_u.bmp",85,460,345,468,358) or DmFindPic("zaishengji_u.bmp",80,488,411,516,439))and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("build aid:finish")
			break
		else
			duihua()
			connect()
		end	
	end
end

function iszp()
	if zpone==1 and zptwo==1 and zpthree==1 and zpfour==1 and zpfive==1 then
		return true
	else
		return false
	end
end

--升级空地二全部帐篷
function zpshengji()
	if iszp()==false then
		jdwlLog("shengjikongtwo")
		quzp()
		sjzpone()
		sjzptwo()
		sjzpthree()
		sjzpfour()
		sjzpfive()
	end
end
zpone=0
function sjzpone()
	jdwlLog("upgrade aid one")
	local isok=0
	local tt=os.time()
	if zpone==0 then
		while true do
			baojing()
			if os.difftime(os.time(),tt) > 90 then
				kill()
				jdwlLog("upgrade aid one overtime")
				quzp()
				tt=os.time()
				isok=0	
				break		
			--在升级了
			elseif DmFindPic("zaishengji_u.bmp",85,391,395,422,424) then
				jdwlLog("upgrade aid one:finish")
				break						
			--有其他东西暂时不能升级
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgrade aid one:finish")
				break
			elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
				click(x,y)
			elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
				click(x-570,y+192)
				isok=1			
			--下一等级为7
			--[[elseif DmFindPic("7_u.bmp",80,625,275,643,289) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then--]]
			elseif DmFindPic("6_u.bmp",85,160,272,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then		
				click(x,y)
				isok=1			
			--展开之后升级按钮
			elseif DmFindPic("sjzp1_u.bmp",80,429,351,463,376) then
				click(x,y)sleep(1000)			
			--点击第一排第一个帐篷
			elseif DmFindPic("jiujiweizhi1_u.bmp",80,579,490,588,502) then--356,345
				click(x-223,y-145)sleep(1000)
			--免费
			elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("mfzp1_u.bmp",85,312,339,338,360,0xffffff) then
				click(x,y)sleep(1000)
			elseif wuji() then-- 160,273 38,613
				click(x-120,y+340)
				isok=1
				zpone=1					
			elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
				click(x,y) sleep(1000)					
			--不能升级
			elseif DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1
			--需要建造
			--建筑急救帐篷
			elseif DmFindPic("jijiu_u.bmp",85,846,349,861,364) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
				click(x,y) 
				sleep(1000)
			elseif DmFindPic("jijiu_u.bmp",85,846,349,861,364)==false and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then--757,200
				click(x-273,y-142)	
				sleep(1000)		
			--说明栏建造
			elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
				click(x,y)
			else
				duihua()
				connect()
			end
		end	
	end	
end

zptwo=0
function sjzptwo()
	jdwlLog("upgrade aid two")
	local isok=0
	local tt=os.time()
	if zptwo==0 then
		while true do
			baojing()
			if os.difftime(os.time(),tt) > 90 then
				kill()
				jdwlLog("upgrade aid two overtime")	
				quzp()
				tt=os.time()
				isok=0			
			--有其他东西暂时不能升级
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgrade aid two:finish")
				break
			elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
				click(x,y)
			elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
				click(x-570,y+192)
				isok=1			
			--免费
			elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("mfzp2_u.bmp",85,367,242,390,264,0xffffff) then
				click(x,y)sleep(1000)
			--在升级了
			elseif DmFindPic("zaishengji_u.bmp",85,447,298,477,325) then
				jdwlLog("upgrade aid two:finish")
				break					
			--下一等级为7
			--[[elseif DmFindPic("7_u.bmp",80,625,275,643,289) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then--]]
			elseif DmFindPic("6_u.bmp",85,160,272,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then		
				click(x,y)
				isok=1			
			--展开之后升级按钮
			elseif DmFindPic("sjzp2_u.bmp",85,479,245,522,286) then
				click(x,y)sleep(1000)			
			--点击第一排第二个帐篷
			elseif DmFindPic("jiujiweizhi1_u.bmp",80,579,490,588,502) then--414,240
				click(x-165,y-250)sleep(1000)
			elseif wuji() then-- 160,273 38,613
				click(x-120,y+340)
				isok=1
				zptwo=1					
			elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
				click(x,y) sleep(1000)					
			--不能升级
			elseif DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1
			--建筑急救帐篷
			elseif DmFindPic("jijiu_u.bmp",85,846,349,861,364) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
				click(x,y) 
				sleep(1000)
			elseif DmFindPic("jijiu_u.bmp",85,846,349,861,364)==false and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then--757,200
				click(x-273,y-142)	
				sleep(1000)		
			--说明栏建造
			elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
				click(x,y)			
			else
				duihua()
				connect()
			end
		end	
	end	
end

zpthree=0
function sjzpthree()
	jdwlLog("upgrade aid three")
	local isok=0
	local tt=os.time()
	if zpthree==0 then
		while true do
			baojing()
			if os.difftime(os.time(),tt) > 90 then
				kill()
				jdwlLog("upgrade aid three overtime")
				quzp()
				tt=os.time()
				isok=0				
			--有其他东西暂时不能升级
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgrade aid three:finish")
				break
			elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
				click(x,y)
			elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
				click(x-570,y+192)
				isok=1			
			--下一等级为7
			--[[elseif DmFindPic("7_u.bmp",80,625,275,643,289) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then--]]
			elseif DmFindPic("6_u.bmp",85,160,272,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then		
				click(x,y)
				isok=1			
			--免费
			elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("mfzp3_u.bmp",85,414,142,437,163,0xffffff) then
				click(x,y)sleep(1000)
			--在升级了
			elseif DmFindPic("zaishengji_u.bmp",85,492,196,521,226) then
				jdwlLog("upgrade aid three")
				break					
			--展开之后升级按钮
			elseif DmFindPic("sjzp3_u.bmp",85,525,151,564,185) then
				click(x,y)sleep(1000)			
			--点击第一排第三个帐篷
			elseif DmFindPic("jiujiweizhi1_u.bmp",80,579,490,588,502) then--464,149
				click(x-115,y-340)sleep(1000)
			elseif wuji() then-- 160,273 38,613
				click(x-120,y+340)
				isok=1
				zpthree=1			
			elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
				click(x,y) sleep(1000)						
			--不能升级
			elseif DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1
			--建筑急救帐篷
			elseif DmFindPic("jijiu_u.bmp",85,846,349,861,364) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
				click(x,y) 
				sleep(1000)
			elseif DmFindPic("jijiu_u.bmp",85,846,349,861,364)==false and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then--757,200
				click(x-273,y-142)	
				sleep(1000)		
			--说明栏建造
			elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
				click(x,y)				
			else
				duihua()
				connect()
			end
		end		
	end
end

zpfour=0
function sjzpfour()
	jdwlLog("upgrade four")
	local isok=0
	local tt=os.time()
	if zpfour==0 then
		while true do
			baojing()
			if os.difftime(os.time(),tt) > 90 then
				kill()
				jdwlLog("upgrade aid four overtime")
				quzp()
				tt=os.time()
				isok=0			
			--有其他东西暂时不能升级
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgrade four:finish")
				break
			elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
				click(x,y)
			elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
				click(x-570,y+192)
				isok=1			
			--免费
			elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and  DmFindPicFuzzy("jjmf4_u.bmp",85,335,485,364,511,0xffffff) then
				click(x,y)sleep(1000)			
			--在升级了
			elseif DmFindPic("zaishengji_u.bmp",85,440,521,467,550) then
				jdwlLog("upgrade four:finish")
				break						
			--下一等级为7
			--[[elseif DmFindPic("7_u.bmp",80,625,275,643,289) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then--]]
			elseif DmFindPic("6_u.bmp",85,160,272,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then		
				click(x,y)
				isok=1			
			--展开之后升级按钮
			elseif DmFindPic("sjzp4_u.bmp",85,473,472,516,507) then
				click(x,y)sleep(1000)			
			--点击第二排第一个帐篷
			elseif DmFindPic("jiujiweizhi1_u.bmp",80,579,490,588,502) then--407,467
				click(x-170,y-20)sleep(1000)
			elseif wuji() then-- 160,273 38,613
				click(x-120,y+340)
				isok=1
				zpfour=1						
			elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
				click(x,y) sleep(1000)				
			--不能升级
			elseif DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1
			--建筑急救帐篷
			elseif DmFindPic("jijiu_u.bmp",85,846,349,861,364) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
				click(x,y) 
				sleep(1000)
			elseif DmFindPic("jijiu_u.bmp",85,846,349,861,364)==false and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then--757,200
				click(x-273,y-142)	
				sleep(1000)		
			--说明栏建造
			elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
				click(x,y)				
			else
				duihua()
				connect()
			end
		end			
	end
end

zpfive=0
function sjzpfive()
	jdwlLog("upgrade five")
	local isok=0
	local tt=os.time()
	if zpfive== 0 then
		while true do
			baojing()
			if os.difftime(os.time(),tt) > 90 then
				kill()
				jdwlLog("upgrade aid five overtime")
				quzp()
				tt=os.time()
				isok=0			
			--有其他东西暂时不能升级
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgrade five:finish")
				break
			elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
				click(x,y)
			elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
				click(x-570,y+192)
				isok=1			
			--免费
			elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("jjmf5_u.bmp",85,386,378,413,402,0xffffff) then
				click(x,y)sleep(1000)
			--在升级了
			elseif DmFindPic("zaishengji_u.bmp",85,487,412,517,439) then
				jdwlLog("upgrade five:finish")
				break					
			--下一等级为7
			--[[elseif DmFindPic("7_u.bmp",80,625,275,643,289) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then--]]
			elseif DmFindPic("6_u.bmp",85,160,272,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then		
				click(x,y)
				isok=1			
			--展开之后升级按钮
			elseif DmFindPic("sjzp5_u.bmp",85,522,361,561,398) then
				click(x,y)sleep(1000)			
			--点击第一排第二个帐篷
			elseif DmFindPic("jiujiweizhi1_u.bmp",80,579,490,588,502) then--454,349
				click(x-125,y-140)sleep(1000)	
			elseif wuji() then-- 160,273 38,613
				click(x-120,y+340)
				isok=1
				zpfive=1					
			elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
				click(x,y) sleep(1000)					
			--不能升级
			elseif DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1
			--建筑急救帐篷
			elseif DmFindPic("jijiu_u.bmp",85,846,349,861,364) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
				click(x,y) 
				sleep(1000)
			elseif DmFindPic("jijiu_u.bmp",85,846,349,861,364)==false and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then--757,200
				click(x-273,y-142)	
				sleep(1000)		
			--说明栏建造
			elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
				click(x,y)				
			else
				duihua()
				connect()
			end
		end	
	end
end

--最下方空地再修建两个收容所
function lastzhangpeng()
	jdwlLog("build last aid")
	qunongtian()	
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt) > 90 then
			kill()
			jdwlLog("build last aid overtime")
			qunongtian()
			tt=os.time()
		--建筑急救帐篷
		elseif DmFindPic("jijiu_u.bmp",85,845,313,865,324) and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then
			click(x,y) 
			sleep(1000)
		elseif DmFindPic("jijiu_u.bmp",85,845,313,865,324)==false and DmFindPic("jianzao_u.bmp",85,1030,344,1047,356) then--757,200
			click(x-273,y-142)	
			sleep(1000)		
		--第一排第一个空地
		elseif DmFindPic("zp1_u.bmp",80,730,328,770,377) then
			click(x,y) sleep(1000)
		--第一排第二个空地	
		elseif DmFindPic("zp2_u.bmp",80,790,212,829,265) then
			click(x,y) sleep(1000)
		--说明栏建造按钮
		elseif DmFindPic("jianzao1_u.bmp",80,1050,203,1065,215) then
			click(x,y)	jdwlLog("jianzao1_u")	
			sleep(1000)	
			local tt=os.time()
			while os.difftime(os.time(),tt) < 3 do
				--第一排第一个急救帐篷的免费
				if DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("zpmf1_u.bmp",85,628,351,655,373,0xffffff) then
					click(x,y)sleep(1000)
				elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("zpmf2_u.bmp",85,689,236,715,259,0xffffff) then
					click(x,y)sleep(1000)			
				end
			end
		elseif (DmFindPic("nongtianweizhi_u.bmp",85,360,502,370,513) or DmFindPic("ntwz1_u.bmp",80,367,514,377,527)) and DmFindPic("jie_u.bmp",85,1065,575,1080,589) and (DmFindPic("zp1_u.bmp",80,730,328,770,377)==false and DmFindPic("zp2_u.bmp",80,790,212,829,265)==false ) then
			jdwlLog("build last aid:finish")
			break			
		else
			sleep(1000)
			duihua()
			connect()
		end
	end
end

--前往第三块空地混合
function quhunhe()
	jdwlLog("go to hunhe")
	yuandian()
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt)>90 then
			kill()
			jdwlLog("go to hunhe overtime")
			tt=os.time()
		elseif DmFindPic("hunhewz_u.bmp",80,734,576,746,587) then
			jdwlLog("go to hunhe finish")
			break
		elseif DmFindPic("yuandian_u.bmp",85,777,502,790,515) then
			myMove_UD(808,608,808,48,4)sleep(500)
		else
			connect()
			duihua()
		end
	end
end

function ishunhe()
	if hhone==1 and hhtwo==1 and hhthree==1 and hhfour==1 and hhfive==1 then
		return true
	else
		return false
	end
end

--升级空地三的五个建筑
function hunheshengji()
	if ishunhe() == false then
		jdwlLog("shengjikongdisan")
		quhunhe()
		hunheone()
		hunhetwo()
		hunhethree()
		hunhefour()
		hunhefive()
	end
end

hhone=0
function hunheone()
	jdwlLog("upgarde kongdisan first")
	local isok=0
	local tt=os.time()
	if hhone==0 then
		while true do
			baojing()
			if os.difftime(os.time(),tt) > 90 then
				kill()
				jdwlLog("upgarde kongdisan first overtime")
				quhunhe()
				tt=os.time()
				isok=0			
			--有其他东西暂时不能升级
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgarde kongdisan first:finish")
				break
			elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
				click(x,y)
			--免费
			elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("mfsrs1_u.bmp",85,522,427,549,450,0xffffff) then
				click(x,y)sleep(1000)
			--在升级了
			elseif DmFindPic("zaishengji_u.bmp",85,676,365,703,392) then
				jdwlLog("upgarde kongdisan first:finish")
				break			
			elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
				click(x-570,y+192)
				isok=1			
			--下一等级为7
			elseif DmFindPic("6_u.bmp",85,160,272,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1			
			--展开之后升级按钮
			elseif DmFindPic("sjkd3_1_u.bmp",85,700,274,744,309) then
				click(x,y)sleep(1000)					
			--点击第一排第一个建筑
			elseif DmFindPic("hunhewz_u.bmp",80,734,576,746,587) then--634,318
				click(x-100,y-268)sleep(1000)	
			elseif wuji() then-- 160,273 38,613
				click(x-120,y+340)
				isok=1
				hhone=1								
			elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
				click(x,y) sleep(1000)					
			--不能升级
			elseif DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1
			else
				duihua()
				connect()
			end		
		end
	end
end

hhtwo=0
function hunhetwo()
	jdwlLog("upgarde kongdisan second")
	local isok=0
	local tt=os.time()
	if hhtwo==0 then
		while true do
			baojing()
			if os.difftime(os.time(),tt) > 90 then
				kill()
				jdwlLog("upgarde kongdisan second overtime")
				quhunhe()
				tt=os.time()
				isok=0				
			--有其他东西暂时不能升级
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgarde kongdisan second:finish")
				break
			elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
				click(x,y)
			elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
				click(x-570,y+192)
				isok=1			
			--下一等级为7
			elseif DmFindPic("6_u.bmp",85,160,272,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1			
			--免费
			elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("mfkd2_u.bmp",85,629,343,656,362,0xffffff) then
				click(x,y)sleep(1000)			
			--在升级了
			elseif DmFindPic("zaishengji_u.bmp",85,729,264,762,294) then
				jdwlLog("upgarde kongdisan second:finish")
				break	
			--展开之后升级按钮
			elseif DmFindPic("sjkd3_2_u.bmp",85,755,174,794,212) or DmFindPic("sjkd3_2_1_u.bmp",80,763,220,800,252) then
				click(x,y)sleep(1000)							
			--点击第一排第二个收容所
			elseif DmFindPic("hunhewz_u.bmp",80,734,576,746,587) then--696,212
				click(x-40,y-365)sleep(1000)
			elseif wuji() then-- 160,273 38,613
				click(x-120,y+340)
				isok=1
				hhtwo=1					
			elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
				click(x,y) sleep(1000)					
			--不能升级
			elseif DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1
			else
				duihua()
				connect()
			end		
		end	
	end
end

hhthree=0
function hunhethree()
	jdwlLog("upgarde kongdisan third")
	local isok=0
	local tt=os.time()
	if hhthree==0 then
		while true do
			baojing()
			if os.difftime(os.time(),tt) > 90 then
				kill()
				jdwlLog("upgarde kongdisan third overtime") 
				quhunhe()
				tt=os.time()
				isok=0			
			--有其他东西暂时不能升级
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgarde kongdisan third:finish")
				break
			elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
				click(x,y)
			elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
				click(x-570,y+192)
				isok=1			
			--下一等级为7
			elseif DmFindPic("6_u.bmp",85,160,272,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1			
			--免费
			elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("mfkd3_u.bmp",85,690,226,714,250,0xffffff) then
				click(x,y)sleep(1000)					
			--在升级了
			elseif DmFindPic("zaishengji_u.bmp",85,745,497,775,525) then
				jdwlLog("upgarde kongdisan third:finish")
				break				
			--展开之后升级按钮
			elseif DmFindPic("sjkd3_3_u.bmp",80,772,413,814,440) then--833,246
				click(x,y)sleep(1000)		
			--点击第二排第一个收容所
			elseif DmFindPic("hunhewz_u.bmp",80,734,576,746,587) then--706,451
				click(x-20,y-120)sleep(1000)
			elseif wuji() then-- 160,273 38,613
				click(x-120,y+340)
				isok=1
				hhthree=1					
			elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
				click(x,y) sleep(1000)					
			--不能升级
			elseif DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1
			else
				duihua()
			end		
		end	
	end
end

hhfour=0
function hunhefour()
	jdwlLog("upgrade kongdisan fourth")
	local isok=0
	local tt=os.time()
	if hhfour==0 then
		while true do
			baojing()
			if os.difftime(os.time(),tt) > 120 then
				kill()
				jdwlLog("upgrade kongdisan fourth overtime")
				quhunhe()
				tt=os.time()	
			--有其他东西暂时不能升级
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgarde kongdisan fourth:finish")
				break
			elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
				click(x,y)
			elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
				click(x-570,y+192)
				isok=1			
			--下一等级为7
			elseif DmFindPic("6_u.bmp",85,160,272,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1			
			--免费
			elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("mfkd3_1_u.bmp",85,642,474,673,497,0xffffff) then
				click(x,y)sleep(1000)	
			--在升级了
			elseif DmFindPic("zaishengji_u.bmp",85,806,375,840,405) then
				click(x,y)
				jdwlLog("upgarde kongdisan fourth:finish")
				break		
			--展开之后升级按钮
			elseif DmFindPic("sjkd3_4_u.bmp",80,836,328,881,361) then--833,246
				click(x,y)sleep(1000)					
			--点击第一排第二个收容所
			elseif DmFindPic("hunhewz_u.bmp",80,734,576,746,587) then--779,329
				click(x+40,y-250)sleep(1000)
			elseif wuji() then-- 160,273 38,613
				click(x-120,y+340)
				isok=1
				hhfour=1						
			elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
				click(x,y) sleep(1000)				
			--不能升级
			elseif DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1
			else
				duihua()
				connect()
			end		
		end		
	end
end

--去混合的最后一块空地
function qulast()
	jdwlLog("go to last")
	yuandian()
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt)>90 then
			kill()
			jdwlLog("go to last overtime")
			tt=os.time()
		elseif DmFindPic("lastwz_u.bmp",80,882,355,895,369) then
			jdwlLog("go to last finish")
			break
		elseif DmFindPic("yuandian_u.bmp",85,777,502,790,515) then
			myMove_UD(808,608,808,248,4)sleep(500)
		else
			connect()
			duihua()
		end
	end
end

hhfive=0

function hunhefive()
	jdwlLog("upgarde kongdisan fifth")
	local isok=0
	local tt=os.time()
	if hhfive==0 then
		qulast()
		while true do
			baojing()
			if os.difftime(os.time(),tt) > 120 then
				kill()
				jdwlLog("upgarde kongdisan fifth overtime")
				qulast()
				tt=os.time()			
			--有其他东西暂时不能升级
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgarde kongdisan fifth:finish")
				break	
			elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
				click(x,y)
			elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
				click(x-570,y+192)
				isok=1			
			--下一等级为7
			elseif DmFindPic("6_u.bmp",85,160,272,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1	
				jdwlLog("all building is ok!!!")	
			--免费
			elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("mfkd3_2_u.bmp",85,689,318,717,338,0xffffff) then
				click(x,y)sleep(1000)					
			--在升级了
			elseif DmFindPic("zaishengji_u.bmp",85,792,347,821,380) then
				jdwlLog("upgarde kongdisan fifth:finish")
				break	
			--展开之后升级按钮
			elseif DmFindPic("sjkd3_5_u.bmp",80,820,301,865,341) then--833,246
				click(x,y)sleep(1000)							
			--点击第一排第三个收容所
			elseif DmFindPic("lastwz_u.bmp",80,882,355,895,369) then--765,301
				click(x-117,y-55)sleep(1000)		
			elseif wuji() then-- 160,273 38,613
				click(x-120,y+340)
				isok=1
				hhfive=1				
			elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
				click(x,y) sleep(1000)	
			--最后一块到达5级
			elseif DmFindPic("5_u.bmp",80,159,270,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1				
			--不能升级
			elseif DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1
			else
				duihua()
				connect()
			end		
		end		
	end
end

--前往第三块空地混合
function quhunhe()
	jdwlLog("go to hunhe")
	yuandian()
	local tt=os.time()
	while true do
		if os.difftime(os.time(),tt)>90 then
			kill()
			jdwlLog("go to hunhe overtime")
			tt=os.time()
			yuandian()
		elseif DmFindPic("hunhewz_u.bmp",80,734,576,746,587) then
			jdwlLog("go to hunhe finish")
			break
		elseif DmFindPic("yuandian_u.bmp",85,777,502,790,515) then
			myMove_UD(808,608,808,48,4)sleep(500)
		else
			connect()
			duihua()
		end
	end
end



--滑动到左上角原点
function leftyuandian()
	jdwlLog("left yuandian")
	qiehuan()
	local tt=os.time()
	while true do
		baojing()
		if os.difftime(os.time(),tt) > 120 then
			kill()
			jdwlLog("left yuandian overtime")
			qiehuan()
			tt=os.time()
		--回家
		elseif DmFindPic("jia_u.bmp",85,1063,585,1075,601) then
			click(x,y)
		--找到固定点则表示滑动完成
		elseif DmFindPic("zuoyuandian_u.bmp",85,735,484,746,496) then
			jdwlLog("left yuandian:finish")
			break
		--如果看到世界图标则开始移动
		elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			myMove_UD(886,603,886,52,50)sleep(500)
			if DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				myMove_RL(134,320,931,320,50)sleep(500)
			end
		else
			sleep(500)
			duihua()
			connect()
		end
	end
end

--去广场
function quguangchang()
	jdwlLog("去广场")
	leftyuandian()
	local tt=os.time()
	while true do
		baojing()
		if os.difftime(os.time(),tt) > 120 then
			kill()
			jdwlLog("去广场超时")
			leftyuandian()
			tt=os.time()
		--沿x轴滑动
--[[		elseif DmFindPic("zuoyuandian_u.bmp",85,735,484,746,496)then
			myMove_RL(878,148,164,148,4)sleep(1000)	--]]
		elseif DmFindPic("zuoyuandian_u.bmp",85,724,475,751,503) or DmFindPic("zuoyuandian_u.bmp",85,735,484,746,496)then
			myMove_RL(783,196,183,196,4)sleep(1000)			
		elseif DmFindPic("guangchang_u.bmp",85,787,160,805,168) or DmFindPic("guangchang1_u.bmp",80,893,157,923,169) then
			jdwlLog("去广场完成")
			break
		else
			duihua()
			connect()
		end
	end
end

--判断是否招满28000兵
function isEnough()
	jdwlLog("isEnough")
	quguangchang()
	local tt=os.time()
	local ret=nil
	local isok=0
	local count=0
	while true do
		baojing()
		if os.difftime(os.time(),tt) > 60 then
			kill()
			jdwlLog("isEnough overtime")
			quguangchang()			
			tt=os.time()
		elseif isok==1 and count>5 and DmFindPicFuzzy("xiangqing_u.bmp",85,27,349,59,378,0xffffff)then	
			kill()
			count=0
		elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			return ret
		elseif isok==1 and DmFindPicFuzzy("xiangqing_u.bmp",85,27,349,59,378,0xffffff) then--39,619
			click(x+10,y+270)
			count=count+1
		elseif DmFindPic("guangchang1_u.bmp",80,893,157,923,169)then--825,113
			click(x+35,y-50)
		--部队详情
		elseif DmFindPicFuzzy("xiangqing_u.bmp",85,27,349,59,378,0xffffff) then	
			sleep(2000)
			if DmFindPic("13_u.bmp",85,124,389,137,404) --[[or DmFindPic("1_u.bmp",80,226,325,245,336)--]] then
				yiwan=1
				ret=true
				jdwlMsg("13000ok")
--[[			elseif DmFindPic("4_u.bmp",80,226,325,245,336) or DmFindPic("3_u.bmp",80,227,324,244,336) or DmFindPic("2_u.bmp",80,227,325,244,336) then
				yiwan=1
				ret=true
				jdwlMsg("13000ok")--]]				
			else
				ret=false
			end
			isok=1
		else
			duihua()
			connect()
		end
	end
end


--开餐
function kaican()
	jdwlLog("meal")
	leftyuandian()
	local tt=os.time()
	while true do
		baojing()
		if os.difftime(os.time(),tt) > 90 then
			kill()
			jdwlLog("meal overtime")
			leftyuandian()			
			tt=os.time()
			break
		--沿x轴滑动
		elseif DmFindPic("zuoyuandian_u.bmp",85,724,475,751,503) or DmFindPic("zuoyuandian_u.bmp",85,735,484,746,496) then
			myMove_RL(704,505,208,505,4)sleep(1000)
		--沿x轴滑动完成之后y轴滑动
		elseif DmFindPic("xiaoqiche_u.bmp",85,702,486,714,500) then
			myMove_UD(407,119,407,524,4)sleep(1000)
		--已经开餐
		elseif DmFindPic("zaishengji_u.bmp",85,625,361,651,393) or DmFindPic("zaishengji_u.bmp",85,624,363,654,392) then
			jdwlLog("meal:finish")
			break
		elseif DmFindPic("heikaican_u.bmp",85,635,370,665,401) then
			jdwlLog("meal:finish")
			break
		--点击开餐
		elseif DmFindPic("kaican_u.bmp",85,668,249,683,260) then
			click(x,y)sleep(2000)
		--滑动到餐厅开餐
		elseif DmFindPic("canting_u.bmp",85,564,363,577,375) then
			click(x,y)sleep(1000)
		else
			duihua()
			connect()
		end
	end
end


canting=0
--升级餐厅
function cantingshengji()
	if canting==0 then
		jdwlLog("upgrade restaurant")
		leftyuandian()
		local isok=0
		local tt=os.time()
		while true do
			baojing()
			if os.difftime(os.time(),tt) > 90 then
				kill()
				jdwlLog("upgrade restaurant overtime")
				leftyuandian()
				tt=os.time()
				break
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgrade restaurant:finish")
				break
			elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
				click(x,y)
			elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
				click(x-570,y+192)
				isok=1
			--下一等级为8	
			--[[elseif DmFindPic("8_u.bmp",80,627,275,643,287) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then--]]
			elseif DmFindPic("6_u.bmp",85,160,272,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then		
				click(x,y)	
				isok=1
			--在升级了
			elseif DmFindPic("zaishengji_u.bmp",85,624,363,654,392) then
				jdwlLog("upgrade restaurant:finish")
				break			
			--沿x轴滑动
			elseif DmFindPic("zuoyuandian_u.bmp",85,724,475,751,503) or DmFindPic("zuoyuandian_u.bmp",85,735,484,746,496) then
				myMove_RL(704,505,208,505,4)sleep(1000)
			--沿x轴滑动完成之后y轴滑动
			elseif DmFindPic("xiaoqiche_u.bmp",85,702,486,714,500) then
				myMove_UD(407,119,407,524,4)sleep(1000)
			--点击餐厅升级
			elseif DmFindPic("sjct_u.bmp",85,654,315,697,352) then
				click(x,y)sleep(2000)		
			--滑动到餐厅
			elseif DmFindPic("canting_u.bmp",85,564,363,577,375) then
				click(x,y)sleep(1000)
			elseif wuji() then-- 160,273 38,613
				click(x-120,y+340)
				isok=1
				canting=1				
			elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
				click(x,y) sleep(1000)		
			--如果开餐过程中升级会弹出提示
			elseif DmFindPic("jixu_u.bmp",85,692,446,704,456) then
				click(x,y)
			--下一等级为7
			elseif DmFindPic("7_u.bmp",80,625,275,643,289) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1				
			--不能升级
			elseif DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) and DmFindPic("fanhui_u.bmp",85,37,619,45,633)then
				click(x,y)
				isok=1			
			else
				duihua()
				connect()
			end
		end
	end
end

--升级仓库
function cangkushengji()
	jdwlLog("upgrade warehouse")
	leftyuandian()
	local tt=os.time()
	local isok=0
	while true do
		baojing()
		if os.difftime(os.time(),tt) > 90 then
			kill()
			jdwlLog("upgrade warehouse overtime")
			leftyuandian()
			tt=os.time()
		elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("upgrade warehouse:finish")
			break
		elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
			click(x,y)
		elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
			click(x-570,y+192)
			isok=1			
		--沿x轴滑动
		elseif DmFindPic("zuoyuandian_u.bmp",85,724,475,751,503) or DmFindPic("zuoyuandian_u.bmp",85,735,484,746,496) then
			myMove_RL(704,505,404,505,4)sleep(2000)			
		--仓库到达7级之后不需要再升级
--[[		elseif DmFindPic("8_u.bmp",80,627,275,643,287) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y)--]]
		elseif DmFindPic("6_u.bmp",85,160,272,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y)
			isok=1
		elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
			click(x,y) sleep(1000)			
		--在升级了
		elseif DmFindPic("zaishengji_u.bmp",85,661,217,691,244) then
			jdwlLog("upgrade warehouse:finish")
			break
		--仓库升级
		elseif DmFindPic("cksj_u.bmp",85,688,136,723,163) then
			click(x,y)sleep(1000)
		--滑动到固定位置点击仓库
		elseif DmFindPic("cangku_u.bmp",85,617,145,630,154) then
			click(x,y)sleep(1000)
		--不能升级
		elseif DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y)
			isok=1				
		else
			duihua()
			connect()
		end	
	end
end

changqiang=0
--升级城墙
function chengqiangshengji()
	if chengqiang==0 then
		jdwlLog("upgrade wall")
		quyoujing()
		local isok=0
		local tt=os.time()
		while true do
			baojing()
			if os.difftime(os.time(),tt) > 90 then
				kill()
				jdwlLog("upgrade wall overtime")
				quyoujing()			
				tt=os.time()
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgrade wall:finish")
				break
			--城墙到达6级之后不用升级
			elseif DmFindPic("6_u.bmp",85,160,272,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1
			elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
				click(x,y)
			elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
				click(x-570,y+192)
				isok=1			
	--[[		--下一等级为7
			elseif DmFindPic("8_u.bmp",80,627,275,643,287) and DmFindPic("fanhui_u.bmp",85,37,619,45,633)then
				click(x,y)
				isok=1	--]]
			--城墙在升级了
			elseif DmFindPic("zaishengji_u.bmp",85,235,375,265,403) then
				jdwlLog("upgrade wall:finish")
				break					
			--升级按钮
			elseif DmFindPic("cqsj_u.bmp",85,266,329,302,363) then
				click(x,y)
			elseif wuji() then-- 160,273 38,613
				click(x-120,y+340)
				isok=1			
				chengqiang=1				
			elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
				click(x,y) sleep(1000)
			--点击城墙
			elseif DmFindPic("chengqiang_u.bmp",85,290,338,305,348) then
				click(x,y)
			--不能升级
			elseif DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1					
			else
				duihua()
				connect()
			end
		end	
	end
end

jidi=0
--升级基地
function jidishengji()
	if jidi==0 then
		jdwlLog("upgrade base")
		leftyuandian()
		local tt=os.time()
		local isok=0
		while true do
			baojing()
			if os.difftime(os.time(),tt) > 90 then
				kill()
				jdwlLog("upgrade base overtime")
				leftyuandian()
				tt=os.time()
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgrade base:finish")
				break
			elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
				click(x,y)
			elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
				click(x-570,y+192)
				isok=1			
			--沿x轴滑动
			elseif DmFindPic("zuoyuandian_u.bmp",85,724,475,751,503) or DmFindPic("zuoyuandian_u.bmp",85,735,484,746,496) then
				myMove_UD(496,230,496,510,2)sleep(1000)
			--其他建筑还在升级中
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgrade base:finish")
				break
			--下一等级为7
			elseif DmFindPic("7_u.bmp",80,159,272,179,287) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1			
	--[[		elseif DmFindPic("8_u.bmp",80,627,275,643,287) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				jididengji=1
				isok=1		--]]	
			elseif wuji() then-- 160,273 38,613
				click(x-120,y+340)
				isok=1
				jidi=1				
			elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
				click(x,y) sleep(1000)			
			--展开之后升级按钮
			elseif DmFindPic("sjjd_u.bmp",85,728,299,764,333) then
				click(x,y)
			--在升级
			elseif DmFindPic("zaishengji_u.bmp",85,476,339,505,368) then
				jdwlLog("upgrade base:finish")
				break
			--点击基地
			elseif DmFindPic("jidi_u.bmp",85,653,349,664,361) then
				click(x,y)
			--条件不够误点建筑物
			elseif DmFindPic("tiaozhuan_u.bmp",85,749,142,761,150) and DmFindPic("fanhui_u.bmp",85,37,619,45,633)then
				click(x,y)		
				isok=1	
			--升级基地确定
			elseif DmFindPic("jidiqueding_u.bmp",85,692,336,705,347) then
				click(x,y)			
			--不能升级
			elseif DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1		
			--基地到6
			elseif DmFindPic("jididao6_u.bmp",80,464,484,483,504) then--28,616
				click(x-436,y+132)
				isok=1
			else
				duihua()
				connect()
			end
		end
	end
end

houqin=0
--升级后勤中心
function houqinshengji()
	jdwlLog("upgrade logistics")
	if houqin==0 then
		quyoujing()	
		local isok=0
		local tt=os.time()
		while true do
			baojing()
			if os.difftime(os.time(),tt)> 90 then
				kill()
				jdwlLog("upgrade logistics overtime")
				quyoujing()	
				tt=os.time()
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgrade logistics:finish")
				break
			elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
				click(x,y)
			elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
				click(x-570,y+192)
				isok=1			
			--下一等级为8
	--[[		elseif DmFindPic("8_u.bmp",80,627,275,643,287) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then--]]
			elseif DmFindPic("6_u.bmp",85,160,272,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1			
			elseif DmFindPic("zaishengji_u.bmp",85,594,425,625,456) then
				jdwlLog("upgrade logistics:finish")
				break				
			--从油井位置开始移动
			elseif DmFindPic("youjingweizhi_u.bmp",85,724,177,750,202) then
				myMove_RL(206,530,706,530,4)sleep(1000)
			--展开之后升级按钮
			elseif DmFindPic("sjhq_u.bmp",80,618,337,660,374) then
				click(x,y)sleep(1000)
			--移动到后勤中心点击
			elseif DmFindPic("houqin_u.bmp",85,577,367,589,382) then
				click(x,y)sleep(1000)
			elseif wuji() then-- 160,273 38,613
				click(x-120,y+340)
				isok=1
				houqin=1				
			elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
				click(x,y) sleep(1000)			
			--不能升级
			elseif DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1	
			else
				duihua()
				connect()
			end
		end
	end
end

keyan=0
--升级科研中心
function keyanshengji()
	if keyan==0 then
		jdwlLog("upgrade R&D")
		leftyuandian()
		local isok=0
		local tt=os.time()
		while true do
			baojing()
			if os.difftime(os.time(),tt) > 90 then
				kill()
				jdwlLog("upgrade R&D overtime")
				leftyuandian()
				tt=os.time()
				break
			--找到固定点则表示滑动完成
			elseif DmFindPic("zuoyuandian_u.bmp",85,724,475,751,503) or DmFindPic("zuoyuandian_u.bmp",85,735,484,746,496) then
				myMove_UD(866,54,866,604,4)sleep(500)
				myMove_UD(866,54,866,404,4)sleep(500)
			--军械库往下滑动
			elseif DmFindPic("junxieku_u.bmp",80,717,517,733,527) then
				myMove_RL(626,198,478,198,4)				
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("upgrade R&D:finish")
				break 
			elseif isok ==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then			
				click(x,y)
			elseif DmFindPic("cailiaobuzu_u.bmp",85,706,314,716,325) then	--104,577
				click(x-570,y+192)
				isok=1			
			--下一等级为7
			--[[elseif DmFindPic("7_u.bmp",80,625,275,643,289) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then--]]
			elseif DmFindPic("6_u.bmp",85,160,272,178,285) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1			
			elseif DmFindPic("jie_u.bmp",85,1065,575,1080,589) and DmFindPicFuzzy("keyanmianfei_u.bmp",85,560,324,594,349,0xffffff) then
				click(x,y)
			--展开之后升级按钮
			elseif DmFindPic("sjky_u.bmp",85,749,314,790,347) then
				click(x,y)sleep(1000)
			--免费

			elseif DmFindPic("zaishengji_u.bmp",85,722,354,751,386) or DmFindPic("zaiyanjiu_u.bmp",85,721,360,750,386) then
				jdwlLog("upgrade R&D:finish")
				break			
			--移动到科研中心点击
			elseif DmFindPic("keyan_u.bmp",85,657,260,668,271) then
				click(x,y)sleep(1000)
			elseif wuji() then-- 160,273 38,613
				click(x-120,y+340)
				isok=1
				keyan=1				
			elseif DmFindPic("shengji1_u.bmp",85,1046,205,1061,219) then
				click(x,y) sleep(1000)	
			--不能升级
			elseif DmFindPic("huishengji_u.bmp",85,1048,200,1061,217) and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
				click(x,y)
				isok=1	
			else
				duihua()
				connect()
			end
		end	
	end
end

xuanguadengji=0
--科研中心研究
function yanjiu()
	if xuanguadengji==0 then
		jdwlLog("research")
		leftyuandian()
		local count = 0
		local isok=0
		local tt=os.time()
		while true do
			baojing()
			if os.difftime(os.time(),tt) > 120 then
				kill()
				jdwlLog("research overtime")
				leftyuandian()
				tt=os.time()
			--找到固定点则表示滑动完成
			elseif DmFindPic("zuoyuandian_u.bmp",85,724,475,751,503) or DmFindPic("zuoyuandian_u.bmp",85,735,484,746,496) then
				myMove_UD(866,54,866,604,4)sleep(500)
				myMove_UD(866,54,866,404,4)sleep(500)
			--军械库往下滑动
			elseif DmFindPic("junxieku_u.bmp",80,717,517,733,527) then
				myMove_RL(626,198,478,198,4)
			elseif DmFindPic("zaishengji_u.bmp",85,722,354,751,386) or DmFindPic("zaiyanjiu_u.bmp",85,721,360,750,386) then
				jdwlLog("upgrade R&D:finish")
				break				
			--展开之后科研按钮
			elseif DmFindPic("kyyj_u.bmp",85,756,242,767,250) or DmFindPic("kyyj1_u.bmp",85,754,237,768,248) then
				click(x,y)sleep(1000)
			elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589)then
				jdwlLog("research:Not enough ")
				break
			elseif xuanguadengji==1 and  DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
				jdwlLog("research:10/10")
				break	
			--悬挂系统10/10
			elseif DmFindPic("xuangualv_u.bmp",80,227,348,243,363) then
				xuanguadengji=1
				click(x-185,y-300)
				isok=1
			--移动到科研中心点击
			elseif DmFindPic("keyan_u.bmp",80,657,260,668,271) or DmFindPic("keyan1_u.bmp",80,635,312,649,325) then
				click(x,y)sleep(1000)
			--城市发展
			elseif DmFindPic("csfz_u.bmp",85,471,168,493,182) then
				click(x,y)sleep(1000)
			--面板上的研究按钮
			elseif DmFindPic("yj_u.bmp",85,507,231,528,243) then
				click(x,y)sleep(1000)
			--悬挂系统
			elseif isok==0 and DmFindPic("xgxt_u.bmp",80,228,350,243,362) then--182,328
				click(x,y)sleep(1000)
			--没有可以研究的
			elseif DmFindPic("shi_u.bmp",85,31,330,50,349) then
				click(x,y)sleep(1000)
				isok=1
			elseif count > 5 and DmFindPic("guanbi_u.bmp",85,31,607,59,622) then
				kill()
				jdwlLog("yanfa:finish")
				break	
			elseif DmFindPic("guanbiyanjiu_u.bmp",85,33,41,50,57) then
				click(x,y)sleep(1000)
				isok=1
				count = count + 1
			else
				duihua()
				connect()
			end	
		end
	end
end

--科研中心军事研究
function junshi()
	jdwlLog("junshi")
	leftyuandian()
	local isok=0
	local tt=os.time()
	local juntuandengji=0
	while true do
		baojing()
		if os.difftime(os.time(),tt) > 120 then
			kill()
			jdwlLog("junshi overtime")
			leftyuandian()
			tt=os.time()
		--找到固定点则表示滑动完成
		elseif DmFindPic("zuoyuandian_u.bmp",85,724,475,751,503) or DmFindPic("zuoyuandian_u.bmp",85,735,484,746,496) then
			myMove_UD(866,54,866,604,4)sleep(500)
			myMove_UD(866,54,866,404,4)sleep(500)
		--军械库往下滑动
		elseif DmFindPic("junxieku_u.bmp",80,717,517,733,527) then
			myMove_RL(626,198,478,198,4)
		--展开之后科研按钮
		elseif DmFindPic("kyyj_u.bmp",85,499,312,508,321) or DmFindPic("kyyj1_u.bmp",85,754,237,768,248) then
			click(x,y)sleep(1000)
		elseif DmFindPic("zaishengji_u.bmp",85,722,354,751,386) or DmFindPic("zaiyanjiu_u.bmp",85,721,360,750,386) then
			jdwlLog("junshi:finish")
			break
		elseif  isok == 1 and DmFindPic("guanbiyanjiu_u.bmp",85,33,41,50,57) then
			click(x,y)
		elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("junshi :Not enough")	
			break
		elseif juntuandengji==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("junshi:10/10")
			break
		--军团学习到1/1
		elseif juntuandengji==1 and DmFindPic("guanbi_u.bmp",85,31,607,59,622) then
			click(x,y)
		elseif DmFindPic("jtlv_u.bmp",85,983,332,999,346) then
			juntuandengji=1
		--移动到科研中心点击
		elseif DmFindPic("keyan_u.bmp",80,657,260,668,271) or DmFindPic("keyan1_u.bmp",80,635,312,649,325) then
			click(x,y)sleep(1000)
		--军事
		elseif DmFindPic("csfz_u.bmp",85,471,168,493,182) then--867,176
			click(x+338,y)sleep(1000)
		--面板上的研究按钮
		elseif DmFindPic("yj_u.bmp",85,507,231,528,243) then
			click(x,y)sleep(1000)
		--动员令
		elseif DmFindPic("0_dyl_u.bmp",90,228,276,242,288) and DmFindPic("dongyuanling_u.bmp",90,227,341,245,353) then--182,328
			click(x-46,y-20)sleep(1000)
		--侦察营
		elseif DmFindPic("0_zcy_u.bmp",90,708,277,723,287) and DmFindPic("zcy_u.bmp",90,709,325,724,338) then
			click(x-46,y-20)sleep(1000)	
		--侦察营研究之后研究军团
		elseif DmFindPic("1_zcy_u.bmp",90,709,277,723,286) and DmFindPic("zcy_u.bmp",90,709,325,724,338) then	
			myMove_RL(574,322,374,322,2)sleep(1000)
		elseif DmFindPic("0_jt_u.bmp",90,986,272,1000,282) and DmFindPic("jt_u.bmp",90,985,349,1001,361) then
			click(x-46,y-20)sleep(1000)			
		--没有可以研究的
		elseif DmFindPic("jun_u.bmp",85,34,330,52,345) then
			click(x,y)sleep(1000)
			isok=1
		elseif DmFindPic("guanbiyanjiu_u.bmp",85,33,41,50,57) then
			click(x,y)sleep(1000)
			isok=1
		else
			duihua()
			connect()
		end	
	end
end

--去射手中心
function sheshou()
	jdwlLog("go to sheshou")
	leftyuandian()
	local tt=os.time()
	local isok=0
	while true do
		baojing()
		if os.difftime(os.time(),tt) > 120 then
			jdwlLog("go to sheshou overtime")
			kill()
			leftyuandian()
			tt=os.time()
		--沿x轴滑动
		elseif DmFindPic("zuoyuandian_u.bmp",85,724,475,751,503) or DmFindPic("zuoyuandian_u.bmp",85,735,484,746,496) then
			myMove_RL(704,505,208,505,4)sleep(1000)
		--训练完成
		elseif (DmFindPic("sheshouwc_u.bmp",80,654,322,683,351) or DmFindPic("sheshouwc1_u.bmp",80,653,321,683,352) )then
			jdwlLog("go to sheshou:finish")
			break
		elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("go to yongshi:finish")
			break
		elseif isok==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y)			
		--详细界面的训练按钮
		elseif DmFindPic("sheshouxl_u.bmp",85,1058,194,1075,211) then
			click(x,y)sleep(2000)
		--点击展开之后的训练按钮
		elseif DmFindPic("sheshouxunlian_u.bmp",85,676,192,698,216) then
			click(x,y)sleep(2000)
		--点击射手训练营
		elseif DmFindPic("sheshou_u.bmp",85,561,238,574,250) then
			click(x,y)sleep(2000)
		--材料不足无法训练
		elseif DmFindPic("zuanshibuzu_u.bmp",85,677,302,691,318) then--33,610
			click(x-640,y+300)
			isok=1			
			manbing=1
		else
			duihua()
			connect()
		end	
	end
end

--勇士训练营
function yongshi()
	jdwlLog("go to yongshi")
	leftyuandian()
	local tt=os.time()
	local isok=0
	while true do
		baojing()
		if os.difftime(os.time(),tt) > 90 then
			jdwlLog("go to yongshi overtime")
			kill()
			leftyuandian()
			tt=os.time()			
		--沿x轴滑动
		elseif DmFindPic("zuoyuandian_u.bmp",85,724,475,751,503) or DmFindPic("zuoyuandian_u.bmp",85,735,484,746,496) then
			myMove_RL(704,505,208,505,4)sleep(500)
			myMove_UD(833,350,833,468,4)sleep(500)
		--训练完成
		elseif DmFindPic("yongshiwc_u.bmp",80,754,309,784,339) or DmFindPic("yongshiwc1_u.bmp",80,756,310,782,335) then
			jdwlLog("go to yongshi:finish")
			break			
		elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("go to yongshi:finish")
			break
		elseif isok==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y)
		--点击展开之后训练按钮
		elseif DmFindPic("yongshixunlian_u.bmp",85,775,181,800,200) then
			click(x,y)sleep(2000)
		--默认二级兵
		elseif DmFindPic("yijibing_u.bmp",80,746,315,758,327)==false and DmFindPic("sheshouxl_u.bmp",85,1058,194,1075,211) then--787,443
			click(x-270,y+260)
		--详细界面的训练按钮
		elseif isok== 0 and DmFindPic("yijibing_u.bmp",80,746,315,758,327) and DmFindPic("sheshouxl_u.bmp",85,1058,194,1075,211) then
			click(x,y)sleep(1000)	
		--到勇士训练营
		elseif DmFindPic("yongshi_u.bmp",85,662,220,672,233) then
			click(x,y)sleep(2000)
		--上一次有训练
		elseif DmFindPic("yongshimaozi_u.bmp",85,635,204,661,230) then
			click(x,y)sleep(1000)
		--材料不足无法训练
		elseif DmFindPic("zuanshibuzu_u.bmp",85,677,302,691,318) then--33,610
			click(x-640,y+300)
			isok=1		
		else
			duihua()
		end		
	end
end


--去车辆研究所
function cheliang()
	jdwlLog("go to cheliang")
	leftyuandian()
	local tt=os.time()
	local isok=0
	while true do
		baojing()
		if os.difftime(os.time(),tt) > 90 then
			jdwlLog("go to cheliang overtime")
			kill()
			leftyuandian()
			tt=os.time()				
		--沿x轴滑动
		elseif DmFindPic("zuoyuandian_u.bmp",85,724,475,751,503) or DmFindPic("zuoyuandian_u.bmp",85,735,484,746,496) then
			myMove_RL(808,505,208,505,4)sleep(500)
			myMove_UD(730,220,730,520,4)sleep(500)
		--训练完成
		elseif DmFindPic("cheliangwc_u.bmp",80,779,265,803,284) then
			jdwlLog("go to cheliang:finish")
			break			
		elseif isok==1 and DmFindPic("jie_u.bmp",85,1065,575,1080,589) then
			jdwlLog("go to cheliang:finish")
			break
		elseif isok==1 and DmFindPic("fanhui_u.bmp",85,37,619,45,633) then
			click(x,y)			
		--点击展开之后训练按钮
		elseif DmFindPic("cheliangxunlian_u.bmp",85,802,134,820,150) then
			click(x,y)sleep(2000)
		elseif DmFindPic("yijiche_u.bmp",85,785,319,800,337)==false and DmFindPic("sheshouxl_u.bmp",85,1058,194,1075,211) then--792,446
			click(x-260,y+260)
		--详细界面的训练按钮
		elseif isok==0 and DmFindPic("yijiche_u.bmp",85,785,319,800,337) and DmFindPic("sheshouxl_u.bmp",85,1058,194,1075,211) then
			click(x,y)sleep(2000)	
		--到车辆研究所
		elseif DmFindPic("cheliang_u.bmp",85,681,231,691,240) or DmFindPic("cheliang1_u.bmp",80,677,206,688,215) then--721,230
			click(x,y)sleep(2000)
		--材料不足无法训练
		elseif DmFindPic("zuanshibuzu_u.bmp",85,677,302,691,318) then--33,610
			click(x-640,y+300)
			isok=1		
			manbing=1
		else
			duihua()
			connect()
		end		
	end
end

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
function jdwlMsg(msg)
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
--延迟函数
function sleep(ms)
	mSleep(ms)
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
			--logDebug(pic)
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