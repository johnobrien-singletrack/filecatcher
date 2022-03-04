require 'faraday'

desc 'Throw a file for server to catch'

task :throw do
  file_path = './spec/fixtures/sample.pdf'
  file_contents = File.read(file_path)
  connection = Faraday.new(url: 'http://localhost:3000')

  response = connection.post('/catch') do |req|
    req.headers['Content-Type'] = 'application/pdf'
    req.headers['X-Content-Filename'] = 'sample.pdf'
    req.body = file_contents
  end

  puts response.body
end
