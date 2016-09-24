require 'gnuplot'
require 'benchmark'
require 'rantly'
require 'faker'
require 'ruby-progressbar'

require 'graph/function/version'
require 'graph/function/reformat_string'
require 'graph/function/plot_config'
require 'graph/function/only'
require 'graph/function/comparison'
require 'graph/function/ints_comparison'

module Graph
  module Function
    # https://robots.thoughtbot.com/mygem-configure-block
    class << self
      attr_accessor :configuration
    end

    def self.configure
      self.configuration ||= Configuration.new
      yield(configuration) if block_given?
    end

    class Configuration
      attr_accessor :terminal, :output

      # defaults
      # see https://github.com/rdp/ruby_gnuplot/blob/master/examples/output_image_file.rb
      # or http://mibai.tec.u-ryukyu.ac.jp/~oshiro/Doc/gnuplot_primer/gptermcmp.html
      def initialize
        @terminal = 'x11'
        @output = '.'
      end
    end
  end
end
