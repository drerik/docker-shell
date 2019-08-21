# Docker-ssh

A simple containerized ssh server.
Uses environment variables `USER` and `PASSWORD` to generate a users. if variables are omitted, a standard user name `user`with password `test` is created instead.

## Usage

```bash
docker run -d -p 22022:22 drerik/ssh
```

## TODO
- Multiple user creation at start/deploy
- Jail users
