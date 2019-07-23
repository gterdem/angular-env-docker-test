# Angular Docker Environment Passing Test Application

This project was generated with [Angular CLI](https://github.com/angular/angular-cli). It is a basic angular app with nginx webserver running on docker. 

## Build

Run `ng build --prod` to build the project. Then run `docker-compose build` to build the image.

## Goal

Project has an appconfig.production.json file under asset folder. Aim is to change the urls configured here by the .env variables supplied by .env file before each container starts.

