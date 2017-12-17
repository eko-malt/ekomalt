class Soak < ApplicationRecord
  has_many :grain_to_soaks

  enum vat: { v1: 1, v2: 2, v3: 3, v4: 4, v5: 5 }
  enum status: { init: 0, process: 1, finished: 2, archived: 3 }
end
