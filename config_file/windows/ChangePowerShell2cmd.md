## How to change right-click powershell to cmd:

### 在设置里选择，或者

### 改注册表

   0. open regedit
   1. `` Computer\HKEY_CLASSES_ROOT\Directory\Background\shell\Powershell\command ``
   2. 在左侧`` command ``项上点击鼠标右键，选择“权限”，在出现的窗口中再选择下方的“高级”
   3(optional). 如果你的所有者为`` TrustedInstaller ``，那么首先点击上方“更改”，将当前用户账户名添加进去，例如“xxxxxx@live.cn”（见下方图二），然后点击后方“检查名称”——“确定”。完成后，再在下方将当前用户的权限从读取改为“完全控制”即可。这样就可以正常修改注册表键值了
   4. 将右侧默认字符串值改为`` cmd.exe /s /k pushd "%V" ``，确定保存即可
   5. 如果要改回去，只要把以上键值改回以下键值即可，注意不含两侧引号: 
   ``` powershell.exe -noexit -command Set-Location -literalPath '%V' ```
