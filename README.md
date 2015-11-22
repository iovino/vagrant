Vagrant Default Setup

=========

A basic vagrant setup for local development.

## Installation

To install the Vagrant development environment, please make sure the following software is installed on your machine.

- [Virtual Box](https://www.virtualbox.org/)

- [Vagrant](https://www.vagrantup.com/)

- [Chef-DK](http://downloads.getchef.com/chef-dk)

- [RVM using Ruby >= 2.0.0](http://www.rvm.io)

- [Git](http://git-scm.com/downloads)

- [Node.js](http://nodejs.org/download/)

Vagrant needs a few plugins in order to build the box. You can install them by running:

    $ vagrant plugin install vagrant-omnibus

    $ vagrant plugin install vagrant-berkshelf

    $ vagrant plugin install vagrant-aws

    $ vagrant plugin install vagrant-foodshow

Clone the git repository.

    $ git clone git@divups.git.beanstalkapp.com:/iovino/vagrant.git && cd vagrant

Install the required cookbooks for this project by changing into the `vagrant` directory and running:

    $ berks install

*all cookbooks and their versions are maintained in the `devine/Berksfile`.*

At this point you can build the vagrant box using

    $ vagrant up

*The first time you run that command, vagrant will need to download a base box. This can take a few minutes depending on your internet connection.*

Once vagrant is done building the machine, you can visit the site in your browser by using the IP assigned in the `Vagrantfile`.

###### Common Vagrant Commands

`varant up`      starts and provisions the vagrant environment

`varant destroy` stops and deletes all traces of the vagrant machine

`varant ssh`     connects to machine via SSH

`varant suspend` suspends the machine

`varant resume`  resume a suspended vagrant machine

`varant reload`  restarts vagrant machine, loads new Vagrantfile configuration

---

## Ngrok

_Expose a local web server to the internet_

Vagrant will create a public tunnel to the box using ngrok accessible via `http://` __{boxname}__`.ngrok.com`. It will start a local ngrok process on your local machine. If that process is terminated (i.e. you restart your computer), you must vagrant destroy/up again to continue using ngrok.




