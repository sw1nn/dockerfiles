# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :forwarded_port, guest: 9092, host: 9092 #Kafka
  config.vm.network :forwarded_port, guest: 2181, host: 2181 #Zookeeper
  config.vm.network :forwarded_port, guest: 2888, host: 2888 #Zookeeper
  config.vm.network :forwarded_port, guest: 3888, host: 3888 #Zookeeper
  config.vm.network :forwarded_port, guest: 9042, host: 9042 #Cassandra CQL
  config.vm.network :forwarded_port, guest: 9160, host: 9160 #Cassandra Thrift
  config.vm.network :forwarded_port, guest: 7199, host: 7199 #Cassandra JMX (TODO - confirm)


  config.vm.provider :virtualbox do |vb|
    # headless mode
    vb.gui = false
  
    # Use VBoxManage to customize the VM.
    # See http://www.virtualbox.org/manual/ch08.html#idp56624480
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--cpus", "4"]
  end
 
  config.vm.provision "docker" do |d|
    d.pull_images "sw1nn/kafka","sw1nn/zookeeper","sw1nn/datastax-cassandra"
    
    d.run  "zk", image: "sw1nn/zookeeper:3.4.5", args: "-name zk"
    d.run  "kafka", image: "sw1nn/kafka:2.8.0-0.8.0", args: "-name kafka -link zk:zk"
    d.run  "cassandra", image:"sw1nn/datastax-cassandra:1.2.12", args: "-name cassandra -link zk:zk"
  end

end
