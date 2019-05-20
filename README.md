# Camunda BPM minimal setup with Session Manager

This is a minimal setup based on a blog post written on [blog.camunda.com](https://blog.camunda.com).

### Get started
`docker-compose up`

This will spawn one redis instance, 2 Camunda BPM containers, and nginx as load balancer bound to localhost using the [session manager](https://github.com/magro/memcached-session-manager).

To test out how it works just visit `http://localhost/camunda` and login with the `demo:demo` credentials.
As we didn't define a database for Camunda BPM it is all kept in a local database per instance.

Now you can freely change up the name of the user and after refreshing a couple of times you will see that you are served by different instances but all sharing the same session.