# Social Media Website

<br />
<p align="center">
  <a href="https://github.com/simandebvu/private-events">
    <img src="rails-image.jpg" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Social Media</h3>

  <p align="center">
    This project consists of building a social media website.
    <br />
    <a href="https://github.com/ricardo123321/Social-media-website"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/ricardo123321/Social-media-website">Report Bug</a>
    ·
    <a href="https://github.com/ricardo123321/Social-media-website">Request Feature</a>
  </p>
</p>

![screenshot](./app_screenshot.png)

## Built With

- Ruby On Rails
- VSCode
- Rubocop 
- Sticker
- Github Actions
- Postgresql

## Live Demo

[Live Demo Link](#)


<!-- INSTALLATION -->
## Usage

To have this app on your pc, you need to:
* have Ruby & Ruby on Rails installed in your computer
* [download](https://github.com/ricardo123321/Social-media-website/archive/development.zip) or clone this repo:
  - Clone with SSH:
  ```
    git@github.com:simandebvu/private-events.git
  ```
  - Clone with HTTPS
  ```
    https://github.com/ricardo123321/Social-media-website.git
  ```
* and open the terminal inside the repo and run the bundler
  - ```$ bundler install --without production```
* then, run rails db:migrate. This creates the database with the corresponding tables, columns and associations
  - ```$ rails db:migrate```
* then, run rails s. This will start the server at localhost `http://127.0.0.1:3000/`
  - ```$ rails s```
* and finally, you can test it in the console by running
  - ```$ rails console --sandbox```
  
  ## IMPORTANT

** We used the Figaro gem to store credentials for use with POSTGRES. Therefore, we used SECRET KEYS stored in environment variables on my development and production servers.**

- So if you have postgres credentials create a file an application.yml file inside config/ and put this your credentials in it like showing bellow:

```ruby
DB_USERNAME: your_postgres_username
DB_PASSWORD: your_postgres_password
```

  
<!-- AUTOMATED TEST -->
### Automated Test

> There are no Automated Test for this project yet

## Authors

👤 **Shingirayi Mandebvu**

- Github: [@simandebvu](https://github.com/simandebvu)
- Twitter: [@simandebvu](https://twitter.com/simandebvu)
- Linkedin: [linkedin](https://linkedin.com/in/simandebvu)
 
👤 **Ricardo Vera**

- Github: [@ricardo123321](https://github.com/ricardo123321)
- Twitter: [@ricardo123321](https://twitter.com/ricardo123321)
- Linkedin: [linkedin](https://linkedin.com/in/ricardo123321)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse


## 📝 License

This project is [MIT](lic.url) licensed.
