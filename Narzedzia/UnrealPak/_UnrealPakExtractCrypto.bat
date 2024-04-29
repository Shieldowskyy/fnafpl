
@pushd %~dp0
.\UnrealPak.exe %1 -extract "%~dpn1" -cryptokeys=Crypto.json 
@popd
@pause