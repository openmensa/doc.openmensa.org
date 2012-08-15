---
title: Meals | OpenMensa API
---

# Meals API

## Authentication

You can read all data anonymously.

## List meals of a cafeteria

	GET /cafeterias/:id/meals

### Response

<%= headers 200 %>
<%= json(:meal) { |h| [h] } %>

## Get a single meal

	GET /cafeterias/:cafeteria_id/meals/:id

### Response

<%= headers 200 %>
<%= json(:meal) %>