import os

message = input("COMMIT MESSAGE: ")
print(message);

os.system("git pull")
os.system("git add --all")
os.system("git commit -m " + message)
os.system("git push")