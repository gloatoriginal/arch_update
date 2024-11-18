**CAUTION** This does remove modules related to nvidia on the current kernel running, these should load back once the new kernel/env has loaded.
I did this with -f in order to work with new kernels after update as nvidia was having trouble in those instances with removing itself before kexec.

This is for people that are lazy and like to have a system that lives on the true edge, set the update.sh on a cronjob that executes that bad boy daily, weekly, monthly, or heck, even hourly, I won't judge.
Some basic instructions for anyone that wants that:

**Auto Install**

I have attempted at setting up a "oneshot" script, `bootstrap.sh` that should handle everything besides setting a crontab to automatically run, that is up to you.

`git clone https://github.com/gloatoriginal/arch_update && chmod +x ./arch_update/bootstrap.sh && ./arch_update/bootstrap.sh`


**Manual Install**

1. Copy the 3 files in some way, git is the recommended approach

`git clone https://github.com/gloatoriginal/arch_update`

2. Set ``update.sh`` anywhere you like, preferably somewhere that is easy to type out

`chmod +x /path/to/update.sh`

3. Install or use cronjob, on Arch I use Cronie, 

`sudo pacman -S cronie && sudo systemctl enable --now cronie`

4. Use https://crontab.guru/ for help with timings setup a cronjob with 

`crontab -e`

5. copy `kexec-load@.service` and `unmodeset.service` to `/etc/systemd/system/`
6. Enable `unmodeset.service` with

`sudo systemctl enable unmodeset.service`

