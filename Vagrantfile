Vagrant.configure('2') do |config|
  config.vm.box = 'centos65'
  config.vm.box_url = 'https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box'
  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--memory', 2048]
  end
  config.vm.provision 'shell', path: 'setup.sh'
end
