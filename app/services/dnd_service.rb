require 'open-uri'

class DNDService
  include Singleton

  BASE_URL = "http://dnd5eapi.co/api/"

  def spell_count
    api('spells')['count']
  end

  def retrieve_spell(spell_id)
    api("spells/#{spell_id}")
  end

  private

  def api(path)
    JSON.load(open(BASE_URL + path))
  end
end