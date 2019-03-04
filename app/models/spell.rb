class Spell < ApplicationRecord

  def next
    begin 
      s = Spell.find(self.id+1)
    rescue
      return Spell.find(Spell.minimum(:id))
    end
  end

  def previous
    begin 
      s = Spell.find(self.id-1)
    rescue
      return Spell.find(Spell.maximum(:id))
    end
  end
end
