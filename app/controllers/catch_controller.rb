class CatchController < ApplicationController
  skip_before_action :verify_authenticity_token

  def catch
    file_contents = request.body.read
    filename = ActiveStorage::Filename.new(
      request.headers['X-Content-Filename']
    ).sanitized
    path = File.join('.', 'tmp', filename)

    handle = File.new(path, 'wb+')
    bytes = handle.write(file_contents)
    handle.close

    render json: { path: path, filename: filename, bytes: bytes }
  end
end
