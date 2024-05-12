# Nginx Gateway Microservice Template

This template contains a complete stack utilising a `Laravel` API and `React` frontend with frontend `TypeScript` configured.

# Why Use This Template?

## Modularity

This template is completely modular. By default you will be able to spin up a Fullstack
application with an `Nginx` gateway, but that doesn't mean you have to stick with that.
You can spin up the client or API on their own perfectly reasonably using `docker-compose`
or their respective `Makefiles`. Using the `Makefiles` you don't even need to change the
structure of the project for a simple `client\api` service, just want a Client? you can
simply use the Client directory on it's own, want an API with a database but no client?
delete the client directory! want to add your own database? remove the DB step!
don't want the API gateway? simply remove the infrastructure! customise it to suite your
needs.

## Ease of Use

You can pull this template, run make, and have a dev environment ready to play with.

## Testing Ready

All the pain of setting up RTL with Vitest is done. In future versions we will
also have tests for the `API` ready to go. There are also some eslint rules
tailored to preferences used at a professional organisation.

## Fun!

You can learn to set up more advanced `docker-compose` files by simply studying
the layout of this project. In the future we may decide to orchestrate these
containers with `Kubernetes` or `Docker Swarm`. We would also like to get some
automated CIs running.

# Usage

- To run this project for `development` with the `gateway` run: `make all`
- To run this project for `development` without the `gateway` run: `make dev`
- To run this project for `production` run: `make all` but remove the EXPOSED ports in the service containers

# Ports

The ports are exposed for development on `3000` and `8081`. These ports should not be exposed
on production, instead you should allow the gateway to forward traffic in the network. The reason
for this is that the direct access to the application is faster for development.

- Client: `8080` || `3000`
- API: `8080/api/` || `8081`

When heading into production traffic to the API can be restricted by uncommenting this line in the `default.conf`:

<pre>
# allow nginx-gateway;
# deny all;
</pre>

This will deny direct traffic to the API such that the API will only be accessible via the `nginx-gateway`, this tends
to be safer and more secure, thus, all of your API requests should be built to access via the `nginx-gateway` if you
intend on using it, the open port is meant for testing locally only.


# Technologies
- `Laravel`
- `Node`
- `React`
- `TypeScript`
- `Vite`
- `Nginx`
- `Jest`
- `React Testing Library`
- `Jest`
- `JestDom`
- `Vitest`
- `Nodemon`
