# todo

TECHNOLOGIES USED

PHP 5.6.15
MySQL V15.1 Distribution 10.1.9-MariaDB
Composer
Symfony2

INSTALLATION INSTRUCTIONS

clone https://github.com/mokgosi/todo.git 

Then cd to "todo" and run the following composer command to install vendors
    $ composer update

Then open app/config/parameters.yml and change the following to your settings
    database_host: 127.0.0.1
    database_port: 3306
    database_name: todo
    database_user: root
    database_password: null

Then run the following command to create database
    create database todo;

Then run todo.sql to create tables and populate the db with test data.

==

RUNNING & TESTING THE APP

Open console, cd to into todo folder and run the following command
    $ php app/console server:run

This will run php built-in server

Then on you browser navigate to: http://localhost:8000

login as 
    username: admin
    password: admin
    
    or 

    username: user
    password: user
    
That's it 

