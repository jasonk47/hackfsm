HackFSM Rails
=============
Development
-----------
1. Get a Unix environment if you don't have one. 
[Vagrant](http://www.vagrantup.com/) plus 
[VirtualBox](https://www.virtualbox.org/) is a nice choice. The following 
instructions are for an Ubuntu box.

2. Install curl if you don't have it:

  ```
  sudo apt-get install curl
  ```

3. Set up [rvm.io](http://rvm.io). Recommend the following command to get both
Rails and rvm. For some reason my installation always hangs at some rdoc thing,
I've hit ^C before and I've been fine.

   ```
   \curl -sSL https://get.rvm.io | bash -s stable --rails
   ```

4. Set up MySQL.

  ```
  sudo apt-get install mysql-server
  sudo apt-get install libmysqlclient-dev
  ```
  
  In installation, leaving the root password blank makes things easy.

5. Clone this project. Then:

  ```
  bundle install
  rake db:create
  rake db:migrate
  ```
  
6. Start the Rails server with:

  ```
  rails server --port=3000
  ```
