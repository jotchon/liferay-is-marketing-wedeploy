# Liferay IS Marketing Wedeploy

This repo is to store wedeploy configs for webteam owned servers

## Running www.liferay.com

* Only run this next command for first initialization ONLY or if you want to start from scratch

```bash
./www-prod/scripts/init.sh
```

* Check that all your containers have a status of "up" with `docker ps -a`
* If they are not all up run this from the `www-prod` dir:

```bash
docker-compose down && docker-compose up -d --build && docker-compose logs -f
```

* You can also run the above command if your containers are not up

* In the `www-prod/docker-compose.yaml` file modify the last line of this section to be whereever your war files are being deployed to:

```yaml
  www_prod_liferay:
    container_name: www_prod_liferay
    depends_on:
     - "www_prod_mariadb"
    environment:
      - "VIRTUAL_PORT=8080"
    image: ryanschuhler/liferay:www-prod
    ports:
      - "8000:8000"
      - "11311:11311"
      - "12345:12345"
    user: liferay
    networks:
      - "www_prod_external"
      - "www_prod_internal"
    volumes:
      - "www_prod_liferay:/opt/java/liferay/data"
      - "./liferay/deploy:/opt/java/liferay/deploy"
```