FROM rust:1.40-alpine AS build

ARG APP=lerova

WORKDIR /opt

COPY .cargo ~
COPY . .

RUN cargo build --release

FROM debian:buster-slim AS publish

WORKDIR /opt

COPY --from=build /opt/target/release/lerova /opt/lerova

ENTRYPOINT exec /opt/lerova
