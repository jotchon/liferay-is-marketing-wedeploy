# Liferay IS Marketing Wedeploy

This repo is to store wedeploy configs for webteam owned servers

## Running www.liferay.com

* Only run this next command for first initialization ONLY or if you want to start from scratch

```
./www-prod/scripts/init.sh
```

* Check that all your containers have a status of "up" with `docker ps -a`
* If they are not all up run this from the `www-prod` dir:

```
docker-compose down && docker-compose up -d --build && docker-compose logs -f
```

* You can also run the above command if your containers are not up