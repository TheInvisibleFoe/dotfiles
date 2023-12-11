import os
import datetime
loc_hypr = "~/.config/hypr"
os.system("cp -r "+loc_hypr+" ../dotfiles")
os.system("git add . ")
x = datetime.datetime.now()
os.system("git commit -m "+"\""+str(x.strftime("%c"))+"\"")
os.system("git push origin main")
