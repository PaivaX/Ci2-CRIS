class Report <Article

    #definir os campos que ficam com nil
    validates :journal_name, presence: false
    validates :volume, presence: false
    validates :issue, presence: false
    validates :proceedings, presence: false
    validates :place, presence: false
    validates :edition, presence: false
    validates :publisher, presence: false
    validates :departement, presence: false
    validates :university, presence: false
    validates :thesis_type, presence: false
end