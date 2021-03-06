---
title: Transmission
description: "The P2P transfer daemon"
date: 2020-02-04T14:52:27-08:00
---

# Transmission

{{% aside danger %}}

**Disclaimer:** Pirating videos is not only bad, it's illegal. As a result, you should never run the commands below. This is an educational blog post, and I'm educating you guys on exactly what you *shouldn't* do.

{{% /aside %}}

## Getting Started

You'll need a few applications on your computer, such as VLC and Homebrew.

* On MacOS

  ```shell
  brew cask install vlc
  brew install python transmission-cli watch
  pip install pirate-get
  ```

* On Linux

  ```shell
  apt install transmission-cli transmission-daemon watch
  pip install pirate-get
  ```


This will install the required programs that you need to use this software.
* `vlc` will play the movies
* `python3` will run the pirating web-scraper
* `transmission-remote` will handle the p2p transfer of data
* `watch` will show the file downloading

{{% aside warning %}}

**Warning:** Make sure that after you've completed these commands, you actually launch the daemon for `transmission`. To do this, type the following. If you don't, you'll get an error message `Transmission is not running.`

{{% /aside %}}

```shell
brew services start transmission-cli
```

## Searching for a video

To search for the movie you aren't supposed to be pirating, use the `pirate-get` program with the `-t` flag.

Download videos from the TV-Show Seinfeld

```shell
pirate-get -t 'seinfeld'
```

After this page loads, you will see various options to choose from. Simply type the `LINK` index you want to download, and press enter. If you want multiple files, you can download all of them by separating each link number with a space, e.g. `0 2 16` would download link \#0, link \#2, and link \#16


## Viewing downloads

View a real-time status of all transmission files

```shell
watch -n 0.1 'transmission-remote -l'
```

{{% aside info %}}

**Tip:** You can close this window by pressing \[⌃ C\] (or \[⌘ .\] on Mac OS)

{{% /aside %}}

## Playing videos

```shell
vlc -f ~/Downloads/the_downloaded_file_name
```

## Removing Files

```shell
# list all torrent files
transmission-remote -l
# remove and delete torrent ID 2
transmission-remote -t 2 -rad
```

## Starting and Stopping the Daemon

* Starting the daemon

```shell
transmission-daemon
```

* Stopping the daemon

```shell
transmission-remote --exit
```

## Configuration File

Configurations are stored at `~/.config/transmission-daemon`, you can write the following command to dump an initial config file to that location:

```shell
transmission-daemon --dump-settings &> ~/.config/transmission-daemon
```

{{% aside danger %}}
**Warning:** Be careful that you don't also have a `~/.config/settings.json`,
because `transmission-daemon` will prefer these settings over any set in a
`~/.config/transmission-daemon` file
{{% /aside %}}

Be careful about determining where transmission is actually looking when launching with a config file. If `TRANSMISSION_HOME` is not set, Unix-based versions of Transmission will look for their settings in `${XDG_CONFIG_HOME}/transmission/`. Sometimes this isn't true, however, and sometimes on macOS, (for instance, when transmission is launched as a homebrew service), the config file is placed in `~/Library/Application Support/Transmission`.



## Misc

You can specify a custom directory for your configuration file

* Have transmission read the config file from {{< var CONFIG_DIR >}}/settings.json

```shell
transmission-daemon --config-dir {{< var CONFIG_DIR >}}
```

* Print detailed information about a torrent

```shell
transmission-remote -t1 -i
```

* Get the magnet for the `.torrent` file {{< var MAGNET_FILE >}}

```shell
transmission-show -m {{< var MAGNET_FILE >}}
```
