---

layout: page
title: Achievements
icon: fas fa-trophy
order: 4
--------

A summary of my academic, professional, and cybersecurity milestones as I progress toward becoming a Red Team Operator.

---

## Professional Experience

{% assign exp_posts = site.posts | where_exp: "post", "post.categories contains 'Experience'" %}
{% for post in exp_posts %}

### [{{ post.title }}]({{ post.url }})

{{ post.excerpt | strip_html | truncatewords: 25 }}

[Read more]({{ post.url }})

{% endfor %}

---

## Cybersecurity Projects

{% assign project_posts = site.posts | where_exp: "post", "post.categories contains 'Projects'" %}
{% for post in project_posts %}

### [{{ post.title }}]({{ post.url }})

{{ post.excerpt | strip_html | truncatewords: 25 }}

[Read more]({{ post.url }})

{% endfor %}

---

## CTF & Labs

{% assign ctf_posts = site.posts | where_exp: "post", "post.categories contains 'CTF'" %}
{% for post in ctf_posts %}

### [{{ post.title }}]({{ post.url }})

{{ post.excerpt | strip_html | truncatewords: 25 }}

[Read more]({{ post.url }})

{% endfor %}

---

## Certifications

{% assign cert_posts = site.posts | where_exp: "post", "post.categories contains 'Certifications'" %}
{% for post in cert_posts %}

### [{{ post.title }}]({{ post.url }})

{{ post.excerpt | strip_html | truncatewords: 25 }}

[Read more]({{ post.url }})

{% endfor %}

---

## Academic Journey

{% assign academic_posts = site.posts | where_exp: "post", "post.categories contains 'Academic'" %}
{% for post in academic_posts %}

### [{{ post.title }}]({{ post.url }})

{{ post.excerpt | strip_html | truncatewords: 25 }}

[Read more]({{ post.url }})

{% endfor %}

