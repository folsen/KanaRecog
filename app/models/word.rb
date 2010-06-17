class Word < ActiveRecord::Base
  KINDS = {
    :hiragana => 0,
    :katakana => 1,
    :both     => 2
  }
end
