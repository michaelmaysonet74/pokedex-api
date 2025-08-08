FROM elixir:otp-28-alpine

# Install Hex + Rebar (build tools)
RUN mix local.hex --force && \
    mix local.rebar --force

# Install dependencies for compilation
RUN apk add --no-cache build-base git

WORKDIR /app

# Copy mix files and install deps (cached if no changes)
COPY mix.exs mix.lock ./
RUN mix deps.get --only prod

COPY . .

ENV MIX_ENV=prod
ENV PORT=8080

RUN mix compile
RUN mix release

EXPOSE 8080

CMD ["_build/prod/rel/pokedex_api/bin/pokedex_api", "start"]
