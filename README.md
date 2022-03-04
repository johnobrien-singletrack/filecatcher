POC for accepting file contents via API.

Two files of interest:
- `lib/tasks/throw.rake`: A rake task to send a file's raw content via POST
- `app/controllers/catch_controller.rb`: A controller to decode the content and write the file locally

Usage:
```
bundle install
bundle exec rails s
bundle exec rake throw
```
The sample pdf from `spec/fixtures` should have been reproduced in `tmp`.
