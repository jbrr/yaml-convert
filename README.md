# YAML convert

In the process of doing some I18n work, I ran into an issue where the translation company sent back a translation file where all the keys are messed up. They sent us this format:

```
admin/label/title: "Title"
```

As opposed to this:

```
admin:
  label:
    title: "Title"
```

This should take in the former and convert it to the latter. It's not perfect, suggestions are always appreciated.
