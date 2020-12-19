<h1 align="center">KVMShutdown</h1>

<h2 align="center">A script intended for use by GPU passthrough users that makes it easier to shutdown or reboot your host computer after your VM has shutdown.</h2>

## Prerequisites

**Sudo privleges are required.** It's recommened that you run this script in a screen session so if you SSH into your host from the guest the script can run independently of the SSH session (meaning that the script won't exit when SSH is exited).

You can install Screen through your distro's package manager. For example, on Manjaro you can use:
```
sudo pacman -S screen
```
to install it.

## Installation

You can download this script by simply running:
```
wget https://raw.githubusercontent.com/flynnwasnt/KVMShutdown/master/sdvm.sh
```

The script will need to be marked as executable before you can run it. You can do this by running:

```
chmod +x ./sdvm.sh
```

## Running the script

To run the script inside a Screen session, run:

```
sudo screen /path/to/where/script/is/stored/sdvm.sh
```

If you plan to use this script regularly, you can add this command to your shells rc file as an alias. On most shells, you can do this by adding:
```
alias sdvm="sudo screen /path/to/where/script/is/stored/sdvm.sh"
```
to it's rc file. (e.g ~/.bashrc or ~/.zshrc, depending on what shell you're using)

On Fish, you can make an alias by running:
```
alias sdvm="sudo screen /path/to/where/script/is/stored/sdvm.sh" -s
```


