FROM denoland/deno:1.23.4 as builder
RUN apt update \
  && apt install -y curl \
  && curl -L https://go.dev/dl/go1.18.4.linux-amd64.tar.gz -o go1.18.4.linux-amd64.tar.gz \
  && rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.4.linux-amd64.tar.gz
ENV PATH="${PATH}:/usr/local/go/bin"
RUN go install github.com/googlecodelabs/tools/claat@latest

FROM denoland/deno:1.23.4 as runner
ARG claat_auth
ENV CLAAT_AUTH_TOKEN=$claat_auth
COPY --from=builder /root/go/bin/claat /usr/local/bin/claat
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY main.ts .
CMD ["run", "-A", "main.ts"]