# akariDiscs

Disc management for Akari Shop

### Install

1. Clone the repo.
2. Execute `bundle install`.
3. Execute `rake db:migrate`
3. For seed information, create a folder containing a 'catalog.csv' file with UTF-8 encoding as well as a 'covers' folder with the images for the discs covers.
4. Execute `rake import:catalog -- /import/path`.
5. Enjoy!
