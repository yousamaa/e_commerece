# Simple E-commerece Website
  User can buy products, using stripe payment. Moreover, This is a simple E-Commerece website developed using Rails 5.2.0. 
  I have used devise for user authentication. 
  I have used stripe for payment integration.
  Following are some details that would help you to get this app up and running in your system.


#### Ruby version
ruby 2.7

#### Rails version
rails 5.2

### System dependencies

#### Configuration
* Make sure to have ruby installed. You can check by running following command:
```console
$ ruby -v
```
* Make sure to have rails installed as well.
```console
$ rails -v
```
* Install and enable postgresql.
```console
$ sudo yum install postgresql-server postgresql-contrib
```
* Create postgres database cluster.
```console
$ sudo postgresql-setup initdb

```
* Install necessary gems.
```console
$ bundle install

```
* Create Stripe account and add stripe API in credentials.
```console
$ EDITOR=vim rails credentials:edit --environment=development

```
* Add card 5555 5555 5555 4444.

```
* Run following data to initialize DB with seed admin.
```console
$ rails db:seed

```
* Run Rails server.
```console
$ rails s

```
