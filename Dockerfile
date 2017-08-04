FROM node:6-alpine

# grab su-exec for easy step-down from root
RUN apk add --no-cache 'su-exec>=0.2'

COPY package.json /api/
WORKDIR /api

RUN set -ex; \
	chown -R node:node "/api"; \
  apk add --no-cache --virtual .deps git; \
  npm install; \
  npm cache clean; \
  apk del .deps

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3000
CMD ["node", "index.js"]
