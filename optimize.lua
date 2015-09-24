function os.remove(path)
    return os.execute("rm -rf "..path);
end	

function io.list8(App)
	for l in io.popen("ls ".."var/mobile/Containers/Bundle/Application/"):lines() do
		file=io.open("var/mobile/Containers/Bundle/Application/" ..l .."/apps.app/Info.plist")
		if file~=nil then
			path="var/mobile/Containers/Bundle/Application/" ..l .."/apps.app"
			youxiyouhua()
		end
	end
end


function io.list8_1(AF)
	for l in io.popen("ls ".."var/mobile/Containers/Data/Application"):lines() do
		file=io.open("var/mobile/Containers/Data/Application/" ..l .."/Library/Preferences/" ..AF ..".tianmashikong.qmqj.apps.plist")
		if file~=nil then
			os.remove("var/mobile/Containers/Data/Application/" ..l .."/Documents/Decoration")
			file:close();
			break
		end
	end
end

function io.list7(App)
	for l in io.popen("ls ".."var/mobile/Applications/"):lines() do
		file=io.open("var/mobile/Applications/" ..l .."/apps.app/Info.plist")
		if file~=nil then
			path="var/mobile/Applications/" ..l .."/apps.app"
			youxiyouhua()
		end
	end
end

function io.list7_1(AF)
	for l in io.popen("ls ".."var/mobile/Applications/"):lines() do
		file=io.open("var/mobile/Applications/" ..l .."/Library/Preferences/com.tianmashikong.qmqj."..AF.."plist")
		if file~=nil then
			os.remove("var/mobile/Applications/" ..l .."/Documents/Decoration")
			file:close();
			break
		end
	end
end

function io.list7_1_TW()
	for l in io.popen("ls ".."var/mobile/Applications/"):lines() do
		file=io.open("var/mobile/Applications/" ..l .."/Library/Preferences/com.tw0409.qjmu.tw.plist")
		if file~=nil then
			os.remove("var/mobile/Applications/" ..l .."/Documents/Decoration")
			file:close();
			break
		end
	end	
end	

function youxiyouhua()
	os.remove(path.."/Data/Raw/Audio")
	os.remove(path.."/Data/Raw/Monster")
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
	os.remove(path.."/Data/Raw/Decoration")
end	

function main()
	io.list8()
end