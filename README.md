Dockerfiles
===========

This is a repo of dockerfiles. Mostly just experiments really, nothing I'd rely on for anything.

Installation
============

+ Install [VirtualBox](http://virtualbox.org)
+ Install [Vagrant](http://vagrantup.com)
+ ``cd ${PROJECT_HOME}``
+ vagrant up

After copying copiously from the internet, you may have a virtual machine running with an instance of zookeeper, apache kafka and apache cassandra running in separate docker containers, cassandra and kafka should have visibility of the zookeeper instance. Standard ports should be forwarded to the host so you can access all the instances outside the vm. See [Vagrantfile](Vagrantfile) for details.

Nothing tested at present - Have fun, PRs more than welcome.

