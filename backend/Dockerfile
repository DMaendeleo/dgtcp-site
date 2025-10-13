FROM node:22-alpine AS base

# ---- deps ----
FROM base AS deps
WORKDIR /app

# pick the right installer from your lockfile
COPY package.json yarn.lock* ./
RUN yarn install --frozen-lockfile --non-interactive

# ---- build ----
FROM base AS build
WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules
COPY . .

# build Next.js
RUN yarn build

# ---- runner ----
FROM base AS runner
WORKDIR /app


# 👇 copy the generated runtime
COPY --from=build /app/.next/standalone ./
COPY --from=build /app/.next/static ./.next/static
# (optional if you use /public at runtime)
#COPY --from=build /app/public ./public

#ENV NODE_ENV=production
#ENV PORT=4000
#ENV HOSTNAME=0.0.0.0

EXPOSE 4000
CMD ["node", "server.js"]