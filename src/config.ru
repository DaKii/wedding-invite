# frozen_string_literal: true

require 'hanami/boot'

use Rack::Static, urls: ['/assets'], root: 'public'

run Hanami.app
