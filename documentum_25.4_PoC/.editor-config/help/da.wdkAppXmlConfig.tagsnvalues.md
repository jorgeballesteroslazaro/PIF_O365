### Supported Locales

<!-- Variable Description -->
Syntax for supported locales. Documentum Administrator supports both English and Japanese language pack application.

#### Variable Location
```yaml
# documentum/config/configuration.yml
da:
  wdkAppXmlConfig:
    tagsnvalues:
      - application.language.supported_locales.locale=[en_US]
      - application.language.default_locale=en_US
      - application.authentication.enableskipsso=true
```
<br>

#### Additional Information
* **Notes**:
* 1. The application.language.supported_locales.locale property is used for the supported locales. The supported locales are en_US for U.S English and ja_JP for Japanese.
     By default, the application.language.supported_locales.locale property is set to [en_US] within the square brackets. If you want to add Japanese as a
     supported locale, add ja_JP separated by a comma within the square brackets.
     For example, application.language.supported_locales.locale=[en_US, ja_JP].
* 2. The application.language.default_locale property is used for the default locale. The default locale is en_US. If you want to change the default locale to Japanese,
     set the value of application.language.default_locale to ja_JP.
* 3. Remove the comment from the following lines if you are using the Documentum Administrator pod for asynchronous write operations:
     application.contentxfer.accelerated-write.enabled=true application.contentxfer.accelerated-write.bocswrite-mode=default-async application.contentxfer.
     accelerated-write.allowoverride-bocs-writemode=true