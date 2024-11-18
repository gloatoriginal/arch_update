**CAUTION** This does remove modules related to nvidia on the current kernel running, these should load back once the new kernel/env has loaded.
I did this with -f in order to work with new kernels after update as nvidia was having trouble in those instances with removing itself before kexec.

This is for people that are lazy and like to have a system that lives on the true edge, set the update.sh on a cronjob that executes that bad boy daily, weekly, monthly, or heck, even hourly, I won't judge.
Some basic instructions for anyone that wants that:
copy the 3 files in some way, you can use git or just copy+paste.

1. Set update.sh anywhere you like, preferably somewhere that is easy to type out. Allow execute with 
  chmod +x /path/to/update.sh
2. Install or use cronjob, on Arch I use Cronie, 
  sudo pacman -S cronie && sudo systemctl enable --now cronie
3. Setup a cronjob with, cronjob -e, use https://crontab.guru/ for help with timings
4. copy kexec-load@.service and unmodeset.service to /etc/systemd/system/
5. Enable unmodeset.service with
  sudo systemctl enable unmodeset.service
