:: description������������ǰ�ļ��м������ļ����е����ݣ������ѹ���ļ�����ѹ���ļ���ѹ����ǰ·���£���ѹ����ͬ�����ļ����С���ѹ���ļ���ɾ��ѹ�����ļ���
:: ��Ҫ�� WinRAR ����뻷�����������û�м��뻷������������ֱ�ӵ��� unrar ���

:: %%f �������ļ�����������·����
:: %%~xf �ļ���׺��
:: %%~nf �ļ�������������׺��
:: %%~dpf ��ǰ�ļ����ڵ�����·��

@echo off

set rar_path=E:\\WinRAR\\unrar.exe
set zip_path=E:\\WinRAR\\WinRAR.exe

setlocal enabledelayedexpansion

for /r %%f in (*) do (
	if "%%~xf" == ".zip" (
		"%zip_path%" x "%%f" "%%~dpf%%~nf%\"
		del "%%f" 
	) else if "%%~xf" == ".rar" (
		REM unrar x "%%f" "%%~dpf%%~nf%\"  :: ��Ҫ���û�������
		"%rar_path%" x "%%f" "%%~dpf%%~nf%\"
		del "%%f" 
    ) 
)

endlocal

pause 