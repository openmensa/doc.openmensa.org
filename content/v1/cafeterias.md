---
title: Cafeterias | OpenMensa API
---

# Cafeterias API

## Authentication

You can read all data anonymously.

## List cafeterias

List all cafeterias:

	GET /cafeterias

### Response

<%= headers 200 %>
<%= json(:cafeteria) { |h| [h] } %>

## Get a single cafeteria

	GET /cafeterias/:id

### Reponse

<%= headers 200 %>
<%= json(:cafeteria) %>