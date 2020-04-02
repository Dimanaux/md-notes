module Notes
  class Find
    def initialize(params)
      self.params = DEFAULTS.merge(params)
    end

    def call
      Note.where(
        "title LIKE lower(?) AND content LIKE lower(?)",
        like(params['title']),
        like(params['content'])
      )
    end

    private

    DEFAULTS = { 'title' => '', 'content' => '' }

    attr_accessor :params

    def like(string)
      "%#{string.downcase}%"
    end
  end
end
