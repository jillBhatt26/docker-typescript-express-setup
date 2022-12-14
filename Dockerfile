FROM node:16.16.0-alpine as development

WORKDIR /app

COPY ./package*.json ./

RUN npm ci

COPY ./ ./

RUN npm run build


FROM node:16.16.0-alpine as production

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /app

COPY ./package*.json ./

RUN npm ci --only=production

COPY --from=development /app/dist ./dist

CMD [ "node", "./dist/index.js" ]