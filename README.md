# Dockerized [rmate](https://github.com/aurora/rmate)

Useful for when extra runtimes, like Ruby or Python, are undesired, and even the
bash version doesn't work, like on CoreOS (since its bash has been compiled
without net redirections) or in some non-bash distro (in which case you'll have
to adjust the included rmate script by yourself).

### Setup

```bash
wget -O /usr/local/bin/rmate https://raw.githubusercontent.com/jeremejevs/rmate/master/rmate
chmod +x /usr/local/bin/rmate
```

Just in case, `/usr` isn't writable in CoreOS, so use `/opt/bin/rmate` instead,
and since I mention CoreOS specifics, might as well throw in a cloud config,
right?

```yml
coreos:
  units:
    - name: rmate.service
      command: start
      content: |
        [Unit]
        Description=Download and install rmate

        [Service]
        Type=oneshot
        ExecStart=/usr/bin/mkdir -p /opt/bin
        ExecStart=/usr/bin/wget -O /opt/bin/rmate https://raw.githubusercontent.com/jeremejevs/rmate/master/rmate
        ExecStart=/usr/bin/chmod +x /opt/bin/rmate
```

### Usage

```bash
rmate foo
rmate bar --name baz
rmate --line 42 qux # won't work, file path should come first
rmate quux --wait # --wait has no effect
rmate quuux --no-wait # don't do this
```

Disregard the jibber-jabber it prints when launching.
