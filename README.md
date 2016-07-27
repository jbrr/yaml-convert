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

##Usage

* Clone the repo
* Make sure `/bin/yc` has executable permissions (`chmod +x yc`)
* run `./bin/yc <input YAML> <output file> <optional: language key>`
* `language key` can be whatever you want the whole output YAML nested under. For example, if you're creating an Italian translation file, you can use `it`, and the whole resulting YAML file will be nested under the key `it:`
