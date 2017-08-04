FROM node:6-alpine

# grab su-exec for easy step-down from root
RUN apk add --no-cache 'su-exec>=0.2'

COPY . /api
WORKDIR /api

RUN set -ex; \
	chown node:node "/api"; \
  apk add --no-cache --virtual .deps git; \
  npm install; \
  npm cache clean; \
  apk del .deps

ENTRYPOINT ["/api/docker-entrypoint.sh"]

EXPOSE 2368
CMD ["node", "index.js"]
