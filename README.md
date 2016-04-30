# akariDiscs

Disc management for Akari Shop

### Install

1. Clone the repo.
2. Execute `bundle install`.
3. Execute `rake db:migrate`
3. For seed information, create a folder containing a 'catalog.csv' file with UTF-8 encoding as well as a 'covers' folder with the images for the discs covers.
4. Execute `rake import:catalog -- /import/path`.
5. Enjoy!

*Important:* Don't forget to delete the `.env` file and setup `$ADMIN_NAME` and `$ADMIN_PASSWORD` environment variables for production or just change the contents of the file for development.

### Configuration

- Native screen size: 682x400
- Extended screen size: 853x533
- Cover resolution: 764x1081
