import os
import datetime
loc = ["~/.config/hypr","~/.config/alacritty","~/.config/waybar","~/.config/wofi","~/.config/nvim"]
for i in loc:
    os.system("cp -r "+i+" ../dotfiles")
os.system("git add . ")
x = datetime.datetime.now()
os.system("git commit -m "+"\""+str(x.strftime("%c"))+"\"")
os.system("git push origin main")
