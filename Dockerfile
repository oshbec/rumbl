FROM hexpm/elixir:1.11.2-erlang-23.1.3-alpine-3.12.1 AS compile

ENV MIX_ENV=prod
COPY . .

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get --only prod

RUN apk add --update nodejs npm
RUN npm install --prefix ./assets
RUN npm run deploy --prefix ./assets

RUN mix compile
RUN mix phx.digest
RUN mix release


FROM alpine:3.12.1 AS final
COPY --from=compile ./_build/prod .
CMD ["./rel/rumbl/bin/rumbl", "start"]
