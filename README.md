HackFSM Rails
=============
Development
-----------
1. This tutorial assumes the use of a Unix environment.

2. Install curl if you don't have it:

  ```
  sudo apt-get install curl
  ```

3. Set up [rvm.io](http://rvm.io). The following command is recommended to get 
both Rails and rvm. The installation might hang at some rdoc thing; if this
hapens, just hit ^C and you should be fine.

   ```
   \curl -sSL https://get.rvm.io | bash -s stable --rails
   ```

4. Set up MySQL:

  ```
  sudo apt-get install mysql-server
  sudo apt-get install libmysqlclient-dev
  ```
  
  In installation, leaving the root password blank makes things easy.

5. Clone this project:

  ```
  git clone https://github.com/jasonk47/hackfsm.git
  ```

6. Then set up Ruby dependencies and the database:

  ```
  bundle install
  rake db:create
  rake db:migrate
  rake db:seed
  ```
  
7. Start the Rails server with:

  ```
  rails server --port=3000
  ```

8. To visit the website, open a web browser and enter:

  ```
  localhost:3000
  ```
