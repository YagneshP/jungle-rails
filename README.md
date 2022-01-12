
<!-- PROJECT LOGO -->
<br />
<div align="center">
  <h1 align="center">Jungle</h1>
  <p align="center">
    A mini e-commerce application built with Rails 4.2.
  </p>
</div>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Dependencies</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#additional-steps-for-apple-m1-machines">Additional Steps for Apple M1 Machines</a></li>
        <li><a href="#setup">Setup</a></li>
        <li><a href="#stripe-testing">Stripe Testing</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

Jungle is an e-commerce application built with Rails 4.2. User can buy weirdest things from this site.While building this site i have learned about rails on ruby. 
<p align="right">(<a href="#top">back to top</a>)</p>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe


<p align="right">(<a href="#top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started


### Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

### Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

### Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

### User can add products to the cart
Users can add the product in cart

<img src='https://github.com/YagneshP/jungle-rails/blob/master/docs/add_product_in_cart.gif'>

### User can edit quantity 
Users can edit quantity of product in order page.

<img src='https://github.com/YagneshP/jungle-rails/blob/master/docs/change_quantity_in_order.gif'>

### User can pay with credit card
Users can pay the total amount of the products with help of credit card(stripe).

<img src='https://github.com/YagneshP/jungle-rails/blob/master/docs/pay_with_stripe.gif' >

### Admin has right to change the products and categories.
Only admin can edit/add and delete the products/categories.

<img src='https://github.com/YagneshP/jungle-rails/blob/master/docs/admin.gif' >

<p align="right">(<a href="#top">back to top</a>)</p>




