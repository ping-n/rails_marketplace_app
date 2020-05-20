# Shoes4All

---

### About Us

---

Shoes4all is a two-sided marketplace web application with the goals of providing shoes collectors, sneaker heads and hype beasts with a platform to resell brand new or used shoes to other collectors seeking to expand their shoes collection.

## Table of Contents:

---

| #   | Content                                                  |
| --- | -------------------------------------------------------- |
| 1   | [Links & installation guide](#links--installation-guide) |
| 2   | [Purpose & Problem](#purpose--problem)                   |

## Links & installation guide

### Github Repository

---

https://github.com/ping-n/rails_marketplace_app

### Heroku

---

https://shoes4all.herokuapp.com/

### Installation

---

1: Clone the this repository through git or download as a zip file

2: Install Progresql as this app uses Progresql for Database

3: Change into the directory and run the following command in terminal:

```
 yarn install
```

```
bundle install
```

4: Make sure Progesql is on and run the following command in teh order listed:

```
rails db:create

rails db:migrate

rails db:seed
```

5: Now that we have created and seeded the data base, run the following command to start the application:

```
rails s
```

- The command start up the local server for testing which we can access the application in the local browser through inputting address below:

```
http://localhost:3000/
```

#### Testing accounts

| #   | Account Type | Email          | Password  |
| --- | ------------ | -------------- | --------- |
| 1   | Admin        | admin@mail.com | shoes123  |
| 2   | User         | h@mail.com     | password1 |
| 3   | User         | p@mail.com     | password2 |

#### Special access

- Admin can access the admin dashboard with by adding /admin to url from the home page

```
http://localhost:3000/admin

https://shoes4all.herokuapp.com/admin
```

## Purpose & Problem

---

Shoes4All is created to be platform for people to sell their limited edition shoes in a safe environment without having to risk meeting and arranging sales through a face to face exchange.

There are many existing problems in the current environment for people who wishes to resell their shoes which are listed below:

- The main method method for selling limited collection shoes is through social media groups on Facebook or selling them through consignment stores such as Kickstw and Secret Sneaker Store.
- The main problem from arise from selling in through social group is the risk of people giving false offers and the risk of being rob when doing face to face sale.
- People who lack negotiation skills might be taken advantage of by those who are more knowledgeable regarding the real value of the shoes for sale.

Benefit of Shoes4All

- Create a platform for people to quickly buy and sell shoes
- Safe environment for payment transaction to take place
- A clean and nice looking web application for people to browse and purchase shoes
- All user information is safely stored and protected
- All sale is done through a trusted platform i.e Stripe
- Once the transaction is complete, seller will be paid according to the sale amount minus a 3% fee for using the platform which way cheaper than other platforms.

In conclusion Shoes4All is an upcoming shoes reselling platform that is accessible to anyone with internet, users will need to make an account to purchase but guest will be able to browse the listings
without having to sign up. Shoes4All will allow those to chose to registered the benefit to create listings for shoes that they wish, the sale will be anonymous and they will receive their payment once
the transaction goes though safely. Shoes4all enable user to buy and seller at the comfort of their own home, without having to risk making face to face sales and list the product at the price they wishes
to sell which they can change anytime.