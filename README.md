Essa API demonstra o uso de uma aplicação para um jogo de perguntas e respostas.


## Install

    bundle install

## Run the data base

    rails db:create

## Run the migrations

    rails db:migrate

## Run the app

    rails s

## Run the tests

    rspec

# REST API

## Create a round

### Request

`POST /rounds`


## Get a round

### Request

`GET /rounds/:round_id`


## Get result of a round

### Request

`GET /rounds/:round_id/result`

## Create a answer for a round

### Request

`POST /rounds/:round_id/answers`

## Get a list from categories

### Request

`GET /categories`
