# Repo for easier reproducing of Treafik issue

## Configuration

1. Adjust your `/etc/hosts` file like this:

    ```sh
    192.168.x.xxx    hello-dev.myserver.com
    192.168.x.xxx    hello.myserver.com
    ```

1. create a docker proxy network:

    ```sh
    docker network create proxy
    ```

1. import `root-ca.crt` into your browser
1. run `docker-compose up`

## Reproduce

1. Navigate to `https://hello.myserver.com` -> Page not shown. Client Certificate requested. GOOD
1. Navigate to `https://hello-dev.myserver.com` -> Page shown. GOOD
1. Navigate to `https://hello.myserver.com` -> Page shown. BAD
1. Clear browser
1. Navigate to `https://hello.myserver.com` -> Page not shown. Client Certificate requested. GOOD