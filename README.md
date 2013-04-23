# Overview

**rapid-mbaas** is an open source back-end framework for faster and easier mobile development. It is built on top of most powerful open source solutions for backend, analytics, push notifications, and going to be extended with new capacities that are usually needed while building the powerful applications.

# Components

* **baasbox** - provides general backend services for mobile developers. More: [http://www.baasbox.com/](http://www.baasbox.com/)
* **countly** - open source analytics server. More: [http://count.ly/](http://count.ly/) 
* **pushd** - push server for versatile mobile platforms. More: [https://github.com/rs/pushd](https://github.com/rs/pushd)

# Installation
1. Clone git repository `git clone https://github.com/Cogniance/rapid-mbaas.git && cd rapid-mbaas/`
2. Install chef-solo gem `sudo gem install chef --no-ri --no-rdoc`
3. Launch it `sudo chef-solo -c solo.rb -j dna.json` 
*(It can take some time. All recipes have been tested on Ubuntu Server 12.04)*
