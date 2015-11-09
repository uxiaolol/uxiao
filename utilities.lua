-- 点击函数封装
--函数参数x,y 点击坐标位置，x与y坐标随机偏移正负5个像素
function click(x, y)--随机小幅度点击
    touchDown(0, x + math.random(-5, 5), y + math.random(-5, 5))
    mSleep(math.random(15,50))
    touchUp(0)
    mSleep(math.random(200,500))
end

--图片路径
--触摸精灵脚本路径为'/var/touchelf/scripts/'
--每个不同的应用以应用名字命名文件夹存放图片
--以热血传奇为例，该脚本的图片路径全局参数如下
PIC_PATH = '/var/touchelf/scripts/rexuechuanqi/'

--打印日志函数
--参数message为想输出到log.txt的内容，需设置全局参数isLog为true
--设置isLog是为了调试时候打印日志定位问题，脚本上线之后可将全局参数isLog设置为false则不会打印日志
function printLog(message)
tt = os.date("*t")
yy = tt.year
mm = tt.month
dd = tt.day
local curdate = yy..mm..dd
	if isLog == true then
		logDebug(curdate..message)
	end
end

--提示函数
--具体用法请参照打印日志函数printLog
function myNotify(message)
	if isNotify == true then
		notifyMessage(message)
		mSleep(2500)
	end
end

--上下滑动函数
--参数x1,y1第一个点，x2，y2位第二个点，speed为滑动速度
--该函数旨在将滑动距离拆解,达到滑动更精确的目的
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
--同myMove_UD
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

--区域模糊找图
--pic为图片名字,per为精度(建议85以上),x1,y1,x2,y2为查找范围的左上角坐标与右下角坐标
--PIC_PATH为全局图片文件夹路径
function FindByPic(pic,per,x1,y1,x2,y2)
	x, y = findImageInRegionFuzzy(PIC_PATH..pic, per, x1,y1,x2,y2)
	if x~=-1 and y~=-1 then		
		return true		
	else
		return false
	end	
end	
-- 忽略色找图
--color为忽略颜色的值,其他参数，参照区域模糊找图
--一张图片有时候背景色一直变化，但是主体颜色不变，则需要截图处理，使用忽略色找图，具体color参数根据自己实际处理的结果填写
--推介常用工具为photoshop，大漠综合工具
function FindPicByColor(pic,per,x1,y1,x2,y2,color)
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

--使用大漠综合工具操作，使用以下函数，图片使用win7自带的画图工具打开之后
--实际坐标与手机坐标系统有5个像素格偏差，在触摸精灵api函数中需要将坐标各个值减去5个像素格
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

-- 同上
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
--以上找色函数常用方法如下
--如果在屏幕查找为test的图，并点击
if DmFindPic('test.bmp',90,1,2,3,4) then
	click(x,y)
end


--文本操作删除指定行
--参数删除的行数
--函数原理，将文本内容逐行读入到table，再根据index参数配合table.remove函数删除table中index行
--再将table中的值逐行写入到原文本
function removeByIndex(index)
	local t={}
    local file=io.open("var/touchelf/scripts/test.txt")
    for line in file:lines() do
		table.insert(t,line)
    end
    temp_line=table.remove(t,index)
    local file=io.open("var/touchelf/scripts/test.txt",'w')
    for i,j in ipairs(t) do
		file:write(j,'\n')
    end
    file:close()
    return temp_line
end  

--随机字符串
--参数n为想要得到字符串的长度
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

--切换ip，其中id为全局参数，可自行在UI界面或者以其他方式存在
--除了id参数自行定义，router函数内部不要擅自修改，如服务器地址更新则以最新地址为准
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
	local data = httpGet('http://192.168.1.8:7356/makemoney/android/ad/router?action=control&sn='..getDeviceID()..'&url='..url)
	local i,j = string.find(data,'ok')
	if i~=nil and j~=nil then
		notifyMessage('断网请求成功')
		mSleep(5000)
	else
		notifyMessage('断网请求失败')
		mSleep(5000)
	end	
end