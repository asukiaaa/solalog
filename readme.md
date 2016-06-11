# Solalog
A rails application for logging output from solar power plants.

# Requirements
* ruby(2.3.1)
* npm
* mysql

# Flow of deploying
For staging.
## Create .env file
```
cp .env.example .env.staging
```
Fill them for your environment.

## Create files for capistrano.
```
cd [solalog project directory]

cp Capfile_example Capfile
cp config/deploy.rb_example config/deploy.rb
cp config/deploy/staging.rb_example config/deploy/staging.rb
```

Please modify the files for your environment.

## Make shared dir for staging server.
```
bundle exec cap staging deploy
```
It fails deploying because lack of the following files.
However, shared dir will be created.

## Send files to shared directory
```
scp ./config/database.yml solalog_server:/var/www/staging/solalog/shared/config/
scp ./config/secrets.yml  solalog_server:/var/www/staging/solalog/shared/config/
scp ./.env.staging        solalog_server:/var/www/staging/solalog/shared/
scp ./.env.staging        solalog_server:/var/www/staging/solalog/shared/.env.production # as dummy
```

## Deploy files for creating db.
```
bundle exec cap staging deploy
```
It will fails at migration because you need to create db named solalog_staging.

## Create db
```
# In a server for staging.
cd /var/www/staging/solalog/releases/[some date]
bin/rake db:create RAILS_ENV=staging
```

## Deploy files again.
```
bundle exec cap staging deploy
```
It may finish if you satisfied requirements for this project.

## Start unicorn
```
bundle exec cap staging unicorn:start
```
You can see a staging app on browser if the connection between rails app and server app ( apache or nginx etc.. ) is succeeded.

# License
MIT