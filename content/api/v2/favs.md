---
title: Favs | OpenMensa API
---

# Favs API

## Authentication

You need to be authorized by OAuth to read and write a user's favorites.

## List favs

List the current users favs:

	GET /favs

Note: the server tries to keep them sorted ascendingly but a client should not rely on this fact.

### Response

<%= headers 200 %>
<%= json(:fav) { |h| [h] } %>

## Get a single fav

	GET /favs/:id

### Response

<%= headers 200 %>
<%= json :fav %>

## Create

	POST /favs

### Input

canteen_id
: _Required_ **integer** - The referenced canteen.

index
: _Required_ **integer** - An index by which the favorites are sorted ascendingly.

Note: No index should occur more than once.

<%= json \
  :canteen_id => 1,
  :index => 6
%>

### Response

<%= headers 201 %>
<%= json :fav %>

## Edit

	PATCH /favs/:id

### Input

canteen_id
: _Optional_ **integer** - The referenced canteen.

index
: _Optional_ **integer** - An index by which the favorites are sorted ascendingly.

Note: No index should occur more than once.

<%= json \
  :index => 6
%>

### Response

<%= headers 200 %>
<%= json :fav %>

## Delete

	DELETE /favs/:id

### Response

<%= headers 204 %>
