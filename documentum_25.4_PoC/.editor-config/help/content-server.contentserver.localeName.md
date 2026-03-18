### Documentum CM Server Language Code

<!-- Variable Description -->

Locale of Documentum CM Server.

#### Variable Location

```yaml
# documentum/config/configuration.yml
content-server:
  contentserver:
    localeName: en
```

<br>

#### Additional Information

- **Notes**:
- 1. The supported locales are `en`, `ar`, `de`, `es`, `fr`, `it`, `ja`, `ko`, `nl`, `pt`, `ru`, `sv`, `zh` and `he`.
- 2. From the 22.1 release, you can configure multiple languages for Documentum CM Server. To select multiple languages, use language codes separated by comma.
- 3. For example: localeName = en, de, es
- 4. For more information about populating and publishing the data dictionary, see OpenText Documentum Content Management - Server Administration and Configuration Guide.
