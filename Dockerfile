FROM node:14 AS assets

COPY . .
RUN npm ci --prefix ./assets
RUN npm run deploy --prefix ./assets

FROM hexpm/elixir:1.11.2-erlang-23.1.3-alpine-3.12.1 AS compile

COPY . .
COPY --from=assets ./priv/static ./priv/static

ENV MIX_ENV=prod

RUN mix local.hex --force
RUN mix local.rebar --force

RUN mix deps.get --only prod
RUN mix compile

RUN mix phx.digest
RUN mix release

FROM alpine:3.12.1 AS final

COPY --from=compile ./_build/prod .

CMD ["./rel/rumbl/bin/rumbl", "start"]
