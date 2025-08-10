FROM elixir:otp-28-alpine

# Install Hex + Rebar (build tools)
RUN mix local.hex --force && \
    mix local.rebar --force

# Install dependencies for compilation
RUN apk add --no-cache build-base git sqlite-dev

WORKDIR /app

ENV MIX_ENV=container
ENV PORT=8080

# Copy mix files and install deps (cached if no changes)
COPY mix.exs mix.lock ./
COPY config config

RUN mix deps.get

COPY lib lib
COPY priv priv

RUN mix compile
RUN mix ecto.create
RUN mix ecto.migrate
RUN mix run priv/repo/seeds.exs
RUN mix release

EXPOSE 8080

CMD ["_build/container/rel/pokedex_api/bin/pokedex_api", "start"]
