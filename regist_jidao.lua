-- 点击函数封装
function click(x, y)--随机小幅度点击
    touchDown(0, x + math.random(-5, 5), y + math.random(-5, 5))
    mSleep(math.random(15,50))
    touchUp(0)
    mSleep(math.random(200,500))
end
--第一个页面
one = {0xFFFFFF,--207,695;
7,11,0xE6294E,11,20,0x390F16
}
--第二个页面
two = {0xFED200,--268,717;
2,3,0xEDBA05,7,10,0xAAB2BD
}
--第三个页面
three = {0xFEDB3C,--285,436;
2,6,0x4A4A4A,6,13,0x8DD6F0
}
--立即体验
icon_now = {0x695D52,--297,936;
4,3,0xFFFFFF,5,6,0x4B4B4B,
9,12,0x4D5053,}
--我
icon_me = {0x9EA6AD,--586,1075;
5,5,0x9EA6AD,8,10,0x9FA7AF,
1,7,0xF5F5F5,4,9,0xF5F5F5
}
--点击登录
icon_load = {0x7A7A7A,--265,214;
2,6,0x969696,5,3,0xFFFFFF,
5,6,0xD9D9D9,}
--注册
icon_reg = {0xFEFFFF,--558,87;
1,2,0x1DB9A2,3,6,0x1DB9A2,
5,11,0xFFFFFF,}
--注册图标在正中间
icon_reg_mid = {0xB9E9E2,--325,70;
1,3,0xFFFFFF,1,7,0xFFFFFF,
4,8,0x1DB9A2,6,10,0x1DB9A2,
}
--请输入手机号码
icon_mobile = {0xD9D9DD,--275,193;
1,3,0xC7C7CD,6,5,0xDBDBDF,
12,5,0xDBDBDF,16,5,0xC7C7CD,
}
--请输入密码
icon_password = {0xC7C7CD,--207,301;
0,7,0xC7C7CD,4,6,0xFFFFFF,
7,10,0xEEEEF0,9,11,0xC7C7CD,
}

--下一步
icon_next = {0xFFFFFF,--437,428;
4,3,0x1DB9A2,7,5,0x1DB9A2,
13,6,0x1DB9A2,17,8,0xF5FCFB,
}
--等待验证码
icon_wait = {0xF5CAC1,--372,193;
0,4,0xF2F2F2,2,8,0xFD8067,
2,14,0xFD8067,2,20,0xFD8067,
}
--重新发送
icon_resend = {0x5ACBBB,--412,299;
1,4,0x36C0AC,9,5,0x1DB9A2,
10,8,0x1DB9A2,6,7,0xFFFFFF,
}
--完成注册
icon_finish = {0xB9E9E2,--361,428;
1,1,0xFFFFFF,4,4,0x1DB9A2,
4,7,0x1DB9A2,8,12,0xFFFFFF,
}
--昵称
icon_name = {0x333333,--33,135;
0,5,0x333333,4,6,0xFFFFFF,
7,1,0x363636,3,3,0xFFFFFF,
}
--卓玛平台相关
uid = 'jdwlios2015'
pwd = 'jdwl2014'
pid = 8369
token = nil
Mobile = nil

UI = {
	{'DropList{active|regist}','model','模式'},
	{'DropList{adsl2|adsl3|adsl4|adsl5|adsl6|adsl7|adsl8|adsl9|adsl13|adsl14|adsl15}','adsl','宽带'},
}

