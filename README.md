# Pet management System

This is the rails-version of the pet management system. For this time,
there will be other model which is called as "Clinic".
Owner could login this application via either Facebook or local sqlite.

## Instruction

`bundle install`

Install all the necessary gems for this application. Especially, 'omniauth' and
'rails-erd' are used for this application. 'omniauth' is to get login information
from Facebook, and 'rails-erd' was used for having model diagram for this app.

`rake db:migrate`

Migrate the database which is described in `db/migrate` folder.

`rake db:seed`

Seed some datas into sqlite3. In this example, I put 4 clinics.

`thin start --ssl`

This command is for running the server to run this application on the web.
It will show the URL address to access. Make sure that it contains `https` protocol.
It should be `https`, not `http`. In my example, it was `https://0.0.0.0:3000`.

* Make sure that create your own `.env` file in the project.
It should include `FACEBOOK_KEY= <<YOURS>> FACEBOOK_SECRET= <<YOURS>>`


## Development Environment

OS: MAC OS 10.14 or Lubuntu 16.04 Web browser: Chrome 73.0  

## License

Under the MIT License

## Reference

`https://github.com/Joeycho/sinatra-pet-management-system`

`https://github.com/learn-co-curriculum/has_secure_password_lab`

`https://github.com/Joeycho/omniauth_lab-v-000`

## Feedback

Helper methods are usually used for moving logics from views. For controller, applicationController will take repetitive code for other controllers. Partial views also take some repetitive code from other view pages. Plus, remember how to use 'build' and 'find_or_create_by' functions, such as 'owner.pets.build'.
