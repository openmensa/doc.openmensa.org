---
title: Client Errors | OpenMensa API
---

# Client Errors

Accessing a non-existing resource:

<%= headers 404 %>

Sending invalid JSON/XML/MessagePack data in request body:

<%= headers 400 %>

Sending invalid fields or invalid field content in request body:

<%= headers 422 %>

Sending invalid parameters or invalid parameter content in request body:

<%= headers 422 %>
