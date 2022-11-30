![Microverse](https://img.shields.io/badge/-Microverse-%20%236f23ff?style=for-the-badge)

![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)

# Rubycal - Blog Web App 🗒️✏️

> This project creates a fully functional blog app website that shows the list of posts and empower readers to interact with them by adding comments and liking posts. Made with Ruby on Rails

## Database ERD Diagram :memo:

![](./blog_app_erd.png)

## Built With :hammer_and_wrench:

- **Ruby** Popular programming language that’s used for lots of things, from web app development to data analysis.
- **Gitflow** Correct use of Branches for deployment and features development
- **Linter checks (rubocop)** Local and Pull Request check for errors, bugs and stylistic errors in code
- **Rails** [v 7.0.4] - A server-side web application framework written in Ruby under the MIT License
  -- **PostgreSQL** A powerful, open source object-relational database system

## Getting started

### Clone the repository

```shell
git clone https://github.com/mullenlucas/blog-app.ror.git
cd blog-app-ror
```

### Check your Ruby version

```shell
ruby --version && irb
```

The ouput should start with something like `ruby 3.1.2`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 3.1.2
```

- Run `bundle install`
- Run `rails server`
- Open Browser `http://localhost:3000/`
- Ensure you have PostgreSQL installed before running the application `psql --version`
- Run `rails db:create`.
- Create a `.envs` file using the link to host postgres credentials.

### Testing

To test and utilize the code, use the terminal and run ruby by inputting `irb` in the command line, or by using an extension in Visual Studio Code like _Code runner_

The user then can modify and play with the files as needed

<!-- ### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
``` -->

## Authors

👤 **Lucas Mullen**

- GitHub: [@mullenlucas](https://github.com/mullenlucas)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/lucas-mullen-447312119/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- To all the collaborators for the Readme Template
- The Microverse Team

## 📝 License

This project is [MIT](./LICENSE.md) licensed.