_adsl2 = 'id%3d2%26type%3ddown%26shell_data%3dinternet%253DMAC_VLAN%2binterface%253Dwan1%26r%3d0.43528579045092863'
_adsl3 = 'id%3d3%26type%3ddown%26shell_data%3dinternet%253DMAC_VLAN%2binterface%253Dwan1%26r%3d0.23165789083577693'
_adsl4 = 'id%3d4%26type%3ddown%26shell_data%3dinternet%253DMAC_VLAN%2binterface%253Dwan1%26r%3d0.8230940476059914'
_adsl5 = 'id%3d5%26type%3ddown%26shell_data%3dinternet%253DMAC_VLAN%2binterface%253Dwan1%26r%3d0.019288570387288928'
_adsl6 = 'id%3d6%26type%3ddown%26shell_data%3dinternet%253DMAC_VLAN%2binterface%253Dwan1%26r%3d0.17031859676353633'
_adsl7 = 'id%3d7%26type%3ddown%26shell_data%3dinternet%253DMAC_VLAN%2binterface%253Dwan1%26r%3d0.8230940476059914'
_adsl8 = 'id%3d8%26type%3ddown%26shell_data%3dinternet%253DMAC_VLAN%2binterface%253Dwan1%26r%3d0.019288570387288928'
_adsl9 = 'id%3d9%26type%3ddown%26shell_data%3dinternet%253DMAC_VLAN%2binterface%253Dwan1%26r%3d0.17031859676353633'
_adsl13 = 'id%3d13%26type%3ddown%26shell_data%3dinternet%253DMAC_VLAN%2binterface%253Dwan1%26r%3d0.8230940476059914'
_adsl14 = 'id%3d14%26type%3ddown%26shell_data%3dinternet%253DMAC_VLAN%2binterface%253Dwan1%26r%3d0.019288570387288928'
_adsl15 = 'id%3d15%26type%3ddown%26shell_data%3dinternet%253DMAC_VLAN%2binterface%253Dwan1%26r%3d0.17031859676353633'
--主函数
function main()
	rotateScreen(0)
	mSleep(2000)
	if model == 'active' then
		modelone()
	elseif model == 'regist' then
		modeltwo()
	end	
end

--激活
function modelone()
	while true do
		getAccount()
		jiadaoact()
		iGrimace()
		router()
	end
end

--注册
function modeltwo()
	while true do
		getAccount()
		jiadao()
		iGrimace()
		router()
	end	
end

function jiadaoact()
	appRun('com.smiler.QuJia')
	local startTime = os.time()
	while os.difftime(os.time(),startTime) < 120 do
		--应用程序向导
		if Mulcolor(three,100,285,436,291,449) or Mulcolor(two,100,268,717,275,727) or Mulcolor(one,100,207,695,218,715) then
			myMove_RL(466,744,59,739,30)
		--立即体验
		elseif Mulcolor(icon_now,100,297,936,306,948) then
			click(x,y)
		--我
		elseif Mulcolor(icon_me,100,586,1075,594,1085) then
			click(x,y)
			local aa = math.random(20,30)
			for i = 1,aa do
				notifyMessage('激活等待')mSleep(1000)
			end
			local sn = getDeviceID()
			upload('active',sn,nil,nil)
			modifyTxt()
			break
		end
	end
end

function jiadao()
	local isClickReg = false
	local count = 0
	appRun('com.smiler.QuJia')
	local startTime = os.time()
	while true do
		if os.difftime(os.time(),startTime) > 120 then
			if appRunning('com.smiler.QuJia') then
				local sn = getDeviceID()
				upload('active',sn,nil,nil)
			end
			break
		--应用程序向导
		elseif Mulcolor(three,100,285,436,291,449) or Mulcolor(two,100,268,717,275,727) or Mulcolor(one,100,207,695,218,715) then
			myMove_RL(466,744,59,739,30)
		--立即体验
		elseif Mulcolor(icon_now,100,297,936,306,948) then
			click(x,y)
		--我
		elseif Mulcolor(icon_me,100,586,1075,594,1085) then
			click(x,y)
		--登录
		elseif Mulcolor(icon_load,100,265,214,270,220) then
			click(x,y)
		--注册
		elseif Mulcolor(icon_reg,100,558,87,563,98) then
			click(x,y)
			isClickReg = true
		--填写手机号码
		elseif Mulcolor(icon_reg_mid,100,325,70,331,80) and Mulcolor(icon_mobile,100,275,193,291,198) then
			click(x,y)mSleep(1000)
			zmGetMobileNum()
			if Mobile ~= nil then
				notifyMessage(Mobile)
				mSleep(1000)
				inputid(Mobile)
			end
		--填写密码
		elseif Mulcolor(icon_reg_mid,100,325,70,331,80) and Mulcolor(icon_password,95,207,301,216,312) then
			click(x,y)mSleep(1000)
			local pass = randomstring(8)
			notifyMessage(pass)mSleep(1500)
			inputpwd(pass)
		--下一步
		elseif Mulcolor(icon_next,100,437,428,454,436) then
			click(x,y)
		--注册完毕
		elseif Mulcolor(icon_finish,100,361,428,369,440) then
			click(x,y)
		--超时
		elseif count > 2 then
			notifyMessage('超时关闭')
			break
