require 'cinch'

module Cinch::Plugins
  class Piga

    include Cinch::Plugin

    match /piga/

    def execute(m)
      result = []
      # poorman's weighting, but it does the trick
      letters = %W{b b b b b b b b b b b b b b b b b b b c c c c c c c d d d e f f f f f g g g h h h h h h h h j j l l l l l m m m m m m m n n n n n n n o p p p p p p p r r r r r r r r t t t t t t t t t t t t t t u u u u u w w w y z}
      while result.length < 1
        letter = letters[rand(0..letters.length-1)]
        result = `grep -i piga#{letter} data/learned_knowledge`.split(/\n/)
      end
      m.reply result[rand(0..result.length-1)]
    end

  end
end