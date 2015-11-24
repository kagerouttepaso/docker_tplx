docker-machine start my-tplx
FOR /f "tokens=*" %%i IN ('docker-machine env --shell cmd my-tplx') DO %%i
set CMD=pwd
set PWD=
for /f "usebackq delims=" %%a in (`%CMD%`) do set PWD=%%a
echo %PWD%
REM ---------Build Start-----------
docker run --rm -i -t -v %PWD%:/src kagerouttepaso/tplx bash -c "cd /src && make clean && make"
REM ---------Build End-----------
docker-machine stop my-tplx
Pause