--[[		--重新发送
		elseif Mulcolor(icon_resend,100,412,299,422,307) then
			click(x,y)
			count = count + 1--]]
		--验证码界面
		elseif Mulcolor(icon_wait,100,372,193,374,213) then--372,193, 251,307
			click(x-120,y+114)
			mSleep(1000)
			local data = zmGetVcodeAndReleaseMobile() 
			local ret = string.match(data,'%d+')
			if data ~= 'not_receive' and data ~= 'not_found_moblie' and  ret ~= nil then
				logDebug(data)
				local data = string.sub(data,string.find(data,'|'),string.len(data))
				local data = string.match(data,'%d+')
				notifyMessage(data)mSleep(1000)
				inputid(tostring(data))
			end
		--个人资料
		elseif Mulcolor(icon_name,100,33,135,40,136) then
			zmAddIgnoreList()
			modifyTxt()
			appKill('com.smiler.QuJia')
			local sn = getDeviceID()
			upload('reg',sn,nil,nil)
			break
		end
	end
end


function upload(action,deviceid,mobile,remark)
	local data = httpGet('http://192.168.240.122:8080/IphoneAd/servlet/IphoneServlet?action='..action..'&sn='..deviceid..'&mobile=&remark=')
	if data == 'ok' then
		notifyMessage('ok')
	elseif data == 'error' then
		while true do
			notifyMessage('上传数据失败')
		end
	else
		while true do
			notifyMessage('上传数据失败')
		end
	end
end

--一键新机
new_iphone = {0x4F4F4F,--493,818;
1,3,0xCCCCCC,7,4,0x000000,
1,5,0xA2A2A2,1,3,0xCCCCCC,
}
--退出
icon_exit = {0x000000,--470,945;
2,5,0x000000,6,2,0xCCCCCC,
6,7,0xCCCCCC,13,10,0x000000,
}
--iPhone的n字
letter_n = {0xFFFFFF,--223,141;
4,3,0x8000E3,1,4,0xFEFCFF,
5,7,0x8000E3,8,12,0xB56BEF,
}
function iGrimace()
	
	for i = 1,3 do
		appRun('org.ioshack.iGrimace')mSleep(1000)	
	end
	local isnew = 0
	while true do
		if isnew == 0 and Mulcolor(letter_n,100,223,141,231,153) and Mulcolor(new_iphone,100,493,818,500,823) then
			click(x,y)mSleep(4000)
			isnew = 1
		elseif isnew == 1 and Mulcolor(icon_exit,100,470,945,483,955) then
			click(x,y)
			break
		end
	end
end

--读取帐号
function getAccount()
	local file,l,f
	file = io.open("var/touchelf/scripts/avf.txt","r")
	ourline = tonumber(file:read())
	notifyMessage(ourline)
	file:close()
end

function inputid(num)
	local current = 0
	for i = 1,string.len(num) do
		current = string.sub(num,i,i)
		if current == '1' then
			click(111,752)
		elseif current == '2' then
			click(323,745)
		elseif current == '3' then
			click(540,748)
		elseif current == '4' then
			click(110,859)
		elseif current == '5' then
			click(319,857)
		elseif current == '6' then
			click(537,856)
		elseif current == '7' then
			click(108,968)
		elseif current == '8' then
			click(320,966)		
		elseif current == '9' then
			click(540,968)
		elseif current == '0' then
			click(318,1081)
		end
	end
end

--abcdefghijklmnop
function inputpwd(pwd)
	local current = 0
	for i = 1,string.len(pwd) do
		current = string.sub(pwd,i,i)
		if current == 'a' then
			click(66,875)
		elseif current == 'b' then
			click(388,988)
		elseif current == 'c' then
			click(260,983)
		elseif current == 'd' then
			click(200,883)
		elseif current == 'e' then
			click(158,770)
		elseif current == 'f' then
			click(262,871)
		elseif current == 'g' then
			click(318,879)
		elseif current == 'h' then
			click(386,872)
		elseif current == 'i' then
			click(482,769)			
		elseif current == 'j' then
			click(455,881)
		elseif current == 'k' then
			click(517,876)
		elseif current == 'l' then
			click(572,872)
		elseif current == 'm' then
			click(502,979)
		elseif current == 'n' then
			click(450,980)
		elseif current == 'o' then
			click(547,775)
		elseif current == 'p' then
			click(602,763)																						
		end
	end
