FROM node:20-alpine AS base

# ---- deps ----
FROM base AS deps
WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install

# ---- build ----
FROM base AS build
WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN yarn build  # produces ./build for adapter-node

# ---- runner ----
#FROM base AS runner
#WORKDIR /app
#
## copy only what's needed to run
#COPY --from=build /app/build ./build
#COPY package.json yarn.lock ./
## install only production deps (no dev)
##RUN yarn install --production --frozen-lockfile --non-interactive
#
##ENV NODE_ENV=production
##ENV HOST=0.0.0.0
##ENV PORT=4001
#
#
#EXPOSE 4001
##CMD ["node", "server.js"]
#CMD ["node", "build"]

# ---- runner ----
FROM base AS runner
WORKDIR /app
ENV NODE_ENV=production
ENV HOST=0.0.0.0
ENV PORT=4001
COPY --from=build /app/build ./build
COPY package.json yarn.lock ./

EXPOSE 4001
# adapter-node entrypoint (there is NO server.js)
CMD ["node", "build"]