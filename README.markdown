# uploadd
Minimal file upload daemon using [Rainbows](http://rainbows.rubyforge.org)

Rails plugin here: [paperclip_uploadd](http://github.com/capotej/paperclip_uploadd)

### Installation

    gem install rainbows
    gem install rack-contrib
    git clone git://github.com/capotej/uploadd.git


### Configuring
Edit `config.ru` and change `SECRET` to something secure, like the word "password"
    
### Running
    cd /path/to/uploadd
    nohup rainbows &

That's it! Now you should have a scalable upload server running on `:8080`

### Usage
Here's an example of how to use it (requires `httpclient` gem):

    HTTPClient.post 'http://localhost:8080/up', { :file => File.new('/path/to/file.jpg'), :filename => 'users/avatar/12, :secret => "redrum" }

### But is it fast?

[Video](http://www.twitvid.com/QQ9ZC) of the logs with 10 workers uploading images from another server


### Notes
Uploadd was written to be as simple as possible so it doesn't check for duplicates, it just overwrites. You can feed the filename param a deep directory structure and it'll create all the directories for you *below* the `UPLOAD_DIR` in `config.ru`

### Rails plugin
There is a Rails plugin that extends Paperclip to use Uploadd as a backend as opposed to S3 or the local file system, check out [paperclip_uploadd](http://github.com/capotej/paperclip_uploadd).
 