end

--修改文本
function modifyTxt()
	local file,hello
	file = io.open("var/touchelf/scripts/avf.txt","r")
	ourline = tonumber(file:read())
	file:close()
    file = io.open("var/touchelf/scripts/avf.txt","w")
	file:write(ourline+1)
	file:close()
end

	--卓玛:获取登录令牌
	function zmGetToken()	
		local data = httpGet(string.format('http://api.zmyzm.com/apiGo.do?action=loginIn&uid=%s&pwd=%s', uid, pwd))
		if data ~= nil then
			local index = string.find(data, '|');
			if index ~= nil then
			    token = string.sub(data, index + 1, 1000)
				return token
			end
		end
		return nil;
	end
	
		--卓玛:获取手机号码
	function zmGetMobileNum()
		if token == nil then
			token = zmGetToken();
		end
		
		if token == nil then
			notifyMessage("卓码登录失败。。");
			return Mobile;
		end
		
		local data = nil;
		data = httpGet(string.format('http://api.zmyzm.com/apiGo.do?action=getMobilenum&pid=%d&uid=%s&token=%s', pid, uid, token))
		notifyMessage("zuoma raw data:"..data);
		if string.find(data, token) ~= nil then										
			Mobile = string.sub(data,1,string.find(data,'|') - 1)
		else
			notifyMessage("zuoma mobile : nil");
		end
		
		return Mobile;
	end
		--卓玛:获取短信
	function zmGetVcodeAndReleaseMobile()
		if Mobile == nil then
			notifyMessage("卓码获取短信：手机号为空。。");
		end
		
		notifyMessage("zuoma:send req ...");
		return httpGet(string.format('http://api.zmyzm.com/apiGo.do?action=getVcodeAndReleaseMobile&uid=%s&token=%s&mobile=%s', uid, token, Mobile));										
	end
	
	--卓玛:加黑号码
	function zmAddIgnoreList()		
		httpGet(string.format('http://api.zmyzm.com/apiGo.do?action=addIgnoreList&uid=%s&token=%s&mobiles=%s&pid=%d',uid, token, Mobile, pid));					
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
		local chars = 'abcdefghijklmnop'
		local strs = ''
		math.randomseed(tostring(os.time()):reverse():sub(1,n))
		for i = 1,n do
			local index = math.random(string.len(chars))
			strs = strs..string.sub(chars,index,index)
		end
		return strs
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

function router()
	
	local url
	if adsl == 'adsl2' then
		url = _adsl2
	elseif adsl == 'adsl3' then
		url = _adsl3
	elseif adsl == 'adsl4' then
		url = _adsl4
	elseif adsl == 'adsl5' then
		url = _adsl5
	elseif adsl == 'adsl6' then
		url = _adsl6
	elseif adsl == 'adsl7' then
		url = _adsl7
	elseif adsl == 'adsl8' then
		url = _adsl8
	elseif adsl == 'adsl9' then
		url = _adsl9
	elseif adsl == 'adsl13' then
		url = _adsl13
	elseif adsl == 'adsl14' then
		url = _adsl14	
	elseif adsl == 'adsl15' then
		url = _adsl15		
	end
	local ipAddress = httpGet('http://ip.3322.net/')
	local ret = string.match(ipAddress,'%d+')
	if ret ~= nil then
		notifyMessage('ip:'..ipAddress)
	elseif ret == nil then
		while true do
			notifyMessage('联网失败,请尝试重连wifi或重启手机')
		end
	end
	--[[url = 'id%3d4%26type%3ddown%26shell_data%3dinternet%253DMAC_VLAN%2binterface%253Dwan1%26r%3d0.17031859676353633'--]]
	local data = httpGet('http://192.168.1.8:7356/makemoney/android/ad/router?action=control&sn='..getDeviceID()..'&url='..url)
	local i,j = string.find(data,'ok')
	if i~=nil and j~=nil then
		notifyMessage('断网成功')
		mSleep(5000)
	else
		while true do
			notifyMessage('断网失败')
			mSleep(5000)
		end
	end
end