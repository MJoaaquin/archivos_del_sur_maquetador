# Guía rápida de sintaxis Markdown

Ayuda memoria para recordar la sintaxis con la que escribir correctamente los libros para generar el PDF sin problemas

---

## 📌 Encabezados

Usá `#` para crear títulos. Cuantos más `#`, menor el nivel del título.

```markdown
# Título 1
## Título 2
### Título 3
#### Título 4
```

---

## ✍️ Estilos de texto

```markdown
*Itálica* o _Itálica_

**Negrita** o __Negrita__

***Negrita e itálica***

~~Tachado~~
```

---

## 📋 Listas

### Lista sin orden

```markdown
- Item 1
- Item 2
  - Subitem
* También funciona con asteriscos
```

### Lista numerada

```markdown
1. Primer item
2. Segundo item
   1. Subitem
```

---

## 🔗 Enlaces

```markdown
[Texto del enlace](https://ejemplo.com)
```

---

## 🖼️ Imágenes

```markdown
![Texto alternativo](./imagenes/nombre_de_la_imagen.png)
```

---

## `Código`

### En línea

```markdown
Este es un `código en línea`.
```

### Bloque de código

Usá triple tilde (```), y podés indicar el lenguaje para resaltado de sintaxis:

\`\`\`python
def hola():
    print("Hola mundo")
\`\`\`

---

## 💬 Citas

```markdown
> Esto es una cita.
```

---

## ➖ Separadores

```markdown
---
```

---

## ✅ Checkboxes

```markdown
- [x] Tarea completada
- [ ] Tarea pendiente
```

---

## 🧾 Notas al pie

### Sintaxis estándar (si el visualizador la soporta):

```markdown
Texto con nota al pie[^1].

[^1]: Esta es la explicación de la nota.
```

### Alternativa manual (más compatible):

```markdown
Texto con nota al pie [1].

...

[1]: Esta es la explicación de la nota.
```

---
