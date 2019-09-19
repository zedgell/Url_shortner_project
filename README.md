# Url_Shortner
# README
<br />
<p align="center">
  <h3 align="center">Url Shortner</h3>

  <p align="center">
    A Url Shortner Built With Rails!
    <br />
    <a href="https://github.com/othneildrew/Best-README-Template"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/zedgell/Url_shortner_project/issues">Report Bug</a>
    ·
    <a href="https://github.com/zedgell/Url_shortner_project/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)



<!-- ABOUT THE PROJECT -->
## About The Project

This project will generate the shortest url. project is live on herkoku [click here to see](https://url-shortener-zedgell.herokuapp.com/)

To see json file of top 100 [vist here](https://url-shortener-zedgell.herokuapp.com/top.json)

The way the url is shortned:
* When a user submits the url its starts the proccess of creating a short url.
* The first proccess is checking to make sure its vaild. It does this by using [URI::http](https://docs.ruby-lang.org/en/2.1.0/URI.html).
* If it is not valid it throws a error.
* If it is valid it then checks for duplitcs in the db by by comparing the orignal urls. If the user types in https://www.google.com it will break the link down to look like google.com that way there can not be duplilcates because of https, http, or www.
* If there is a duplicate it will show you the extising link and add 1 to the total shortend count in the db.
* If there is not a duplicate then it will procced to create a short link by checking to see if it begins with http if it does then a warning will appear telling you its not seceure. it does not show warning if if it begins with https.
* It then creates the the new link in db and adds the original url and then adds 1 to the total times shortend.
* The link is decided by getting the id if the id is over 0 - 9 the the short link will be /idNumber if the id is over 9 but under or equal to 36 it will become a letter such as /a or /b if the id is over 36 it will become a letter number such a /a1 - /a9 or /b1 - /b9 and so on.
* The link is created using a refrence to the orginal url.
* After that it creats a message where it tells you the url was shortned successfuly if it saved.
* It then performs the background job of scraping the website to get the title of the webpage. It uses [Mechanize](https://www.rubydoc.info/github/sparklemotion/mechanize/master)for this purpose.
* After that it will redirect you to /show where you will see your shortend url and the page title.
* On the home page you will see the top 100. It first sorts the database by the total time shortend and then by the last modified date. So if two or more urls have the value for total times shortend it will display the last modified first.

### Built With
This section should list any major frameworks that you built your project using. Leave any add-ons/plugins for the acknowledgements section. Here are a few examples.
* [Ruby on Rails](https://rubyonrails.org/)



<!-- GETTING STARTED -->
## Getting Started

This is how you use the source code.

### Prerequisites

Software needed
* ruby -v 2.5.1
* rails -v 5.2.3
to install rails follow below
```sh
gem install rails -v 5.2.3
```

### Installation

1. Clone the repo
```sh
git clone https://github.com/zedgell/Url_shortner_project.git
```
2. Install gems
```sh
bundle install
```
3. Migrate db
```sh
rails db:Migrate
```
3. run program
```sh
rails s
```
