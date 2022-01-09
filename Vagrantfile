Vagrant.configure(2) do |config|

  # We use Ubuntu instead of Debian because the image comes with two-way
  # shared folder support by default.
  # UBUNTU = 'hashicorp/bionic64'
  # UBUNTU = "ubuntu/xenial64"
  UBUNTU = "bento/ubuntu-18.04"

  config.vm.define(:dotfiles) do |config|
    config.vm.provider :virtualbox do |v|
      v.name = 'dotfiles'
      v.memory = 2048
      v.cpus = `nproc`.chomp.to_i
    end

    config.vm.provider :vmware_desktop do |v|
      v.vmx['memsize'] = '2048'
      v.vmx['numvcpus'] = `nproc`.chomp
    end

    config.vm.box = UBUNTU
    config.vm.hostname = 'dotfiles'


    # Make sure we know the VM image’s default user name. The ‘cassowary’ user
    # (specified later) is used for most of the test *output*, but we still
    # need to know where the ‘target’ and ‘.cargo’ directories go.
    developer = 'vagrant'


    # Install the dependencies needed for exa to build, as quietly as
    # apt can do.
    config.vm.provision :shell, privileged: true, inline: <<-EOF
      echo "Installing tools"
      apt-get update -qq
      apt-get install -qq \
        git gcc curl zip zsh bash tmux build-essential \
        python python2.7-dev python3-dev python3-pip \
        pkg-config autoconf
    EOF
  end 
end 
