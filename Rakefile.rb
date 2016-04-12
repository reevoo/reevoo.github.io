$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')

require 'soapbox_comment_linker'

desc 'Load content_id for posts without content id, build and serve'
namespace :jekyll do
  task :serve do
    # TODO: Soapbox is not working so we need to avoid generating ids
    #       (https://github.com/reevoo/reevoo.github.io/issues/90)
    # SoapboxCommentLinker.link
    sh 'jekyll serve --port 4001'
  end
end
