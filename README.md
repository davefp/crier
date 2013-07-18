# CRIER

![](http://25.media.tumblr.com/tumblr_m7g8ppw16Z1rzupqxo1_r1_500.png)

## What is it?

Crier is an open-source server status service. Try saying that three times fast.

It allows you to quickly build a server status page that'll look a bit like this:

* [status.shopify.com]()
* [status.github.com]()
* [status.heroku.com]()

## Features

* Support for multiple service modules with different statuses
* API for updating the status from your favourite monitoring tool(s)
* Status history
* Custom messages detailing any issues

## Running

1. Clone the repo

2. Run `bundle` to install necessary gems

3. Run `rake db:migrate` to bootstrap the db

4. Run `rake db:seed` to get some component data into the db (there's no other interface for doing this right now)

5. Start the server `rails s`