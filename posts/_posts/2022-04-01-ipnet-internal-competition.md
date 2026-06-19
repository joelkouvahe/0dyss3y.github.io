---
layout: page
title: Achievements
icon: fas fa-trophy
order: 2
---

Mes principales réalisations, certifications et distinctions académiques ou professionnelles.

---

## 🏆 Réalisations

{% assign achievement_posts = site.posts | where_exp: "post", "post.categories contains 'Achievements'" | sort: "date" | reverse %}

{% if achievement_posts.size == 0 %}
  <p>Aucune réalisation enregistrée pour le moment. Revenez plus tard !</p>
{% else %}
  {% for post in achievement_posts %}
    <div style="display: flex; gap: 20px; margin-bottom: 30px; align-items: flex-start; border-bottom: 1px solid #eee; padding-bottom: 20px;">
      
      <!-- Image de la réalisation (si définie) -->
      {% if post.image %}
        <div style="flex: 0 0 150px;">
          <a href="{{ post.url }}">
            <img src="{{ post.image }}" alt="{{ post.title }}" style="width: 100%; height: auto; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">
          </a>
        </div>
      {% endif %}

      <!-- Contenu texte -->
      <div style="flex: 1;">
        <h3 style="margin-top: 0;">
          <a href="{{ post.url }}">{{ post.title }}</a>
        </h3>
        <p style="color: #666; font-size: 0.9em; margin: 5px 0;">
          {{ post.date | date: "%d %b %Y" }}
        </p>
        <p>{{ post.excerpt | strip_html | truncatewords: 25 }}</p>
        <a href="{{ post.url }}" style="display: inline-block; margin-top: 5px; color: #007bff; text-decoration: none;">Lire la suite →</a>
      </div>

    </div>
  {% endfor %}
{% endif %}
