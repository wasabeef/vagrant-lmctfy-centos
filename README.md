# Vagrant lmctfy

[lmctfy](https://github.com/google/lmctfy) Vagrantfile and setup script.

## Usage

```bash
$ vagrant up
$ vagrant ssh
$ sudo lmctfy init "
  cgroup_mount:{
    mount_path:'/dev/cgroup/cpu'
    hierarchy:CGROUP_CPU hierarchy:CGROUP_CPUACCT
  }
  cgroup_mount:{
    mount_path:'/dev/cgroup/cpuset' hierarchy:CGROUP_CPUSET
  }
  cgroup_mount:{
    mount_path:'/dev/cgroup/freezer' hierarchy:CGROUP_FREEZER
  }
  cgroup_mount:{
    mount_path:'/dev/cgroup/memory' hierarchy:CGROUP_MEMORY
  }"
$ sudo lmctfy create test "memory:{limit:100000000}"
$ sudo lmctfy list containers
$ sudo lmctfy run test "echo hello world"
```

See more in lmctfy [readme](https://github.com/google/lmctfy#readme).
