module Grade
  TEXT = %w(教員 B1 B2 B3 B4 M1 M2 D1 D2 D3)
  SELECT = [
    ['教員', 0],
    ['B1', 1], ['B2', 2], ['B3', 3], ['B4', 4],
    ['M1', 5], ['M2', 6],
    ['D1', 7], ['D2', 8], ['D3', 9]
  ]

  def self.included(base)
    base.class_eval do
      validates :grade, inclusion: { in: 0..9 }

      public

      def grade_text
        TEXT[self.grade]
      end
    end
  end
end
