call venv\Scripts\activate.bat
call python -m pip install --upgrade pip
call pip install -r requirements.txt
call npm install
REM use flask dbcreate for dropping existing database and rolling all new tabels
REM call flask dbupdate
call npm run dev
call flask run