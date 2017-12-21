
echo "----Script By Syirasky (Blackbox OS)------"
echo "This script will install an official updated wine from winehq."
echo "Disclaimer: I (Syirasky) not responsible if any damage happened to your system."
echo "Make sure you have all required installer in this directory:" $(pwd)
echo "python-2.7.12.msi pywin32-220.win32-py2.7.exe, pyHook-1.5.1.win32-py2.7.exe"
echo "Accept : yes / no"
read yn
	if [ $yn == 'yes' ]
	then	
		wget -nc https://dl.winehq.org/wine-builds/Release.key
		sudo apt-key add Release.key
		sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
		sudo apt-get update
		sudo apt-get install --install-recommends winehq-stable
		winecfg
		wine msiexec /i python-2.7.12.msi /L*v log.txt
		wine pywin32-220.win32-py2.7.exe
		wine pyHook-1.5.1.win32-py2.7.exe
		_user="$(id -u -n)"
		wine /home/$_user/.wine/drive_c/Python27/python.exe -m pip install pyinstaller
	fi
