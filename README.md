# Vagrant lmctfy CentOS

[lmctfy](https://github.com/google/lmctfy) Vagrantfile and setup script. Based on [vagrant-lmctfy](https://github.com/sboneyard/vagrant-lmctfy) by [silas](https://github.com/silas).

## Usage

```bash
$ vagrant up
$ vagrant ssh
$ sudo lmctfy create test "memory:{limit:100000000}"
$ sudo lmctfy list containers
$ sudo lmctfy run test "echo hello world"
```

See more in lmctfy [readme](https://github.com/google/lmctfy#readme).
