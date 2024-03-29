# Ci2 - CRIS
Repository for the web app CI2-CRIS

## Check ongoing work in the Project Board
https://github.com/orgs/ci2-ipt/projects/2

## How to run app in containers
Note: Requires docker version >= 20.10.21 and docker-compose version >= 1.29.2. These are automatically installed as part of the script `0_install_requirements.sh`
- Run script `0_install_requirements.sh` located in `3_tools` to install docker & docker-compose
- Make sure docker & docker-compose is running
- Run script `1_run_local_docker.sh` located in `2_tools`. After that, you need to wait for the container installation to finish (yarn packages, migrations, etc.). You can view this live by following the rails container logs using the script `5_rails_container_follow_logs.sh`. The installation will take some time the first time, but after that it should be pretty quick
- Visit `http://localhost:3000` in your browser
- To check the containers, use `docker container ps`
- To restart the rails server, run the script `4_restart_rails_container.sh`
- To enter the rails container terminal, run the script `3_rails_container_terminal.sh`
- To stop the containers, run the script `2_stop_local_containers.sh`
- To constantly view the logs of the rails container, run the script `5_rails_container_follow_logs.sh`. To exit, press `Ctrl + C`

## Development Notes
- You need to restart the rails server everytime you make config changes to the server
- If any of the scripts fail, just try to run it again 2-3 times
- It is recommended to continuously monitor the rails container logs to be aware of any errors
- You might also have to run a combination of `rails db:drop`, `rails db:prepare` / `rails db:setup` and `rails db:migrate` when changing between different development branches.

## Entity Relationship Diagram

![erd](./1_src/erd.png? "ER Diagram")

The project is using rails-erd to generate the ERD using the models/db (see erd.png). The config is located at 1_src/.erdconfig and uses the graphviz library (added to Dockerfile). The erd is auto-generated on each `rails db:migrate` or `bundle exec rails db:migrate` but can be run manually using `bundle exec erd`.

## Dummy Data
- Check the the `1_src/db/seeds.rb` file for various development dummy data. You can run the seeds by running the `rails db:seed` command

## Deployment Notes
- A superadmin is created as part of the database migrations (email: `superadmin@app.com`, password: `password`). Please change the email and password of this user to the real superadmin's credentials from the application users dashboard before deploying to production!

## Branch Name Conventions:

- For naming branches, **only use lowercase** letters 
- For features: feature/ci2-cris-##/XXXX
- For bugs & fixes: fix/ci2-cris-##/XXXX

      Where:
      - ## => Ticket Number / ID
      - XXXX => Brief 3 to 6 word description of the ticket/issue based on its title
      
      Examples:
      - feature/ci2-cris-##/add-user-model
      - fix/ci2-cris-##/index-title-has-wrong-color

## PR Conventions:
- For naming PRs, **only use lowercase** letters
- Name PRs starting with the ticket name then a colon and a brief description, for example: `ci2-cris-22: implement user creation`
- Use GitHub interface to create PRs, do not use your local git commands or VS Code
- In GitHub
  - Don't forget to link the sprint to the PR ("Milestone" field)
  - Don't forget to link the project ticket to the PR (Add "Closes #22" to the description of the PR and github will automatically link it. Replace 22 with your ticket number)
# Sketch of ideas

![20221205_211943](https://user-images.githubusercontent.com/113514374/205775943-9ee4056a-c98f-4c66-a47c-de1ce866f71a.jpg)

