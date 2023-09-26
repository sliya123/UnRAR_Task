:: description：迭代遍历当前文件夹及其子文件夹中的内容，如果有压缩文件，则将压缩文件解压至当前路径下，与压缩包同名的文件夹中。解压完文件后，删除压缩包文件。
:: 需要将 WinRAR 添加入环境变量，如果没有加入环境变量，则不能直接调用 unrar 命令。

:: %%f 完整的文件名（不包括路径）
:: %%~xf 文件后缀名
:: %%~nf 文件名，不包括后缀名
:: %%~dpf 当前文件所在的完整路径

@echo off

set rar_path=E:\\WinRAR\\unrar.exe
set zip_path=E:\\WinRAR\\WinRAR.exe

setlocal enabledelayedexpansion

for /r %%f in (*) do (
	if "%%~xf" == ".zip" (
		"%zip_path%" x "%%f" "%%~dpf%%~nf%\"
		del "%%f" 
	) else if "%%~xf" == ".rar" (
		REM unrar x "%%f" "%%~dpf%%~nf%\"  :: 需要设置环境变量
		"%rar_path%" x "%%f" "%%~dpf%%~nf%\"
		del "%%f" 
    ) 
)

endlocal

pause 