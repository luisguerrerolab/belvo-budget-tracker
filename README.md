# Budget Tracker
 You can have a rich life while living below your means. Budget Tracker can help you.

 > This project is my solution to the challenge requested by Belvo, as part of the postulation process for the Integrations Engineer role.

## App Summary

This project simulates a tool that help users to stay on track of a budget that they previously established. This app integrates with Belvo in order to fetch the user's financial data from some bank, which then will be shown along with the predefined budget preferences, so the user can see at glance how much is still left to spend.

## Main Features

- **Connect Widget**. The app starts with a welcome message and a button to launch the bank sync. The widget was configured to show institutions from Mexico only. Once the user enters a set of valid credentials, the generated link is stored in the session scope of the application.
- **Belvo Resources implemented**. The exploration stage of the API was done thanks to the —incredibly— useful Postman Collection posted in the Resources section. The app was built using Ruby on Rails with the purpose of being able to implement the Belvo SDK for Ruby.
- **A walk for the Belvo API**. The budget tracker app make calls to the following API resources:
  - _Owners_. Basic personal details were fetched from this resource in order to show a profile section.
  - _Balance_. A bar chart shows the accounts balance from the last 30 days.
  - _Accounts_. The app assumes that a user defined a limit on expenses for each of the accounts that the API returns. The user can see how much has spent and how much is left to spend.
  - _Transactions_. In another page, the user can se listed all their expenses in the last 30 days.
- **Rinse and repeat**. If you want to see the bank information of another user, you just have to log out and start the process again.

## Extra Features

- **Public access**. You can see the app live by clicking [here](https://belvo-challenge-luisguerrero.herokuapp.com/).
- **Docker**. The project repository contains the configuration to set up and run the app with Rails and PostgreSQL.

## How to run

The simplest way to give this app a try is to go directly to the [public website](https://belvo-challenge-luisguerrero.herokuapp.com/).

If you want to run this app using a Docker container, the following is a quick guide to fire it up.

### Build and Run

The first step is to set your secret API Keys as environment variables, so they can be passed through the configuration files to the app. Place your own values here:
https://github.com/luisguerrerolab/belvo-budget-tracker/blob/4d7c51915b39941278ee740237f7961c4dbbf6c8/app-variables.env

In order to build the image specified in `Dockerfile` run the following command:
```
docker-compose build
```
You can now launch the app:
```
docker-compose up
```
The last step is to create the database. Run the following command from another terminal:
```
docker-compose run web rake db:create
```

### Open the dockerized app in the browser

Cool! Now you can see the app running on the port 3000 on your Docker app.
