@echo off

if not "%ROSLYN_PATH%" == "" goto HasRoslyn
	echo Error: ROSLYN_PATH env variable is not defined
	exit /b 2
:hasRoslyn

if not "%ROSLYN_PATH%" == "" goto HasManaged
	echo Error: PATH_7D2D_MANAGED env variable is not defined
	exit /b 2
:HasManaged

"%ROSLYN_PATH%\csc.exe" /target:library /out:%* /nologo ^
/noconfig /nowarn:1701,1702,2008 /fullpaths /nostdlib+ /errorreport:prompt /warn:4 /define:TRACE ^
/debug:pdbonly /filealign:512 /optimize+ /errorendlocation /preferreduilang:en-US /highentropyva+ ^
/reference:"%PATH_7D2D_MANAGED%\mscorlib.dll" ^
/reference:"%PATH_7D2D_MANAGED%\System.Core.dll" ^
/reference:"%PATH_7D2D_MANAGED%\UnityEngine.dll" ^
/reference:"%PATH_7D2D_MANAGED%\UnityEngine.CoreModule.dll" ^
/reference:"%PATH_7D2D_MANAGED%\UnityEngine.InputModule.dll" ^
/reference:"%PATH_7D2D_MANAGED%\UnityEngine.AudioModule.dll" ^
/reference:"%PATH_7D2D_MANAGED%\UnityEngine.PhysicsModule.dll" ^
/reference:"%PATH_7D2D_MANAGED%\UnityEngine.AnimationModule.dll" ^
/reference:"%PATH_7D2D_MANAGED%\UnityEngine.InputLegacyModule.dll" ^
/reference:"%PATH_7D2D_MANAGED%\UnityEngine.UnityWebRequestModule.dll" ^
/reference:"%PATH_7D2D_MANAGED%\UnityEngine.UnityWebRequestAudioModule.dll" ^
/reference:"%PATH_7D2D_MANAGED%\UnityEngine.AssetBundleModule.dll" ^
/reference:"%PATH_7D2D_MANAGED%\UnityEngine.IMGUIModule.dll" ^
/reference:"%PATH_7D2D_MANAGED%\Unity.Postprocessing.Runtime.dll" ^
/reference:"%PATH_7D2D_MANAGED%\Mono.Cecil.dll" ^
/subsystemversion:6.00 /utf8output /deterministic+ /langversion:7.3

:end
